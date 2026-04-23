// run-seed.js - 通过 typeorm 使用的 sqlite3 驱动执行 seed SQL
const sqlite3 = require('sqlite3').verbose();
const fs = require('fs');
const path = require('path');

const dbPath = path.join(__dirname, 'gps_tracker.db');
const sqlFile = path.join(__dirname, 'seed-data.sql');

const sql = fs.readFileSync(sqlFile, 'utf-8');
const statements = sql.split(';\n').filter(s => s.trim());

const db = new sqlite3.Database(dbPath, (err) => {
  if (err) { console.error('Open DB error:', err); process.exit(1); }
  console.log(`Connected to ${dbPath}`);
  console.log(`Executing ${statements.length} statements...`);

  db.serialize(() => {
    db.run('BEGIN TRANSACTION');
    let success = 0;
    let errors = 0;
    for (const stmt of statements) {
      db.run(stmt + ';', (err) => {
        if (err) {
          errors++;
          if (errors <= 3) console.error('  Error:', err.message, '\n  SQL:', stmt.substring(0, 100));
        } else {
          success++;
        }
      });
    }
    db.run('COMMIT', () => {
      console.log(`Done: ${success} succeeded, ${errors} failed`);
      db.close();
    });
  });
});

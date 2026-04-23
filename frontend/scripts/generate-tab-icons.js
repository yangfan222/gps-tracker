// generate-tab-icons.js - Generate proper tab bar PNG icons
// Uses raw PNG generation without external dependencies
const fs = require('fs')
const path = require('path')

// Minimal PNG encoder (no dependencies needed)
function createPNG(width, height, drawFn) {
  const pixels = new Uint8Array(width * height * 4)
  // Fill transparent
  pixels.fill(0)
  
  drawFn(pixels, width, height)
  
  // Build PNG file
  const signature = Buffer.from([137, 80, 78, 71, 13, 10, 26, 10])
  
  // IHDR chunk
  const ihdr = Buffer.alloc(13)
  ihdr.writeUInt32BE(width, 0)
  ihdr.writeUInt32BE(height, 4)
  ihdr[8] = 8 // bit depth
  ihdr[9] = 6 // color type: RGBA
  ihdr[10] = 0 // compression
  ihdr[11] = 0 // filter
  ihdr[12] = 0 // interlace
  const ihdrChunk = makeChunk('IHDR', ihdr)
  
  // IDAT chunk - raw pixel data with filter bytes
  const rawData = Buffer.alloc(height * (1 + width * 4))
  for (let y = 0; y < height; y++) {
    rawData[y * (1 + width * 4)] = 0 // filter: none
    for (let x = 0; x < width; x++) {
      const srcIdx = (y * width + x) * 4
      const dstIdx = y * (1 + width * 4) + 1 + x * 4
      rawData[dstIdx] = pixels[srcIdx]
      rawData[dstIdx + 1] = pixels[srcIdx + 1]
      rawData[dstIdx + 2] = pixels[srcIdx + 2]
      rawData[dstIdx + 3] = pixels[srcIdx + 3]
    }
  }
  
  const zlib = require('zlib')
  const compressed = zlib.deflateSync(rawData)
  const idatChunk = makeChunk('IDAT', compressed)
  
  // IEND chunk
  const iendChunk = makeChunk('IEND', Buffer.alloc(0))
  
  return Buffer.concat([signature, ihdrChunk, idatChunk, iendChunk])
}

function makeChunk(type, data) {
  const buf = Buffer.alloc(4 + 4 + data.length + 4)
  buf.writeUInt32BE(data.length, 0)
  buf.write(type, 4)
  if (data.length > 0) {
    if (Buffer.isBuffer(data)) data.copy(buf, 8)
    else Buffer.from(data).copy(buf, 8)
  }
  
  // CRC32
  const crcData = buf.slice(4, 8 + data.length)
  const crc = crc32(crcData)
  buf.writeInt32BE(crc, 8 + data.length)
  
  return buf
}

// CRC32 lookup table
const crcTable = new Int32Array(256)
for (let n = 0; n < 256; n++) {
  let c = n
  for (let k = 0; k < 8; k++) {
    if (c & 1) c = 0xedb88320 ^ (c >>> 1)
    else c = c >>> 1
  }
  crcTable[n] = c
}

function crc32(buf) {
  let crc = -1
  for (let i = 0; i < buf.length; i++) {
    crc = crcTable[(crc ^ buf[i]) & 0xff] ^ (crc >>> 8)
  }
  return crc ^ -1
}

// Drawing helpers
function setPixel(pixels, w, x, y, r, g, b, a) {
  if (x < 0 || x >= w || y < 0 || y >= w) return
  const idx = (y * w + x) * 4
  // Alpha blending
  const srcA = a / 255
  const dstA = pixels[idx + 3] / 255
  const outA = srcA + dstA * (1 - srcA)
  if (outA > 0) {
    pixels[idx] = Math.round((r * srcA + pixels[idx] * dstA * (1 - srcA)) / outA)
    pixels[idx + 1] = Math.round((g * srcA + pixels[idx + 1] * dstA * (1 - srcA)) / outA)
    pixels[idx + 2] = Math.round((b * srcA + pixels[idx + 2] * dstA * (1 - srcA)) / outA)
    pixels[idx + 3] = Math.round(outA * 255)
  }
}

function fillCircle(pixels, w, cx, cy, radius, r, g, b, a) {
  for (let y = Math.floor(cy - radius - 1); y <= Math.ceil(cy + radius + 1); y++) {
    for (let x = Math.floor(cx - radius - 1); x <= Math.ceil(cx + radius + 1); x++) {
      const dist = Math.sqrt((x - cx) ** 2 + (y - cy) ** 2)
      if (dist <= radius) {
        const edge = Math.max(0, Math.min(1, radius - dist + 0.5))
        setPixel(pixels, w, x, y, r, g, b, Math.round(a * edge))
      }
    }
  }
}

function drawLine(pixels, w, x1, y1, x2, y2, thickness, r, g, b, a) {
  const len = Math.sqrt((x2 - x1) ** 2 + (y2 - y1) ** 2)
  const steps = Math.ceil(len * 2)
  for (let i = 0; i <= steps; i++) {
    const t = i / steps
    const cx = x1 + (x2 - x1) * t
    const cy = y1 + (y2 - y1) * t
    fillCircle(pixels, w, cx, cy, thickness / 2, r, g, b, a)
  }
}

const SIZE = 81
const assetsDir = path.join(__dirname, '..', 'src', 'assets')

// Icon 1: Location pin
function drawLocationPin(pixels, w, h, r, g, b) {
  const cx = w / 2
  // Draw pin body (teardrop shape)
  for (let y = 0; y < h; y++) {
    for (let x = 0; x < w; x++) {
      const nx = (x - cx) / (w * 0.3)
      const headY = h * 0.38
      const ny = (y - headY) / (h * 0.3)
      
      // Circle head
      const distHead = Math.sqrt(nx * nx + ny * ny)
      if (distHead <= 1) {
        const edge = Math.max(0, Math.min(1, 1 - distHead + 0.05))
        setPixel(pixels, w, x, y, r, g, b, Math.round(255 * edge))
      }
      
      // Triangle tail
      const tailTop = h * 0.55
      const tailBottom = h * 0.82
      if (y >= tailTop && y <= tailBottom) {
        const progress = (y - tailTop) / (tailBottom - tailTop)
        const halfWidth = w * 0.23 * (1 - progress)
        if (Math.abs(x - cx) <= halfWidth) {
          const edge = Math.max(0, Math.min(1, halfWidth - Math.abs(x - cx) + 0.5))
          setPixel(pixels, w, x, y, r, g, b, Math.round(255 * edge))
        }
      }
    }
  }
  
  // Inner circle (white hole)
  fillCircle(pixels, w, cx, h * 0.38, w * 0.12, 255, 255, 255, 255)
}

// Icon 2: Grid (4 squares)
function drawGrid(pixels, w, h, r, g, b) {
  const pad = w * 0.18
  const gap = w * 0.1
  const cellW = (w - pad * 2 - gap) / 2
  const radius = cellW * 0.2
  
  const positions = [
    [pad, pad],
    [pad + cellW + gap, pad],
    [pad, pad + cellW + gap],
    [pad + cellW + gap, pad + cellW + gap],
  ]
  
  for (const [sx, sy] of positions) {
    for (let y = Math.floor(sy); y < Math.ceil(sy + cellW); y++) {
      for (let x = Math.floor(sx); x < Math.ceil(sx + cellW); x++) {
        // Rounded rect check
        let inside = true
        const corners = [
          [sx + radius, sy + radius],
          [sx + cellW - radius, sy + radius],
          [sx + radius, sy + cellW - radius],
          [sx + cellW - radius, sy + cellW - radius],
        ]
        
        for (const [ccx, ccy] of corners) {
          if ((x < sx + radius || x > sx + cellW - radius) && 
              (y < sy + radius || y > sy + cellW - radius)) {
            const dist = Math.sqrt((x - ccx) ** 2 + (y - ccy) ** 2)
            if (dist > radius + 0.5) { inside = false; break }
          }
        }
        
        if (inside && x >= sx && x <= sx + cellW && y >= sy && y <= sy + cellW) {
          setPixel(pixels, w, x, y, r, g, b, 230)
        }
      }
    }
  }
}

// Icon 3: User silhouette
function drawUser(pixels, w, h, r, g, b) {
  const cx = w / 2
  // Head circle
  fillCircle(pixels, w, cx, h * 0.32, w * 0.17, r, g, b, 240)
  
  // Body (arc/shoulders)
  for (let y = Math.floor(h * 0.58); y < Math.ceil(h * 0.85); y++) {
    for (let x = 0; x < w; x++) {
      const nx = (x - cx) / (w * 0.38)
      const ny = (y - h * 0.58) / (h * 0.35)
      // Ellipse for shoulders/body
      const dist = nx * nx + (ny - 0.5) * (ny - 0.5) * 3
      if (dist <= 1 && ny >= 0) {
        const edge = Math.max(0, Math.min(1, 1 - dist + 0.05))
        setPixel(pixels, w, x, y, r, g, b, Math.round(240 * edge))
      }
    }
  }
}

// Generate all 6 icons
const icons = [
  { name: 'tab-location', draw: drawLocationPin },
  { name: 'tab-function', draw: drawGrid },
  { name: 'tab-profile', draw: drawUser },
]

const normalColor = [153, 153, 153]   // #999
const activeColor = [24, 144, 255]     // #1890ff

for (const icon of icons) {
  // Normal state
  const normalPng = createPNG(SIZE, SIZE, (px, w, h) => {
    icon.draw(px, w, h, ...normalColor)
  })
  fs.writeFileSync(path.join(assetsDir, `${icon.name}.png`), normalPng)
  
  // Active state
  const activePng = createPNG(SIZE, SIZE, (px, w, h) => {
    icon.draw(px, w, h, ...activeColor)
  })
  fs.writeFileSync(path.join(assetsDir, `${icon.name}-active.png`), activePng)
  
  console.log(`Generated ${icon.name}.png and ${icon.name}-active.png`)
}

console.log('All tab icons generated!')

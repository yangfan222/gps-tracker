module.exports = {
  env: {
    NODE_ENV: '"production"'
  },
  defineConstants: {
    'process.env.TARO_APP_API_URL': JSON.stringify(process.env.TARO_APP_API_URL || '/api'),
    'process.env.TARO_APP_WS_URL': JSON.stringify(process.env.TARO_APP_WS_URL || ''),
  },
  mini: {},
  h5: {
    enableExtract: true
  }
}

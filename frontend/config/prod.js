module.exports = {
  env: {
    NODE_ENV: '"production"'
  },
  defineConstants: {
    'process.env.TARO_APP_API_URL': JSON.stringify(process.env.TARO_APP_API_URL || 'http://1.94.48.15:3000/api'),
    'process.env.TARO_APP_WS_URL': JSON.stringify(process.env.TARO_APP_WS_URL || 'http://1.94.48.15:3000'),
  },
  mini: {},
  h5: {
    enableExtract: true
  }
}

import { io, Socket } from 'socket.io-client'

// Use current page origin for WebSocket (same port when served from NestJS)
function getWsUrl() {
  if (typeof window === 'undefined') return ''
  return process.env.TARO_APP_WS_URL || window.location.origin
}

let socket: Socket | null = null

export function connectWebSocket(deviceId: string) {
  if (socket) {
    socket.disconnect()
  }

  socket = io(getWsUrl(), {
    query: { deviceId },
    transports: ['websocket', 'polling'],
  })

  socket.on('connect', () => {
    console.log('WebSocket connected')
  })

  socket.on('disconnect', () => {
    console.log('WebSocket disconnected')
  })

  return socket
}

export function onLocationUpdate(deviceId: string, callback: (data: any) => void) {
  if (!socket) return
  socket.on(`location:${deviceId}`, callback)
}

export function onAlarmUpdate(deviceId: string, callback: (data: any) => void) {
  if (!socket) return
  socket.on(`alarm:${deviceId}`, callback)
}

export function onDeviceStatus(deviceId: string, callback: (data: any) => void) {
  if (!socket) return
  socket.on(`status:${deviceId}`, callback)
}

export function disconnectWebSocket() {
  if (socket) {
    socket.disconnect()
    socket = null
  }
}

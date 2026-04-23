import Taro from '@tarojs/taro'

const BASE_URL = process.env.TARO_APP_API_URL || 'http://1.94.48.15:3000/api'

interface RequestOptions {
  url: string
  method?: 'GET' | 'POST' | 'PUT' | 'DELETE'
  data?: any
  needAuth?: boolean
}

export async function request<T = any>(options: RequestOptions): Promise<T> {
  const { url, method = 'GET', data, needAuth = true } = options
  const headers: Record<string, string> = {
    'Content-Type': 'application/json; charset=utf-8',
  }

  if (needAuth) {
    const token = Taro.getStorageSync('token')
    if (token) {
      headers['Authorization'] = `Bearer ${token}`
    }
  }

  const fullUrl = `${BASE_URL}${url}`

  try {
    const fetchOptions: RequestInit = {
      method,
      headers,
    }
    if (data && method !== 'GET') {
      fetchOptions.body = JSON.stringify(data)
    }

    const res = await fetch(fullUrl, fetchOptions)
    const resData = await res.json().catch(() => ({}))

    if (res.status === 401 && needAuth) {
      Taro.removeStorageSync('token')
      Taro.redirectTo({ url: '/pages/login/index' }).catch(() => {})
      throw new Error('登录已过期，请重新登录')
    }

    if (res.status >= 400) {
      throw new Error(resData?.message || '请求失败')
    }

    return resData as T
  } catch (err: any) {
    const message = err?.message || '网络错误'
    Taro.showToast({ title: message, icon: 'none', duration: 3000 })
    throw err instanceof Error ? err : new Error(message)
  }
}

// Auth API
export const authApi = {
  login: (data: { username: string; password: string }) =>
    request({ url: '/auth/login', method: 'POST', data, needAuth: false }),

  register: (data: { username: string; password: string; phone?: string }) =>
    request({ url: '/auth/register', method: 'POST', data, needAuth: false }),

  getProfile: () =>
    request({ url: '/auth/profile' }),

  changePassword: (data: { oldPassword: string; newPassword: string }) =>
    request({ url: '/auth/password', method: 'PUT', data }),
}

// Device API
export const deviceApi = {
  getDevices: () =>
    request({ url: '/device' }),

  getDevice: (deviceId: string) =>
    request({ url: `/device/${deviceId}` }),

  addDevice: (data: { deviceId: string; deviceName?: string; simNumber?: string }) =>
    request({ url: '/device', method: 'POST', data }),

  updateDevice: (deviceId: string, data: any) =>
    request({ url: `/device/${deviceId}`, method: 'PUT', data }),

  removeDevice: (deviceId: string) =>
    request({ url: `/device/${deviceId}`, method: 'DELETE' }),

  activateDevice: (data: { deviceId: string; simNumber?: string; iccid?: string }) =>
    request({ url: '/device/activate', method: 'POST', data }),
}

// Location API
export const locationApi = {
  getLatest: (deviceId: string) =>
    request({ url: `/location/${deviceId}/latest` }),

  getHistory: (deviceId: string, startTime: string, endTime: string) =>
    request({ url: `/location/${deviceId}/history?startTime=${startTime}&endTime=${endTime}` }),

  getDailyMileage: (deviceId: string, date: string) =>
    request({ url: `/location/${deviceId}/mileage?date=${date}` }),
}

// Track API
export const trackApi = {
  getTrack: (deviceId: string, startTime: string, endTime: string) =>
    request({ url: `/track/${deviceId}?startTime=${startTime}&endTime=${endTime}` }),
}

// Command API
export const commandApi = {
  send: (deviceId: string, commandType: string, commandData?: any) =>
    request({ url: `/command/${deviceId}`, method: 'POST', data: { commandType, commandData } }),

  getCommands: (deviceId: string) =>
    request({ url: `/command/${deviceId}` }),
}

// Geofence API
export const geofenceApi = {
  getByDevice: (deviceId: string) =>
    request({ url: `/geofence/${deviceId}` }),

  create: (deviceId: string, data: any) =>
    request({ url: `/geofence/${deviceId}`, method: 'POST', data }),

  update: (id: number, data: any) =>
    request({ url: `/geofence/${id}`, method: 'PUT', data }),

  remove: (id: number) =>
    request({ url: `/geofence/${id}`, method: 'DELETE' }),
}

// Alarm API
export const alarmApi = {
  getAlarms: (deviceId: string, page = 1) =>
    request({ url: `/alarm/${deviceId}?page=${page}` }),

  getUnreadCount: (deviceId: string) =>
    request({ url: `/alarm/${deviceId}/unread` }),

  markAsRead: (id: number) =>
    request({ url: `/alarm/${id}/read`, method: 'PUT' }),
}

// SimCard API
export const simCardApi = {
  getByDevice: (deviceId: string) =>
    request({ url: `/sim-card/${deviceId}` }),

  create: (deviceId: string, data: any) =>
    request({ url: `/sim-card/${deviceId}`, method: 'POST', data }),

  activate: (deviceId: string) =>
    request({ url: `/sim-card/${deviceId}/activate`, method: 'PUT' }),

  createRechargeOrder: (deviceId: string, packageId: string) =>
    request({ url: `/sim-card/${deviceId}/recharge`, method: 'POST', data: { packageId } }),

  confirmRechargeOrder: (orderId: number) =>
    request({ url: `/sim-card/recharge/${orderId}/confirm`, method: 'PUT' }),

  getRechargeOrders: (deviceId: string) =>
    request({ url: `/sim-card/${deviceId}/recharge-orders` }),
}

// Report API
export const reportApi = {
  getDriving: (deviceId: string, startTime: string, endTime: string) =>
    request({ url: `/report/${deviceId}/driving?startTime=${startTime}&endTime=${endTime}` }),

  getParking: (deviceId: string, startTime: string, endTime: string) =>
    request({ url: `/report/${deviceId}/parking?startTime=${startTime}&endTime=${endTime}` }),

  getMileage: (deviceId: string, startDate: string, endDate: string) =>
    request({ url: `/report/${deviceId}/mileage?startDate=${startDate}&endDate=${endDate}` }),
}

// Share API
export const shareApi = {
  /** 创建分享链接 */
  createShare: (deviceId: string, hours = 24) =>
    request({ url: `/share/${deviceId}`, method: 'POST', data: { hours } }),

  /** 停止分享 */
  stopShare: (deviceId: string) =>
    request({ url: `/share/${deviceId}/stop`, method: 'PUT' }),

  /** 获取当前分享状态 */
  getShareStatus: (deviceId: string) =>
    request({ url: `/share/${deviceId}/status` }),

  /** 访客查看分享位置(无需登录) */
  viewShare: (token: string) =>
    request({ url: `/share/view/${token}`, needAuth: false }),
}

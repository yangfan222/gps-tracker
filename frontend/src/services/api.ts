import Taro from '@tarojs/taro'

const BASE_URL = process.env.TARO_APP_API_URL || '/api'

interface RequestOptions {
  url: string
  method?: 'GET' | 'POST' | 'PUT' | 'DELETE'
  data?: any
  needAuth?: boolean
}

export async function request<T = any>(options: RequestOptions): Promise<T> {
  const { url, method = 'GET', data, needAuth = true } = options
  const header: Record<string, string> = {
    'Content-Type': 'application/json',
  }

  if (needAuth) {
    const token = Taro.getStorageSync('token')
    if (token) {
      header['Authorization'] = `Bearer ${token}`
    }
  }

  try {
    const res = await Taro.request({
      url: `${BASE_URL}${url}`,
      method,
      data,
      header,
    })

    if (res.statusCode === 401) {
      Taro.removeStorageSync('token')
      Taro.redirectTo({ url: '/pages/login/index' }).catch(() => {})
      throw new Error('未授权，请重新登录')
    }

    if (res.statusCode >= 400) {
      throw new Error(res.data?.message || '请求失败')
    }

    return res.data as T
  } catch (err: any) {
    const message = err?.message || err?.errMsg || '网络错误'
    Taro.showToast({ title: message, icon: 'none' })
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

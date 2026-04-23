import { create } from 'zustand'

interface DeviceInfo {
  id: number
  deviceId: string
  deviceName: string
  status: string
  latitude: number
  longitude: number
  speed: number
  batteryLevel: number
  signalStrength: number
  locationType: string
  address: string
  workMode: string
  totalMileage: number
  dailyMileage: number
  lastOnlineTime: string
}

interface UserInfo {
  id: number
  username: string
  userType: string
}

interface AppState {
  // User
  user: UserInfo | null
  token: string | null
  setUser: (user: UserInfo | null) => void
  setToken: (token: string | null) => void

  // Device
  currentDevice: DeviceInfo | null
  devices: DeviceInfo[]
  setCurrentDevice: (device: DeviceInfo | null) => void
  setDevices: (devices: DeviceInfo[]) => void
  updateDeviceLocation: (deviceId: string, data: Partial<DeviceInfo>) => void

  // Settings
  refreshInterval: number
  setRefreshInterval: (interval: number) => void
}

export const useStore = create<AppState>((set, get) => ({
  // User
  user: null,
  token: null,
  setUser: (user) => set({ user }),
  setToken: (token) => set({ token }),

  // Device
  currentDevice: null,
  devices: [],
  setCurrentDevice: (device) => set({ currentDevice: device }),
  setDevices: (devices) => set({ devices }),
  updateDeviceLocation: (deviceId, data) => {
    const { devices, currentDevice } = get()
    const updated = devices.map(d =>
      d.deviceId === deviceId ? { ...d, ...data } : d
    )
    set({ devices: updated })
    if (currentDevice?.deviceId === deviceId) {
      set({ currentDevice: { ...currentDevice, ...data } })
    }
  },

  // Settings
  refreshInterval: 5000,
  setRefreshInterval: (interval) => set({ refreshInterval: interval }),
}))

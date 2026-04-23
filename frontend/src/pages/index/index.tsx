import { useEffect, useState, useRef } from 'react'
import { View, Text } from '@tarojs/components'
import Taro from '@tarojs/taro'
import { deviceApi, commandApi } from '../../services/api'
import { connectWebSocket, onLocationUpdate, disconnectWebSocket } from '../../services/websocket'
import { useStore } from '../../store'
import MapView from '../../components/MapView'
import Icon from '../../components/Icon'
import './index.scss'

export default function IndexPage() {
  const { currentDevice, devices, setCurrentDevice, setDevices, updateDeviceLocation } = useStore()
  const [loading, setLoading] = useState(false)
  const [showDeviceList, setShowDeviceList] = useState(false)
  const timerRef = useRef<any>(null)

  useEffect(() => {
    const token = Taro.getStorageSync('token')
    if (!token) {
      Taro.redirectTo({ url: '/pages/login/index' }).catch(() => {})
      return
    }
    loadDevices()
    return () => {
      if (timerRef.current) clearInterval(timerRef.current)
      disconnectWebSocket()
    }
  }, [])

  useEffect(() => {
    if (currentDevice) {
      refreshLocation()
      timerRef.current = setInterval(refreshLocation, 10000)

      if (typeof window !== 'undefined') {
        connectWebSocket(currentDevice.deviceId)
        onLocationUpdate(currentDevice.deviceId, (data) => {
          updateDeviceLocation(currentDevice.deviceId, data)
        })
      }

      return () => {
        if (timerRef.current) clearInterval(timerRef.current)
      }
    }
  }, [currentDevice?.deviceId])

  const loadDevices = async () => {
    try {
      const list = await deviceApi.getDevices()
      setDevices(list)
      if (list.length > 0) setCurrentDevice(list[0])
    } catch (err) {}
  }

  const refreshLocation = async () => {
    if (!currentDevice) return
    try {
      const device = await deviceApi.getDevice(currentDevice.deviceId)
      setCurrentDevice(device)
    } catch (err) {}
  }

  const handleLocateCommand = async () => {
    if (!currentDevice) return
    setLoading(true)
    Taro.showToast({ title: '正在下发定位...', icon: 'loading', duration: 3000 })
    try {
      await commandApi.send(currentDevice.deviceId, 'locate')
      setTimeout(refreshLocation, 3000)
    } catch (err) {}
    setLoading(false)
  }

  const formatTime = (time: string) => {
    if (!time) return '--'
    const d = new Date(time)
    return `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}-${String(d.getDate()).padStart(2, '0')} ${String(d.getHours()).padStart(2, '0')}:${String(d.getMinutes()).padStart(2, '0')}:${String(d.getSeconds()).padStart(2, '0')}`
  }

  const getStatusColor = (status: string) => status === 'online' ? '#52c41a' : '#999'

  return (
    <View className='index-page'>
      <View className='map-container'>
        {typeof window !== 'undefined' && currentDevice ? (
          <MapView
            latitude={currentDevice.latitude || 22.5431}
            longitude={currentDevice.longitude || 114.0579}
            deviceName={currentDevice.deviceName || currentDevice.deviceId}
          />
        ) : (
          <View className='map-placeholder'>
            <View className='map-inner'>
              {currentDevice ? (
                <View className='map-content'>
                  <Text className='coord-text'>
                    {currentDevice.latitude?.toFixed(6) || '0.000000'}, {currentDevice.longitude?.toFixed(6) || '0.000000'}
                  </Text>
                  <View className='device-marker'>
                    <View className='marker-dot' />
                    <Text className='marker-label'>{currentDevice.deviceName || currentDevice.deviceId}</Text>
                  </View>
                </View>
              ) : (
                <View className='no-device'>
                  <Icon name='map-pin' size={80} color='#ccc' />
                  <Text className='no-device-text'>暂无设备</Text>
                  <Text className='no-device-hint'>请先添加定位设备</Text>
                </View>
              )}
            </View>
          </View>
        )}

        <View className='map-controls'>
          <View className='control-btn' onClick={handleLocateCommand}>
            <Icon name='crosshair' size={36} color='#1890ff' />
            <Text className='control-text'>定位</Text>
          </View>
          <View className='control-btn' onClick={refreshLocation}>
            <Icon name='refresh-cw' size={36} color='#1890ff' />
            <Text className='control-text'>刷新</Text>
          </View>
        </View>

        {devices.length > 1 && (
          <View className='device-switch' onClick={() => setShowDeviceList(!showDeviceList)}>
            <Text className='switch-text'>{currentDevice?.deviceName || '选择设备'}</Text>
            <Icon name='chevron-down' size={24} color='#999' />
          </View>
        )}

        {showDeviceList && (
          <View className='device-list-overlay' onClick={() => setShowDeviceList(false)}>
            <View className='device-list' onClick={e => e.stopPropagation()}>
              {devices.map(d => (
                <View
                  key={d.deviceId}
                  className={`device-item ${currentDevice?.deviceId === d.deviceId ? 'active' : ''}`}
                  onClick={() => { setCurrentDevice(d); setShowDeviceList(false) }}
                >
                  <Text className='device-name'>{d.deviceName}</Text>
                  <Text className='device-id'>{d.deviceId}</Text>
                  <View className={`device-status ${d.status}`} />
                </View>
              ))}
            </View>
          </View>
        )}
      </View>

      {currentDevice && (
        <View className='device-panel'>
          <View className='panel-handle' />
          <View className='panel-status'>
            <View className='status-left'>
              <Text className='time-text'>{formatTime(currentDevice.lastOnlineTime)}</Text>
              <View className='status-badge' style={{ backgroundColor: getStatusColor(currentDevice.status) }}>
                <Text className='status-text'>{currentDevice.status === 'online' ? '在线' : '离线'}</Text>
              </View>
            </View>
            <View className='status-right'>
              <Icon name='signal' size={24} color='#666' />
              <Text className='signal-text'>{currentDevice.signalStrength || 0}%</Text>
              <Icon name='battery' size={24} color='#666' />
              <Text className='battery-text'>{currentDevice.batteryLevel || 0}%</Text>
            </View>
          </View>

          <View className='panel-info'>
            <View className='info-row'>
              <Text className='info-label'>设备ID</Text>
              <Text className='info-value'>{currentDevice.deviceId}</Text>
            </View>
            <View className='info-row'>
              <Text className='info-label'>定位方式</Text>
              <Text className='info-value'>{currentDevice.locationType || 'GPS'}</Text>
            </View>
            <View className='info-row'>
              <Text className='info-label'>速度</Text>
              <Text className='info-value'>{currentDevice.speed || 0} km/h</Text>
            </View>
            <View className='info-row'>
              <Text className='info-label'>今日里程</Text>
              <Text className='info-value'>{currentDevice.dailyMileage || 0} km</Text>
            </View>
            <View className='info-row'>
              <Text className='info-label'>工作模式</Text>
              <Text className='info-value'>
                {currentDevice.workMode === 'normal' ? '常规30s' :
                 currentDevice.workMode === 'powersave' ? '省电5min' : '超级省电'}
              </Text>
            </View>
            <View className='info-row full'>
              <Text className='info-label'>地址</Text>
              <Text className='info-value'>{currentDevice.address || '获取中...'}</Text>
            </View>
          </View>

          <View className='panel-actions'>
            <View className='action-btn' onClick={() => Taro.navigateTo({ url: `/pages/track/index?deviceId=${currentDevice.deviceId}` })}>
              <View className='action-icon track'>
                <Icon name='route' size={32} color='#fff' />
              </View>
              <Text className='action-text'>轨迹</Text>
            </View>
            <View className='action-btn' onClick={() => Taro.navigateTo({ url: `/pages/settings/index?deviceId=${currentDevice.deviceId}` })}>
              <View className='action-icon settings'>
                <Icon name='settings' size={32} color='#fff' />
              </View>
              <Text className='action-text'>设置</Text>
            </View>
            <View className='action-btn' onClick={() => Taro.navigateTo({ url: `/pages/detail/index?deviceId=${currentDevice.deviceId}` })}>
              <View className='action-icon detail'>
                <Icon name='info' size={32} color='#fff' />
              </View>
              <Text className='action-text'>详情</Text>
            </View>
            <View className='action-btn' onClick={() => Taro.navigateTo({ url: `/pages/share/index?deviceId=${currentDevice.deviceId}` })}>
              <View className='action-icon share'>
                <Icon name='share' size={32} color='#fff' />
              </View>
              <Text className='action-text'>分享</Text>
            </View>
          </View>
        </View>
      )}

      {!currentDevice && devices.length === 0 && (
        <View className='empty-actions'>
          <View
            className='add-device-btn'
            onClick={() => Taro.navigateTo({ url: '/pages/add-device/index' })}
          >
            <Icon name='plus' size={32} color='#fff' />
            <Text className='add-text'>添加设备</Text>
          </View>
        </View>
      )}
    </View>
  )
}

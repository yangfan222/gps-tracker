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

  const handleNavigate = () => {
    if (!currentDevice?.latitude || !currentDevice?.longitude) {
      Taro.showToast({ title: '暂无位置信息', icon: 'none' })
      return
    }
    Taro.showActionSheet({
      itemList: ['高德地图', '百度地图', '腾讯地图'],
      success: (res) => {
        const lat = currentDevice.latitude
        const lng = currentDevice.longitude
        const name = currentDevice.deviceName || currentDevice.deviceId
        let url = ''
        if (res.tapIndex === 0) {
          url = `https://uri.amap.com/marker?position=${lng},${lat}&name=${name}`
        } else if (res.tapIndex === 1) {
          url = `http://api.map.baidu.com/marker?location=${lat},${lng}&title=${name}&output=html`
        } else {
          url = `https://apis.map.qq.com/uri/v1/marker?marker=coord:${lat},${lng};title:${name}`
        }
        if (typeof window !== 'undefined') {
          window.open(url, '_blank')
        }
      }
    })
  }

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
                  <Icon name='map-pin' size={120} color='#ccc' />
                  <Text className='no-device-text'>暂无设备</Text>
                  <Text className='no-device-hint'>请先添加您的定位设备</Text>
                </View>
              )}
            </View>
          </View>
        )}

        <View className='map-controls'>
          <View className='control-btn' onClick={handleLocateCommand}>
            <Icon name='crosshair' size={44} color='#00C853' />
            <Text className='control-text'>定位</Text>
          </View>
          <View className='control-btn' onClick={refreshLocation}>
            <Icon name='refresh-cw' size={44} color='#00C853' />
            <Text className='control-text'>刷新</Text>
          </View>
        </View>

        {devices.length > 1 && (
          <View className='device-switch' onClick={() => setShowDeviceList(!showDeviceList)}>
            <Icon name='smartphone' size={28} color='#00C853' />
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
                  <View className={`device-status-dot ${d.status}`} />
                  <View className='device-info'>
                    <Text className='device-name'>{d.deviceName}</Text>
                    <Text className='device-id'>{d.deviceId}</Text>
                  </View>
                  {currentDevice?.deviceId === d.deviceId && (
                    <Icon name='check' size={32} color='#00C853' />
                  )}
                </View>
              ))}
            </View>
          </View>
        )}
      </View>

      {currentDevice && (
        <View className='device-panel'>
          <View className='panel-handle' />

          <View className='panel-header'>
            <View className='header-left'>
              <Text className='device-name-text'>{currentDevice.deviceName || currentDevice.deviceId}</Text>
              <View className={`online-badge ${currentDevice.status}`}>
                <Text className='online-dot-char'>{'\u25CF'}</Text>
                <Text className='online-text'>{currentDevice.status === 'online' ? '在线' : '离线'}</Text>
              </View>
            </View>
            <View className='header-right'>
              <View className='status-item'>
                <Icon name='signal' size={28} color='#666' />
                <Text className='status-val'>{currentDevice.signalStrength || 0}%</Text>
              </View>
              <View className='status-item'>
                <Icon name='battery' size={28} color={currentDevice.batteryLevel > 20 ? '#00C853' : '#FF3D00'} />
                <Text className='status-val'>{currentDevice.batteryLevel || 0}%</Text>
              </View>
            </View>
          </View>

          <View className='panel-time'>
            <Icon name='clock' size={22} color='#999' />
            <Text className='time-text'>{formatTime(currentDevice.lastOnlineTime)}</Text>
          </View>

          <View className='panel-info'>
            <View className='info-row'>
              <Text className='info-label'>速度</Text>
              <Text className='info-value'>{currentDevice.speed || 0} km/h</Text>
            </View>
            <View className='info-row'>
              <Text className='info-label'>今日里程</Text>
              <Text className='info-value'>{currentDevice.dailyMileage || 0} km</Text>
            </View>
            <View className='info-row full'>
              <Text className='info-label'>地址</Text>
              <Text className='info-value address'>{currentDevice.address || '获取中...'}</Text>
            </View>
          </View>

          <View className='panel-actions'>
            <View className='action-btn' onClick={() => Taro.navigateTo({ url: `/pages/track/index?deviceId=${currentDevice.deviceId}` })}>
              <View className='action-icon track'>
                <Icon name='route' size={48} color='#fff' />
              </View>
              <Text className='action-text'>轨迹</Text>
            </View>
            <View className='action-btn' onClick={() => Taro.navigateTo({ url: `/pages/settings/index?deviceId=${currentDevice.deviceId}` })}>
              <View className='action-icon settings'>
                <Icon name='settings' size={48} color='#fff' />
              </View>
              <Text className='action-text'>设置</Text>
            </View>
            <View className='action-btn' onClick={() => Taro.navigateTo({ url: `/pages/detail/index?deviceId=${currentDevice.deviceId}` })}>
              <View className='action-icon detail'>
                <Icon name='info' size={36} color='#fff' />
              </View>
              <Text className='action-text'>详情</Text>
            </View>
            <View className='action-btn' onClick={handleNavigate}>
              <View className='action-icon navigate'>
                <Icon name='navigation' size={48} color='#fff' />
              </View>
              <Text className='action-text'>导航</Text>
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
            <Icon name='plus' size={36} color='#fff' />
            <Text className='add-text'>添加设备</Text>
          </View>
        </View>
      )}
    </View>
  )
}

import { View, Text } from '@tarojs/components'
import Taro from '@tarojs/taro'
import { useStore } from '../../store'
import Icon from '../../components/Icon'
import './index.scss'

const features = [
  { key: 'track', iconName: 'route', label: '轨迹', color: '#13c2c2', page: '/pages/track/index' },
  { key: 'alarm', iconName: 'bell', label: '报警', color: '#fa8c16', page: '/pages/alarm/index' },
  { key: 'report', iconName: 'bar-chart', label: '报表', color: '#597ef7', page: '/pages/report/index' },
  { key: 'geofence', iconName: 'target', label: '设置围栏', color: '#52c41a', page: '/pages/geofence/index' },
  { key: 'location', iconName: 'map-pin', label: '定位信息', color: '#1890ff', page: '/pages/detail/index' },
  { key: 'simcard', iconName: 'sim-card', label: '流量卡', color: '#eb2f96', page: '/pages/sim-card/index' },
  { key: 'mode', iconName: 'settings', label: '定位模式', color: '#722ed1', page: '/pages/settings/index' },
  { key: 'share', iconName: 'share', label: '分享位置', color: '#52c41a', page: '/pages/share/index' },
  { key: 'command', iconName: 'satellite', label: '更多指令', color: '#fa541c', page: '/pages/settings/index' },
]

export default function FunctionPage() {
  const { currentDevice } = useStore()

  const handleFeatureClick = (feature: typeof features[0]) => {
    if (!currentDevice) {
      Taro.showToast({ title: '请先添加设备', icon: 'none' })
      return
    }
    Taro.navigateTo({ url: `${feature.page}?deviceId=${currentDevice.deviceId}` })
  }

  return (
    <View className='function-page'>
      <View className='function-header'>
        <Text className='header-title'>功能中心</Text>
        {currentDevice && (
          <Text className='header-device'>{currentDevice.deviceName} ({currentDevice.deviceId})</Text>
        )}
      </View>

      <View className='feature-grid'>
        {features.map(f => (
          <View key={f.key} className='feature-item' onClick={() => handleFeatureClick(f)}>
            <View className='feature-icon' style={{ backgroundColor: f.color + '15' }}>
              <Icon name={f.iconName} size={40} color={f.color} />
            </View>
            <Text className='feature-label'>{f.label}</Text>
          </View>
        ))}
      </View>

      {currentDevice && (
        <View className='device-card'>
          <View className='card-header'>
            <Text className='card-title'>设备状态</Text>
            <View className={`status-dot ${currentDevice.status}`} />
          </View>
          <View className='card-info'>
            <View className='info-item'>
              <Text className='info-label'>设备ID</Text>
              <Text className='info-value'>{currentDevice.deviceId}</Text>
            </View>
            <View className='info-item'>
              <Text className='info-label'>电量</Text>
              <Text className='info-value'>{currentDevice.batteryLevel || 0}%</Text>
            </View>
            <View className='info-item'>
              <Text className='info-label'>信号</Text>
              <Text className='info-value'>{currentDevice.signalStrength || 0}%</Text>
            </View>
            <View className='info-item'>
              <Text className='info-label'>模式</Text>
              <Text className='info-value'>
                {currentDevice.workMode === 'normal' ? '常规' :
                 currentDevice.workMode === 'powersave' ? '省电' : '超级省电'}
              </Text>
            </View>
          </View>
        </View>
      )}
    </View>
  )
}

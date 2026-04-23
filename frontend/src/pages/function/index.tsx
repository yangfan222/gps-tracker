import { View, Text } from '@tarojs/components'
import Taro from '@tarojs/taro'
import { useStore } from '../../store'
import Icon from '../../components/Icon'
import './index.scss'

const features = [
  { key: 'track', iconName: 'route', label: '轨迹', gradient: ['#00E676', '#00C853'], page: '/pages/track/index' },
  { key: 'alarm', iconName: 'bell', label: '报警', gradient: ['#FFAB40', '#FF9100'], page: '/pages/alarm/index' },
  { key: 'report', iconName: 'bar-chart', label: '报表', gradient: ['#B388FF', '#7C4DFF'], page: '/pages/report/index' },
  { key: 'geofence', iconName: 'target', label: '设置围栏', gradient: ['#448AFF', '#2979FF'], page: '/pages/geofence/index' },
  { key: 'simcard', iconName: 'sim-card', label: '流量卡', gradient: ['#FF80AB', '#F50057'], page: '/pages/sim-card/index' },
  { key: 'settings', iconName: 'settings', label: '设备设置', gradient: ['#FF6E40', '#FF3D00'], page: '/pages/settings/index' },
  { key: 'share', iconName: 'share', label: '分享位置', gradient: ['#64FFDA', '#1DE9B6'], page: '/pages/share/index' },
  { key: 'location', iconName: 'map-pin', label: '定位信息', gradient: ['#82B1FF', '#448AFF'], page: '/pages/detail/index' },
  { key: 'command', iconName: 'more-horizontal', label: '更多功能', gradient: ['#90A4AE', '#607D8B'], page: '/pages/settings/index' },
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

      <View className='feature-grid-wrap'>
        <View className='feature-grid'>
          {features.map(f => (
            <View key={f.key} className='feature-item' onClick={() => handleFeatureClick(f)}>
              <View
                className='feature-icon'
                style={{ background: `linear-gradient(135deg, ${f.gradient[0]}, ${f.gradient[1]})` }}
              >
                <Icon name={f.iconName} size={56} color='#fff' />
              </View>
              <Text className='feature-label'>{f.label}</Text>
            </View>
          ))}
        </View>
      </View>
    </View>
  )
}

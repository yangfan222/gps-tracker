import { useState } from 'react'
import { View, Text } from '@tarojs/components'
import Taro, { useRouter } from '@tarojs/taro'
import { commandApi } from '../../services/api'
import Icon from '../../components/Icon'
import NavBar from '../../components/NavBar'
import './index.scss'

export default function SettingsPage() {
  const router = useRouter()
  const deviceId = router.params.deviceId || ''
  const [loading, setLoading] = useState('')

  const sendCmd = async (type: string, label: string, data?: any) => {
    setLoading(type)
    try {
      await commandApi.send(deviceId, type, data)
      Taro.showToast({ title: `${label}指令已发送`, icon: 'success' })
    } catch {}
    setLoading('')
  }

  const settingSections = [
    {
      title: '工作设置',
      iconName: 'cpu',
      items: [
        { label: '睡眠模式', desc: '开启后设备进入低功耗状态', cmd: 'sleep_mode', iconName: 'power' },
        { label: '远程开机', desc: '远程唤醒设备', cmd: 'power_on', iconName: 'zap' },
        { label: '远程关机', desc: '远程关闭设备', cmd: 'power_off', iconName: 'power' },
      ]
    },
    {
      title: '定位模式',
      iconName: 'crosshair',
      items: [
        { label: '常规模式 (30s)', desc: '每30秒上报一次位置', cmd: 'set_mode', data: { mode: 'normal' }, iconName: 'activity' },
        { label: '省电模式 (5min)', desc: '每5分钟上报一次位置', cmd: 'set_mode', data: { mode: 'powersave' }, iconName: 'battery' },
        { label: '超级省电', desc: '仅在运动时上报', cmd: 'set_mode', data: { mode: 'superPowersave' }, iconName: 'shield' },
      ]
    },
    {
      title: '辅助定位',
      iconName: 'navigation',
      items: [
        { label: 'GPS优先', desc: 'GPS定位优先，精度更高', cmd: 'set_locate_priority', data: { priority: 'gps' }, iconName: 'satellite' },
        { label: 'WiFi优先', desc: 'WiFi辅助定位，功耗更低', cmd: 'set_locate_priority', data: { priority: 'wifi' }, iconName: 'wifi' },
        { label: '基站定位', desc: '开启/关闭基站定位', cmd: 'toggle_lbs', iconName: 'signal' },
      ]
    },
    {
      title: '参数设置',
      iconName: 'settings',
      items: [
        { label: '超速阈值', desc: '设置超速报警的速度阈值', cmd: 'set_speed_threshold', data: { speed: 120 }, iconName: 'activity' },
        { label: '振动报警', desc: '检测到振动时触发报警', cmd: 'vibration_alarm', iconName: 'bell' },
      ]
    },
    {
      title: '设备操作',
      iconName: 'cpu',
      items: [
        { label: '设备重启', desc: '重启定位器设备', cmd: 'restart', iconName: 'refresh-cw' },
        { label: '恢复出厂', desc: '恢复出厂设置（需密码）', cmd: 'factory_reset', iconName: 'alert-triangle' },
        { label: '查询设备配置', desc: '读取当前设备参数', cmd: 'query_config', iconName: 'search' },
      ]
    }
  ]

  return (
    <View className='settings-page'>
      <NavBar title='设置' />
      {settingSections.map((section, sIdx) => (
        <View key={sIdx} className='setting-section'>
          <View className='section-header'>
            <Icon name={section.iconName} size={28} color='#1890ff' />
            <Text className='section-title'>{section.title}</Text>
          </View>
          {section.items.map((item, iIdx) => (
            <View key={iIdx} className='setting-item'
              onClick={() => {
                if (item.cmd === 'factory_reset') {
                  Taro.showModal({
                    title: '确认恢复出厂',
                    content: '此操作将清除所有设备配置，是否继续？',
                    success: (res) => { if (res.confirm) sendCmd(item.cmd, item.label, item.data) }
                  })
                } else {
                  sendCmd(item.cmd, item.label, item.data)
                }
              }}
            >
              <View className='item-icon-wrap'>
                <Icon name={item.iconName} size={32} color='#666' />
              </View>
              <View className='item-info'>
                <Text className='item-label'>{item.label}</Text>
                <Text className='item-desc'>{item.desc}</Text>
              </View>
              <Text className='item-arrow'>
                {loading === item.cmd ? '...' : ''}
              </Text>
              {loading !== item.cmd && <Icon name='chevron-right' size={28} color='#ccc' />}
            </View>
          ))}
        </View>
      ))}
    </View>
  )
}

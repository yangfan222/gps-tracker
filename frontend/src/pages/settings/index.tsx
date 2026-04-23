import { useState } from 'react'
import { View, Text } from '@tarojs/components'
import Taro, { useRouter } from '@tarojs/taro'
import { commandApi } from '../../services/api'
import Icon from '../../components/Icon'
import ColorIconBadge from '../../components/ColorIconBadge'
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
      items: [
        { label: '睡眠模式', desc: '开启后设备进入低功耗状态', cmd: 'sleep_mode', iconName: 'power', preset: 'orange' as const },
        { label: '远程开机', desc: '远程唤醒设备', cmd: 'power_on', iconName: 'zap', preset: 'orange' as const },
        { label: '远程关机', desc: '远程关闭设备', cmd: 'power_off', iconName: 'power', preset: 'red' as const, danger: true },
      ]
    },
    {
      title: '定位模式',
      items: [
        { label: '常规模式 (30s)', desc: '每30秒上报一次位置，耗电中等', cmd: 'set_mode', data: { mode: 'normal' }, iconName: 'activity', preset: 'blue' as const },
        { label: '省电模式 (5min)', desc: '每5分钟上报一次，续航更长', cmd: 'set_mode', data: { mode: 'powersave' }, iconName: 'battery', preset: 'blue' as const },
        { label: '超级省电', desc: '仅在运动时上报，续航最长', cmd: 'set_mode', data: { mode: 'superPowersave' }, iconName: 'shield', preset: 'blue' as const },
      ]
    },
    {
      title: '辅助定位',
      items: [
        { label: 'GPS优先', desc: 'GPS定位优先，精度更高', cmd: 'set_locate_priority', data: { priority: 'gps' }, iconName: 'satellite', preset: 'green' as const },
        { label: 'WiFi优先', desc: 'WiFi辅助定位，功耗更低', cmd: 'set_locate_priority', data: { priority: 'wifi' }, iconName: 'wifi', preset: 'green' as const },
        { label: '基站定位', desc: '开启/关闭基站定位', cmd: 'toggle_lbs', iconName: 'signal', preset: 'green' as const },
      ]
    },
    {
      title: '参数设置',
      items: [
        { label: '超速阈值', desc: '设置超速报警的速度阈值(120km/h)', cmd: 'set_speed_threshold', data: { speed: 120 }, iconName: 'activity', preset: 'purple' as const },
        { label: '振动报警', desc: '检测到振动时触发报警', cmd: 'vibration_alarm', iconName: 'bell', preset: 'purple' as const },
      ]
    },
    {
      title: '设备操作',
      items: [
        { label: '设备重启', desc: '重启定位器设备', cmd: 'restart', iconName: 'refresh-cw', preset: 'red' as const },
        { label: '恢复出厂', desc: '恢复出厂设置，清除所有配置', cmd: 'factory_reset', iconName: 'alert-triangle', preset: 'red' as const, danger: true },
        { label: '查询设备配置', desc: '读取当前设备参数', cmd: 'query_config', iconName: 'search', preset: 'gray' as const },
      ]
    }
  ]

  return (
    <View className='settings-page'>
      <NavBar title='设置' />
      {settingSections.map((section, sIdx) => (
        <View key={sIdx} className='setting-section'>
          <Text className='section-title'>{section.title}</Text>
          {section.items.map((item, iIdx) => (
            <View key={iIdx} className={`setting-item ${(item as any).danger ? 'danger' : ''}`}
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
              <ColorIconBadge iconName={item.iconName} size='sm' preset={item.preset} />
              <View className='item-info'>
                <Text className={`item-label ${(item as any).danger ? 'danger-text' : ''}`}>{item.label}</Text>
                <Text className='item-desc'>{item.desc}</Text>
              </View>
              {loading === item.cmd ? (
                <View className='loading-spin'>
                  <Icon name='refresh-cw' size={28} color='#999' />
                </View>
              ) : (
                <Icon name='chevron-right' size={28} color='#ccc' />
              )}
            </View>
          ))}
        </View>
      ))}
    </View>
  )
}

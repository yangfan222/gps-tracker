import { useState, useEffect } from 'react'
import { View, Text, ScrollView } from '@tarojs/components'
import Taro, { useRouter } from '@tarojs/taro'
import { alarmApi } from '../../services/api'
import Icon from '../../components/Icon'
import NavBar from '../../components/NavBar'
import './index.scss'

const alarmTypeMap: Record<string, { label: string; color: string; iconName: string }> = {
  speed: { label: '超速报警', color: '#fa8c16', iconName: 'activity' },
  vibration: { label: '振动报警', color: '#faad14', iconName: 'zap' },
  geofence_entry: { label: '进入围栏', color: '#1890ff', iconName: 'target' },
  geofence_exit: { label: '离开围栏', color: '#722ed1', iconName: 'target' },
  low_battery: { label: '低电量', color: '#ff4d4f', iconName: 'battery' },
  sos: { label: 'SOS求救', color: '#f5222d', iconName: 'alert-triangle' },
  power_off: { label: '断电报警', color: '#ff4d4f', iconName: 'power' },
}

export default function AlarmPage() {
  const router = useRouter()
  const deviceId = router.params.deviceId || ''
  const [alarms, setAlarms] = useState<any[]>([])
  const [page, setPage] = useState(1)
  const [total, setTotal] = useState(0)

  useEffect(() => { if (deviceId) loadAlarms() }, [deviceId])

  const loadAlarms = async (p = 1) => {
    try {
      const res = await alarmApi.getAlarms(deviceId, p)
      if (p === 1) setAlarms(res.items)
      else setAlarms(prev => [...prev, ...res.items])
      setTotal(res.total)
      setPage(p)
    } catch {}
  }

  const formatTime = (t: string) => {
    const d = new Date(t)
    return `${d.getMonth() + 1}/${d.getDate()} ${String(d.getHours()).padStart(2, '0')}:${String(d.getMinutes()).padStart(2, '0')}`
  }

  return (
    <View className='alarm-page'>
      <NavBar title='报警记录' />
      <View className='alarm-summary'>
        <Icon name='bell' size={32} color='#fa8c16' />
        <Text className='summary-text'>共 {total} 条报警记录</Text>
      </View>

      <ScrollView scrollY className='alarm-list' onScrollToLower={() => {
        if (alarms.length < total) loadAlarms(page + 1)
      }}>
        {alarms.length === 0 ? (
          <View className='empty'>
            <Icon name='bell' size={96} color='#ddd' />
            <Text className='empty-text'>暂无报警记录</Text>
            <Text className='empty-hint'>设备运行正常，无报警信息</Text>
          </View>
        ) : (
          alarms.map((a, idx) => {
            const typeInfo = alarmTypeMap[a.type] || { label: a.type, color: '#999', iconName: 'alert-triangle' }
            return (
              <View key={idx} className='alarm-item' onClick={() => alarmApi.markAsRead(a.id)}>
                <View className='alarm-badge' style={{ backgroundColor: typeInfo.color + '15' }}>
                  <Icon name={typeInfo.iconName} size={32} color={typeInfo.color} />
                </View>
                <View className='alarm-info'>
                  <View className='alarm-header'>
                    <Text className='alarm-type' style={{ color: typeInfo.color }}>{typeInfo.label}</Text>
                    <Text className='alarm-time'>{formatTime(a.createdAt)}</Text>
                  </View>
                  <Text className='alarm-msg'>{a.message || typeInfo.label}</Text>
                  {a.address && <Text className='alarm-addr'>{a.address}</Text>}
                </View>
                {!a.isRead && <View className='unread-dot' />}
              </View>
            )
          })
        )}
      </ScrollView>
    </View>
  )
}

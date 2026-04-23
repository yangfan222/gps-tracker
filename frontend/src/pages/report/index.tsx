import { useState } from 'react'
import { View, Text, Picker } from '@tarojs/components'
import Taro, { useRouter } from '@tarojs/taro'
import { reportApi } from '../../services/api'
import Icon from '../../components/Icon'
import NavBar from '../../components/NavBar'
import './index.scss'

type ReportType = 'driving' | 'parking' | 'mileage'

export default function ReportPage() {
  const router = useRouter()
  const deviceId = router.params.deviceId || ''
  const [activeTab, setActiveTab] = useState<ReportType>('driving')
  const [date, setDate] = useState(new Date().toISOString().split('T')[0])
  const [data, setData] = useState<any[]>([])
  const [loading, setLoading] = useState(false)

  const tabs: { key: ReportType; label: string; iconName: string }[] = [
    { key: 'driving', label: '行驶报表', iconName: 'activity' },
    { key: 'parking', label: '停车报表', iconName: 'clock' },
    { key: 'mileage', label: '日里程', iconName: 'bar-chart' },
  ]

  const loadReport = async () => {
    if (!deviceId) return
    setLoading(true)
    try {
      const startTime = `${date}T00:00:00`
      const endTime = `${date}T23:59:59`
      let result: any[]

      switch (activeTab) {
        case 'driving':
          result = await reportApi.getDriving(deviceId, startTime, endTime)
          break
        case 'parking':
          result = await reportApi.getParking(deviceId, startTime, endTime)
          break
        case 'mileage':
          const endDate = new Date(date)
          endDate.setDate(endDate.getDate() + 7)
          result = await reportApi.getMileage(deviceId, date, endDate.toISOString().split('T')[0])
          break
        default:
          result = []
      }
      setData(result)
      if (result.length === 0) Taro.showToast({ title: '该日期无数据', icon: 'none' })
    } catch {}
    setLoading(false)
  }

  const formatTime = (t: string) => {
    const d = new Date(t)
    return `${String(d.getHours()).padStart(2, '0')}:${String(d.getMinutes()).padStart(2, '0')}`
  }

  // Find max mileage for bar scaling
  const maxMileage = data.length > 0 ? Math.max(...data.map(d => d.mileage || 0), 1) : 1

  return (
    <View className='report-page'>
      <NavBar title='报表' />
      <View className='tab-bar'>
        {tabs.map(t => (
          <View key={t.key} className={`tab ${activeTab === t.key ? 'active' : ''}`}
            onClick={() => { setActiveTab(t.key); setData([]) }}>
            <Icon name={t.iconName} size={28} color={activeTab === t.key ? '#1890ff' : '#999'} />
            <Text className='tab-text'>{t.label}</Text>
          </View>
        ))}
      </View>

      <View className='date-bar'>
        <Picker mode='date' value={date} onChange={e => setDate(e.detail.value)}>
          <View className='date-picker'>
            <Icon name='calendar' size={28} color='#666' />
            <Text className='date-text'>{date}</Text>
            <Icon name='chevron-down' size={24} color='#999' />
          </View>
        </Picker>
        <View className='query-btn' onClick={loadReport}>
          <Text className='query-text'>{loading ? '查询中...' : '查询'}</Text>
        </View>
      </View>

      <View className='report-content'>
        {data.length === 0 ? (
          <View className='empty'>
            <Icon name='bar-chart' size={96} color='#ddd' />
            <Text className='empty-text'>暂无数据</Text>
            <Text className='empty-hint'>请选择日期查询报表</Text>
          </View>
        ) : (
          <>
            {activeTab === 'driving' && data.map((d, i) => (
              <View key={i} className='data-item'>
                <Text className='item-time'>{formatTime(d.time)}</Text>
                <Text className='item-value'>速度: {d.speed} km/h</Text>
              </View>
            ))}

            {activeTab === 'parking' && data.map((d, i) => (
              <View key={i} className='parking-item'>
                <View className='parking-time'>
                  <Text className='time-text'>{formatTime(d.startTime)} - {formatTime(d.endTime)}</Text>
                  <Text className='duration-text'>{d.duration} 分钟</Text>
                </View>
                {d.address && <Text className='parking-addr'>{d.address}</Text>}
              </View>
            ))}

            {activeTab === 'mileage' && data.map((d, i) => (
              <View key={i} className='mileage-item'>
                <Text className='mileage-date'>{d.date}</Text>
                <View className='mileage-bar'>
                  <View className='bar-fill' style={{ width: `${(d.mileage / maxMileage) * 100}%` }} />
                </View>
                <Text className='mileage-value'>{d.mileage} km</Text>
              </View>
            ))}
          </>
        )}
      </View>
    </View>
  )
}

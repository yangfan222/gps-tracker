import { useState, useEffect } from 'react'
import { View, Text } from '@tarojs/components'
import Taro, { useRouter } from '@tarojs/taro'
import { deviceApi } from '../../services/api'
import Icon from '../../components/Icon'
import NavBar from '../../components/NavBar'
import './index.scss'

export default function DetailPage() {
  const router = useRouter()
  const deviceId = router.params.deviceId || ''
  const [device, setDevice] = useState<any>(null)

  useEffect(() => { if (deviceId) loadDevice() }, [deviceId])

  const loadDevice = async () => {
    try {
      const d = await deviceApi.getDevice(deviceId)
      setDevice(d)
    } catch {}
  }

  if (!device) return <View className='detail-page'><NavBar title='设备详情' /><Text className='loading'>加载中...</Text></View>

  const infoGroups = [
    {
      title: '基本信息',
      iconName: 'cpu',
      items: [
        { label: '设备名称', value: device.deviceName },
        { label: '设备ID', value: device.deviceId },
        { label: 'SIM卡号', value: device.simNumber || '未绑定' },
        { label: 'ICCID', value: device.iccid || '未绑定' },
        { label: '协议类型', value: device.protocolType || 'HL' },
        { label: '设备型号', value: device.deviceModel || 'F36' },
      ]
    },
    {
      title: '位置信息',
      iconName: 'map-pin',
      items: [
        { label: '经度', value: device.longitude?.toFixed(6) || '0' },
        { label: '纬度', value: device.latitude?.toFixed(6) || '0' },
        { label: '速度', value: `${device.speed || 0} km/h` },
        { label: '地址', value: device.address || '获取中...' },
      ]
    },
    {
      title: '设备状态',
      iconName: 'activity',
      items: [
        { label: '连接状态', value: device.status === 'online' ? '在线' : '离线' },
        { label: '电量', value: `${device.batteryLevel || 0}%` },
        { label: '信号强度', value: `${device.signalStrength || 0}%` },
        { label: '工作模式', value: device.workMode === 'normal' ? '常规30s' : device.workMode === 'powersave' ? '省电5min' : '超级省电' },
        { label: '总里程', value: `${device.totalMileage || 0} km` },
        { label: '今日里程', value: `${device.dailyMileage || 0} km` },
        { label: '定位方式', value: device.locationType || 'GPS' },
        { label: '是否激活', value: device.isActivated ? '已激活' : '未激活' },
      ]
    }
  ]

  return (
    <View className='detail-page'>
      <NavBar title='设备详情' />
      {infoGroups.map((group, gIdx) => (
        <View key={gIdx} className='info-group'>
          <View className='group-header'>
            <Icon name={group.iconName} size={28} color='#1890ff' />
            <Text className='group-title'>{group.title}</Text>
          </View>
          {group.items.map((item, iIdx) => (
            <View key={iIdx} className='info-row'>
              <Text className='info-label'>{item.label}</Text>
              <Text className='info-value'>{item.value}</Text>
            </View>
          ))}
        </View>
      ))}
    </View>
  )
}

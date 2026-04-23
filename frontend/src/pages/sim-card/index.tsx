import { useState, useEffect } from 'react'
import { View, Text } from '@tarojs/components'
import Taro, { useRouter } from '@tarojs/taro'
import { simCardApi } from '../../services/api'
import Icon from '../../components/Icon'
import NavBar from '../../components/NavBar'
import './index.scss'

export default function SimCardPage() {
  const router = useRouter()
  const deviceId = router.params.deviceId || ''
  const [simCard, setSimCard] = useState<any>(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => { if (deviceId) loadSimCard() }, [deviceId])

  const loadSimCard = async () => {
    setLoading(true)
    try {
      const data = await simCardApi.getByDevice(deviceId)
      setSimCard(data)
    } catch {}
    setLoading(false)
  }

  const handleActivate = async () => {
    try {
      await simCardApi.activate(deviceId)
      Taro.showToast({ title: '激活成功', icon: 'success' })
      loadSimCard()
    } catch {}
  }

  const getUsagePercent = () => {
    if (!simCard || !simCard.totalData) return 0
    return Math.round((simCard.usedData / simCard.totalData) * 100)
  }

  if (loading) return <View className='sim-page'><NavBar title='流量卡' /><Text className='loading'>加载中...</Text></View>

  return (
    <View className='sim-page'>
      {!simCard ? (
        <View className='no-sim'>
          <Icon name='sim-card' size={96} color='#ccc' />
          <Text className='no-sim-text'>暂无SIM卡信息</Text>
          <Text className='no-sim-hint'>请先在设备中插入物联网SIM卡</Text>
        </View>
      ) : (
        <>
          <View className='sim-card-visual'>
            <View className='sim-chip' />
            <Text className='sim-number'>{simCard.simNumber || '未知'}</Text>
            <Text className='sim-iccid'>ICCID: {simCard.iccid || '未知'}</Text>
            <View className={`sim-status ${simCard.status}`}>
              <Text className='status-text'>
                {simCard.status === 'active' ? '已激活' : simCard.status === 'expired' ? '已过期' : '未激活'}
              </Text>
            </View>
          </View>

          <View className='info-card'>
            <Text className='card-title'>套餐信息</Text>
            <View className='info-row'>
              <Text className='info-label'>套餐名称</Text>
              <Text className='info-value'>{simCard.packageName || '30M*36月'}</Text>
            </View>
            <View className='info-row'>
              <Text className='info-label'>激活时间</Text>
              <Text className='info-value'>{simCard.activationTime ? new Date(simCard.activationTime).toLocaleDateString() : '未激活'}</Text>
            </View>
            <View className='info-row'>
              <Text className='info-label'>到期时间</Text>
              <Text className='info-value'>{simCard.expiryTime ? new Date(simCard.expiryTime).toLocaleDateString() : '--'}</Text>
            </View>
          </View>

          <View className='info-card'>
            <Text className='card-title'>流量使用</Text>
            <View className='usage-circle'>
              <View className='circle-inner'>
                <Text className='usage-percent'>{getUsagePercent()}%</Text>
                <Text className='usage-label'>已使用</Text>
              </View>
            </View>
            <View className='usage-details'>
              <View className='usage-item'>
                <Text className='usage-num'>{simCard.totalData || 0}MB</Text>
                <Text className='usage-desc'>总流量</Text>
              </View>
              <View className='usage-item'>
                <Text className='usage-num'>{simCard.usedData || 0}MB</Text>
                <Text className='usage-desc'>已使用</Text>
              </View>
              <View className='usage-item'>
                <Text className='usage-num'>{((simCard.totalData || 0) - (simCard.usedData || 0)).toFixed(1)}MB</Text>
                <Text className='usage-desc'>剩余</Text>
              </View>
            </View>
          </View>

          <View className='info-card'>
            <Text className='card-title'>短信使用</Text>
            <View className='info-row'>
              <Text className='info-label'>总短信数</Text>
              <Text className='info-value'>{simCard.totalSms || 0} 条</Text>
            </View>
            <View className='info-row'>
              <Text className='info-label'>已使用</Text>
              <Text className='info-value'>{simCard.usedSms || 0} 条</Text>
            </View>
          </View>

          {simCard.status === 'inactive' && (
            <View className='action-section'>
              <View className='activate-btn' onClick={handleActivate}>
                <Text className='btn-text'>激活SIM卡</Text>
              </View>
            </View>
          )}

          <View className='action-section'>
            <View className='recharge-btn' onClick={() => Taro.showToast({ title: '充值功能开发中', icon: 'none' })}>
              <Text className='btn-text'>去充值</Text>
            </View>
          </View>
        </>
      )}
    </View>
  )
}

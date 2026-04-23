import { useState, useEffect } from 'react'
import { View, Text } from '@tarojs/components'
import Taro, { useRouter } from '@tarojs/taro'
import { useStore } from '../../store'
import { shareApi } from '../../services/api'
import Icon from '../../components/Icon'
import NavBar from '../../components/NavBar'
import './index.scss'

export default function SharePage() {
  const router = useRouter()
  const deviceId = router.params.deviceId || ''
  const { currentDevice } = useStore()
  const [sharing, setSharing] = useState(false)
  const [shareToken, setShareToken] = useState('')
  const [loading, setLoading] = useState(false)

  useEffect(() => {
    if (deviceId) checkShareStatus()
  }, [deviceId])

  const checkShareStatus = async () => {
    try {
      const data = await shareApi.getShareStatus(deviceId)
      if (data && data.active) {
        setSharing(true)
        setShareToken(data.shareToken)
      }
    } catch {}
  }

  const handleShare = async () => {
    setLoading(true)
    try {
      const data = await shareApi.createShare(deviceId, 24)
      setSharing(true)
      setShareToken(data.shareToken)
      const shareUrl = `${window?.location?.origin || ''}/share-view?token=${data.shareToken}`
      Taro.setClipboardData({
        data: shareUrl,
        success: () => {
          Taro.showToast({ title: '链接已复制，有效期24小时', icon: 'none', duration: 3000 })
        }
      })
    } catch {}
    setLoading(false)
  }

  const handleCopyLink = () => {
    const shareUrl = `${window?.location?.origin || ''}/share-view?token=${shareToken}`
    Taro.setClipboardData({
      data: shareUrl,
      success: () => {
        Taro.showToast({ title: '链接已复制', icon: 'success' })
      }
    })
  }

  const handleStopShare = async () => {
    try {
      await shareApi.stopShare(deviceId)
      setSharing(false)
      setShareToken('')
      Taro.showToast({ title: '已停止分享', icon: 'success' })
    } catch {}
  }

  const openInMap = (mapType: string) => {
    if (!currentDevice?.latitude || !currentDevice?.longitude) {
      Taro.showToast({ title: '暂无位置信息', icon: 'none' })
      return
    }
    Taro.showToast({ title: `正在打开${mapType}地图...`, icon: 'none' })
  }

  const mapApps = [
    { name: '高德地图', iconName: 'map-pin', color: '#00C853' },
    { name: '百度地图', iconName: 'compass', color: '#2979FF' },
    { name: 'Google地图', iconName: 'globe', color: '#34a853' },
  ]

  return (
    <View className='share-page'>
      <NavBar title='分享位置' />
      <View className='share-card'>
        <View className='card-icon'>
          <Icon name='link' size={64} color='#00C853' />
        </View>
        <Text className='card-title'>分享设备位置</Text>
        <Text className='card-desc'>
          分享后，对方可通过链接在浏览器中查看设备实时位置，链接有效期24小时
        </Text>

        {!sharing ? (
          <View className={`share-btn ${loading ? 'disabled' : ''}`} onClick={loading ? undefined : handleShare}>
            <Icon name='share' size={32} color='#fff' />
            <Text className='btn-text'>{loading ? '生成中...' : '开始分享'}</Text>
          </View>
        ) : (
          <View className='share-actions'>
            <View className='copy-btn' onClick={handleCopyLink}>
              <Text className='btn-text'>复制链接</Text>
            </View>
            <View className='stop-btn' onClick={handleStopShare}>
              <Text className='btn-text'>停止分享</Text>
            </View>
          </View>
        )}
      </View>

      <View className='nav-card'>
        <Text className='nav-title'>在地图中打开</Text>
        <Text className='nav-desc'>使用第三方地图应用导航到设备位置</Text>

        <View className='map-options'>
          {mapApps.map(app => (
            <View key={app.name} className='map-option' onClick={() => openInMap(app.name)}>
              <View className='map-icon' style={{ backgroundColor: app.color + '15' }}>
                <Icon name={app.iconName} size={40} color={app.color} />
              </View>
              <Text className='map-name'>{app.name}</Text>
            </View>
          ))}
        </View>
      </View>

      {currentDevice && (
        <View className='location-card'>
          <Text className='loc-title'>当前位置</Text>
          <View className='loc-info'>
            <Text className='loc-coord'>经度: {currentDevice.longitude?.toFixed(6) || '0'}</Text>
            <Text className='loc-coord'>纬度: {currentDevice.latitude?.toFixed(6) || '0'}</Text>
            {currentDevice.address && <Text className='loc-addr'>{currentDevice.address}</Text>}
          </View>
        </View>
      )}
    </View>
  )
}

import { useState, useEffect, useRef } from 'react'
import { View, Text, Picker } from '@tarojs/components'
import Taro, { useRouter } from '@tarojs/taro'
import { trackApi } from '../../services/api'
import MapView from '../../components/MapView'
import Icon from '../../components/Icon'
import NavBar from '../../components/NavBar'
import './index.scss'

export default function TrackPage() {
  const router = useRouter()
  const deviceId = router.params.deviceId || ''
  const [startDate, setStartDate] = useState(new Date().toISOString().split('T')[0])
  const [endDate, setEndDate] = useState(new Date().toISOString().split('T')[0])
  const [trackPoints, setTrackPoints] = useState<any[]>([])
  const [currentIndex, setCurrentIndex] = useState(0)
  const [playing, setPlaying] = useState(false)
  const [loading, setLoading] = useState(false)
  const timerRef = useRef<any>(null)

  useEffect(() => {
    return () => { if (timerRef.current) clearInterval(timerRef.current) }
  }, [])

  const loadTrack = async () => {
    if (!deviceId) return
    setLoading(true)
    try {
      const startTime = `${startDate}T00:00:00`
      const endTime = `${endDate}T23:59:59`
      const points = await trackApi.getTrack(deviceId, startTime, endTime)
      setTrackPoints(points)
      setCurrentIndex(0)
      if (points.length === 0) {
        Taro.showToast({ title: '该时间段无轨迹数据', icon: 'none' })
      }
    } catch (err) {}
    setLoading(false)
  }

  const playTrack = () => {
    if (trackPoints.length === 0) return
    setPlaying(true)
    timerRef.current = setInterval(() => {
      setCurrentIndex(prev => {
        if (prev >= trackPoints.length - 1) {
          clearInterval(timerRef.current)
          timerRef.current = null
          setPlaying(false)
          return prev
        }
        return prev + 1
      })
    }, 500)
  }

  const stopPlay = () => {
    if (timerRef.current) { clearInterval(timerRef.current); timerRef.current = null }
    setPlaying(false)
  }

  const formatTime = (time: string) => {
    const d = new Date(time)
    return `${String(d.getHours()).padStart(2, '0')}:${String(d.getMinutes()).padStart(2, '0')}:${String(d.getSeconds()).padStart(2, '0')}`
  }

  const currentPoint = trackPoints[currentIndex]
  // Show track up to current playback position
  const visibleTrack = trackPoints.slice(0, currentIndex + 1)

  return (
    <View className='track-page'>
      <NavBar title='轨迹回放' />
      <View className='map-area'>
        {typeof window !== 'undefined' && trackPoints.length > 0 && currentPoint ? (
          <MapView
            latitude={currentPoint.latitude}
            longitude={currentPoint.longitude}
            deviceName={deviceId}
            trackPoints={visibleTrack}
          />
        ) : (
          <View className='map-placeholder'>
            {trackPoints.length > 0 ? (
              <View className='track-info'>
                <Icon name='route' size={64} color='#1890ff' />
                <Text className='track-count'>共 {trackPoints.length} 个轨迹点</Text>
              </View>
            ) : (
              <View className='empty-track'>
                <Icon name='map' size={80} color='#ccc' />
                <Text className='empty-text'>选择日期范围查询轨迹</Text>
              </View>
            )}
          </View>
        )}
      </View>

      <View className='control-panel'>
        <View className='date-selectors'>
          <Picker mode='date' value={startDate} onChange={e => setStartDate(e.detail.value)}>
            <View className='date-btn'>
              <Text className='date-label'>开始</Text>
              <Text className='date-value'>{startDate}</Text>
            </View>
          </Picker>
          <Text className='date-sep'>至</Text>
          <Picker mode='date' value={endDate} onChange={e => setEndDate(e.detail.value)}>
            <View className='date-btn'>
              <Text className='date-label'>结束</Text>
              <Text className='date-value'>{endDate}</Text>
            </View>
          </Picker>
          <View className='search-btn' onClick={loadTrack}>
            <Text className='search-text'>{loading ? '查询中' : '查询'}</Text>
          </View>
        </View>

        {trackPoints.length > 0 && (
          <View className='playback-controls'>
            <View className='play-btns'>
              <View className='play-btn' onClick={() => { stopPlay(); setCurrentIndex(Math.max(0, currentIndex - 1)) }}>
                <Icon name='skip-back' size={32} color='#333' />
              </View>
              <View className='play-btn main' onClick={playing ? stopPlay : playTrack}>
                <Icon name={playing ? 'pause' : 'play'} size={36} color='#fff' />
              </View>
              <View className='play-btn' onClick={() => { stopPlay(); setCurrentIndex(Math.min(trackPoints.length - 1, currentIndex + 1)) }}>
                <Icon name='skip-forward' size={32} color='#333' />
              </View>
            </View>
            <Text className='progress-text'>{currentIndex + 1} / {trackPoints.length}</Text>

            {currentPoint && (
              <View className='point-detail'>
                <Text className='detail-text'>时间: {formatTime(currentPoint.createdAt)}</Text>
                <Text className='detail-text'>速度: {currentPoint.speed || 0} km/h</Text>
                <Text className='detail-text'>方式: {currentPoint.locationType || 'GPS'}</Text>
              </View>
            )}
          </View>
        )}
      </View>
    </View>
  )
}

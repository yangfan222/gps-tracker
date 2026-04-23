import { useState, useEffect } from 'react'
import { View, Text, Input } from '@tarojs/components'
import Taro, { useRouter } from '@tarojs/taro'
import { geofenceApi } from '../../services/api'
import Icon from '../../components/Icon'
import NavBar from '../../components/NavBar'
import './index.scss'

export default function GeofencePage() {
  const router = useRouter()
  const deviceId = router.params.deviceId || ''
  const [fences, setFences] = useState<any[]>([])
  const [showAdd, setShowAdd] = useState(false)
  const [name, setName] = useState('')
  const [radius, setRadius] = useState('500')

  useEffect(() => { if (deviceId) loadFences() }, [deviceId])

  const loadFences = async () => {
    try {
      const list = await geofenceApi.getByDevice(deviceId)
      setFences(list)
    } catch {}
  }

  const addFence = async () => {
    if (!name) {
      Taro.showToast({ title: '请输入围栏名称', icon: 'none' })
      return
    }
    try {
      await geofenceApi.create(deviceId, {
        name,
        type: 'circle',
        centerLat: 39.9042,
        centerLng: 116.4074,
        radius: parseInt(radius) || 500,
        entryAlarm: true,
        exitAlarm: true,
      })
      Taro.showToast({ title: '围栏创建成功', icon: 'success' })
      setShowAdd(false)
      setName('')
      loadFences()
    } catch {}
  }

  const deleteFence = (id: number) => {
    Taro.showModal({
      title: '确认删除',
      content: '确定要删除该围栏吗？',
      success: async (res) => {
        if (res.confirm) {
          await geofenceApi.remove(id)
          loadFences()
        }
      }
    })
  }

  return (
    <View className='geofence-page'>
      <NavBar title='电子围栏' />
      <View className='fence-list'>
        {fences.length === 0 ? (
          <View className='empty'>
            <Icon name='target' size={96} color='#ddd' />
            <Text className='empty-text'>暂无围栏</Text>
            <Text className='empty-hint'>点击右下角按钮添加电子围栏</Text>
          </View>
        ) : (
          fences.map(f => (
            <View key={f.id} className='fence-item'>
              <View className='fence-icon-wrap'>
                <Icon name='target' size={36} color='#52c41a' />
              </View>
              <View className='fence-info'>
                <Text className='fence-name'>{f.name}</Text>
                <Text className='fence-detail'>
                  {f.type === 'circle' ? `圆形 半径${f.radius}m` : '多边形'}
                  {f.entryAlarm && ' | 进入报警'}
                  {f.exitAlarm && ' | 离开报警'}
                </Text>
              </View>
              <View className='fence-actions'>
                <Text className={`fence-status ${f.enabled ? 'on' : 'off'}`}>
                  {f.enabled ? '已启用' : '已禁用'}
                </Text>
                <View className='delete-btn' onClick={() => deleteFence(f.id)}>
                  <Icon name='trash' size={28} color='#ff4d4f' />
                </View>
              </View>
            </View>
          ))
        )}
      </View>

      {showAdd && (
        <View className='add-panel'>
          <View className='panel-content'>
            <Text className='panel-title'>添加围栏</Text>
            <View className='form-item'>
              <Text className='form-label'>围栏名称</Text>
              <Input className='form-input' placeholder='如：家、公司' value={name} onInput={e => setName(e.detail.value)} />
            </View>
            <View className='form-item'>
              <Text className='form-label'>半径(米)</Text>
              <Input className='form-input' type='number' placeholder='500' value={radius} onInput={e => setRadius(e.detail.value)} />
            </View>
            <View className='form-hint'>
              <Text className='hint-text'>围栏中心将设为设备当前位置</Text>
            </View>
            <View className='form-btns'>
              <View className='cancel-btn' onClick={() => setShowAdd(false)}>
                <Text>取消</Text>
              </View>
              <View className='confirm-btn' onClick={addFence}>
                <Text>确认添加</Text>
              </View>
            </View>
          </View>
        </View>
      )}

      <View className='add-float-btn' onClick={() => setShowAdd(true)}>
        <Icon name='plus' size={40} color='#fff' />
      </View>
    </View>
  )
}

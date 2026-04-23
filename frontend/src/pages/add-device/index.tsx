import { useState } from 'react'
import { View, Text, Input } from '@tarojs/components'
import Taro from '@tarojs/taro'
import { deviceApi } from '../../services/api'
import { useStore } from '../../store'
import Icon from '../../components/Icon'
import NavBar from '../../components/NavBar'
import './index.scss'

export default function AddDevicePage() {
  const [step, setStep] = useState(1)
  const [deviceId, setDeviceId] = useState('')
  const [deviceName, setDeviceName] = useState('')
  const [simNumber, setSimNumber] = useState('')
  const [loading, setLoading] = useState(false)
  const { setDevices, setCurrentDevice } = useStore()

  const handleScan = () => {
    Taro.scanCode({
      onlyFromCamera: false,
      success: (res) => {
        setDeviceId(res.result)
        setStep(2)
      },
      fail: () => {
        Taro.showToast({ title: '请手动输入设备ID', icon: 'none' })
      }
    })
  }

  const handleNext = () => {
    if (!deviceId) {
      Taro.showToast({ title: '请输入设备ID', icon: 'none' })
      return
    }
    setStep(2)
  }

  const handleSubmit = async () => {
    setLoading(true)
    try {
      const device = await deviceApi.addDevice({
        deviceId,
        deviceName: deviceName || '定位器',
        simNumber: simNumber || undefined,
      })
      setCurrentDevice(device)
      const list = await deviceApi.getDevices()
      setDevices(list)
      Taro.showToast({ title: '设备添加成功', icon: 'success' })
      setTimeout(() => Taro.navigateBack(), 1500)
    } catch {}
    setLoading(false)
  }

  return (
    <View className='add-device-page'>
      <NavBar title='添加设备' />
      <View className='steps'>
        <View className={`step ${step >= 1 ? 'active' : ''}`}>
          <View className='step-dot'><Text className='dot-text'>1</Text></View>
          <Text className='step-label'>扫码/输入</Text>
        </View>
        <View className='step-line' />
        <View className={`step ${step >= 2 ? 'active' : ''}`}>
          <View className='step-dot'><Text className='dot-text'>2</Text></View>
          <Text className='step-label'>完善信息</Text>
        </View>
      </View>

      {step === 1 && (
        <View className='step-content'>
          <View className='scan-section'>
            <View className='scan-btn' onClick={handleScan}>
              <Icon name='camera' size={56} color='#1890ff' />
              <Text className='scan-text'>扫描设备二维码</Text>
            </View>
            <Text className='scan-hint'>扫描设备上的二维码/条形码</Text>
          </View>

          <View className='divider-with-text'>
            <View className='line' />
            <Text className='divider-text'>或</Text>
            <View className='line' />
          </View>

          <View className='manual-section'>
            <Text className='section-title'>手动输入设备ID</Text>
            <Input
              className='device-input'
              placeholder='请输入设备ID（如：9050145989）'
              value={deviceId}
              onInput={e => setDeviceId(e.detail.value)}
            />
            <View className={`next-btn ${!deviceId ? 'disabled' : ''}`} onClick={handleNext}>
              <Text className='btn-text'>下一步</Text>
            </View>
          </View>
        </View>
      )}

      {step === 2 && (
        <View className='step-content'>
          <View className='form-section'>
            <View className='form-item'>
              <Text className='form-label'>设备ID</Text>
              <Text className='form-value'>{deviceId}</Text>
            </View>
            <View className='form-item'>
              <Text className='form-label'>设备名称</Text>
              <Input
                className='form-input'
                placeholder='给设备起个名字（选填）'
                value={deviceName}
                onInput={e => setDeviceName(e.detail.value)}
              />
            </View>
            <View className='form-item'>
              <Text className='form-label'>SIM卡号</Text>
              <Input
                className='form-input'
                type='number'
                placeholder='输入SIM卡号（选填）'
                value={simNumber}
                onInput={e => setSimNumber(e.detail.value)}
              />
            </View>
          </View>

          <View className='submit-btns'>
            <View className='back-btn' onClick={() => setStep(1)}>
              <Text className='btn-text'>上一步</Text>
            </View>
            <View className={`confirm-btn ${loading ? 'disabled' : ''}`} onClick={!loading ? handleSubmit : undefined}>
              <Text className='btn-text'>{loading ? '添加中...' : '确认添加'}</Text>
            </View>
          </View>
        </View>
      )}
    </View>
  )
}

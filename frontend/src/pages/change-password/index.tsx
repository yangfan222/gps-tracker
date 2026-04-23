import { useState } from 'react'
import { View, Text, Input } from '@tarojs/components'
import Taro from '@tarojs/taro'
import { authApi } from '../../services/api'
import Icon from '../../components/Icon'
import NavBar from '../../components/NavBar'
import './index.scss'

export default function ChangePasswordPage() {
  const [oldPassword, setOldPassword] = useState('')
  const [newPassword, setNewPassword] = useState('')
  const [confirmPassword, setConfirmPassword] = useState('')
  const [loading, setLoading] = useState(false)
  const [showOld, setShowOld] = useState(false)
  const [showNew, setShowNew] = useState(false)
  const [showConfirm, setShowConfirm] = useState(false)

  const handleSubmit = async () => {
    if (!oldPassword) {
      Taro.showToast({ title: '请输入当前密码', icon: 'none' })
      return
    }
    if (!newPassword) {
      Taro.showToast({ title: '请输入新密码', icon: 'none' })
      return
    }
    if (newPassword.length < 6) {
      Taro.showToast({ title: '新密码至少6位', icon: 'none' })
      return
    }
    if (newPassword !== confirmPassword) {
      Taro.showToast({ title: '两次密码不一致', icon: 'none' })
      return
    }
    if (oldPassword === newPassword) {
      Taro.showToast({ title: '新密码不能与旧密码相同', icon: 'none' })
      return
    }

    setLoading(true)
    try {
      await authApi.changePassword({ oldPassword, newPassword })
      Taro.showToast({ title: '密码修改成功', icon: 'success' })
      setTimeout(() => Taro.navigateBack(), 1500)
    } catch {
      // error handled by api layer
    } finally {
      setLoading(false)
    }
  }

  return (
    <View className='change-pwd-page'>
      <NavBar title='修改密码' />

      <View className='form-section'>
        <View className='section-header'>
          <Icon name='shield' size={36} color='#00C853' />
          <Text className='section-title'>修改登录密码</Text>
        </View>
        <Text className='section-desc'>为保障账户安全，请定期修改密码</Text>

        <View className='form-card'>
          <View className='form-item'>
            <View className='item-label'>
              <Icon name='lock' size={36} color='#999' />
              <Text className='label-text'>当前密码</Text>
            </View>
            <View className='item-input-wrap'>
              <Input
                className='item-input'
                type={showOld ? 'text' : 'password'}
                placeholder='请输入当前密码'
                value={oldPassword}
                onInput={e => setOldPassword(e.detail.value)}
              />
              <View className='toggle-eye' onClick={() => setShowOld(!showOld)}>
                <Icon name={showOld ? 'eye' : 'eye-off'} size={36} color='#bbb' />
              </View>
            </View>
          </View>

          <View className='form-item'>
            <View className='item-label'>
              <Icon name='lock' size={36} color='#999' />
              <Text className='label-text'>新密码</Text>
            </View>
            <View className='item-input-wrap'>
              <Input
                className='item-input'
                type={showNew ? 'text' : 'password'}
                placeholder='至少6位，建议包含字母和数字'
                value={newPassword}
                onInput={e => setNewPassword(e.detail.value)}
              />
              <View className='toggle-eye' onClick={() => setShowNew(!showNew)}>
                <Icon name={showNew ? 'eye' : 'eye-off'} size={36} color='#bbb' />
              </View>
            </View>
          </View>

          <View className='form-item last'>
            <View className='item-label'>
              <Icon name='lock' size={36} color='#999' />
              <Text className='label-text'>确认新密码</Text>
            </View>
            <View className='item-input-wrap'>
              <Input
                className='item-input'
                type={showConfirm ? 'text' : 'password'}
                placeholder='请再次输入新密码'
                value={confirmPassword}
                onInput={e => setConfirmPassword(e.detail.value)}
              />
              <View className='toggle-eye' onClick={() => setShowConfirm(!showConfirm)}>
                <Icon name={showConfirm ? 'eye' : 'eye-off'} size={36} color='#bbb' />
              </View>
            </View>
          </View>
        </View>
      </View>

      <View className='btn-area'>
        <View
          className={`submit-btn ${loading ? 'disabled' : ''}`}
          onClick={loading ? undefined : handleSubmit}
        >
          <Text className='btn-text'>{loading ? '提交中...' : '确认修改'}</Text>
        </View>
      </View>

      <View className='tips-section'>
        <Text className='tips-title'>安全提示</Text>
        <Text className='tips-item'>· 密码长度至少6位</Text>
        <Text className='tips-item'>· 建议使用字母、数字组合</Text>
        <Text className='tips-item'>· 请勿使用与其他平台相同的密码</Text>
        <Text className='tips-item'>· 修改后需重新登录</Text>
      </View>
    </View>
  )
}

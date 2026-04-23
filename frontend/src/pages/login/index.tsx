import { useState, useEffect } from 'react'
import { View, Text, Input } from '@tarojs/components'
import Taro from '@tarojs/taro'
import { authApi } from '../../services/api'
import { useStore } from '../../store'
import Icon from '../../components/Icon'
import './index.scss'

export default function Login() {
  const [isLogin, setIsLogin] = useState(true)
  const [username, setUsername] = useState('')
  const [password, setPassword] = useState('')
  const [phone, setPhone] = useState('')
  const [rememberMe, setRememberMe] = useState(false)
  const [loading, setLoading] = useState(false)
  const [autoLogging, setAutoLogging] = useState(true)
  const { setUser, setToken } = useStore()

  useEffect(() => {
    // Check if already logged in (token exists)
    const token = Taro.getStorageSync('token')
    const userStr = Taro.getStorageSync('user')
    if (token && userStr) {
      // Token exists, auto-redirect to home
      setToken(token)
      try { setUser(JSON.parse(userStr)) } catch {}
      Taro.switchTab({ url: '/pages/index/index' })
      return
    }

    // Restore saved credentials
    const savedRemember = Taro.getStorageSync('remember_me')
    if (savedRemember) {
      setRememberMe(true)
      const savedUser = Taro.getStorageSync('saved_username')
      const savedPass = Taro.getStorageSync('saved_password')
      if (savedUser) setUsername(savedUser)
      if (savedPass) setPassword(savedPass)
    }
    setAutoLogging(false)
  }, [])

  const handleSubmit = async () => {
    if (!username || !password) {
      Taro.showToast({ title: '请填写用户名和密码', icon: 'none' })
      return
    }

    setLoading(true)
    try {
      let res: any
      if (isLogin) {
        res = await authApi.login({ username, password })
      } else {
        if (password.length < 6) {
          Taro.showToast({ title: '密码至少6位', icon: 'none' })
          setLoading(false)
          return
        }
        res = await authApi.register({ username, password, phone })
      }

      setToken(res.access_token)
      setUser(res.user)
      Taro.setStorageSync('token', res.access_token)
      Taro.setStorageSync('user', JSON.stringify(res.user))
      Taro.setStorageSync('login_time', Date.now().toString())

      // Save or clear credentials based on remember me
      if (rememberMe) {
        Taro.setStorageSync('remember_me', 'true')
        Taro.setStorageSync('saved_username', username)
        Taro.setStorageSync('saved_password', password)
      } else {
        Taro.removeStorageSync('remember_me')
        Taro.removeStorageSync('saved_username')
        Taro.removeStorageSync('saved_password')
      }

      Taro.switchTab({ url: '/pages/index/index' })
    } catch (err: any) {
      const msg = err?.message || err?.errMsg || '登录失败，请检查网络'
      Taro.showToast({ title: msg, icon: 'none', duration: 3000 })
    } finally {
      setLoading(false)
    }
  }

  // Show nothing while checking auto-login
  if (autoLogging) {
    return <View className='login-page' />
  }

  return (
    <View className='login-page'>
      <View className='login-header'>
        <View className='logo-container'>
          <View className='logo-icon'>
            <Icon name='navigation' size={56} color='#fff' />
          </View>
          <Text className='app-title'>GPS定位器</Text>
          <Text className='app-subtitle'>智能定位 安全守护</Text>
        </View>
      </View>

      <View className='login-form'>
        <View className='form-tabs'>
          <Text
            className={`tab ${isLogin ? 'active' : ''}`}
            onClick={() => setIsLogin(true)}
          >登录</Text>
          <Text
            className={`tab ${!isLogin ? 'active' : ''}`}
            onClick={() => setIsLogin(false)}
          >注册</Text>
        </View>

        <View className='input-group'>
          <View className='input-item'>
            <View className='input-icon'>
              <Icon name='user' size={36} color='#999' />
            </View>
            <Input
              className='input-field'
              placeholder='请输入用户名/设备ID'
              value={username}
              onInput={(e) => setUsername(e.detail.value)}
            />
          </View>

          <View className='input-item'>
            <View className='input-icon'>
              <Icon name='lock' size={36} color='#999' />
            </View>
            <Input
              className='input-field'
              type='password'
              password
              placeholder='请输入密码'
              value={password}
              onInput={(e) => setPassword(e.detail.value)}
            />
          </View>

          {!isLogin && (
            <View className='input-item'>
              <View className='input-icon'>
                <Icon name='smartphone' size={36} color='#999' />
              </View>
              <Input
                className='input-field'
                type='number'
                placeholder='请输入手机号（选填）'
                value={phone}
                onInput={(e) => setPhone(e.detail.value)}
              />
            </View>
          )}
        </View>

        {isLogin && (
          <View className='remember-row' onClick={() => setRememberMe(!rememberMe)}>
            <View className={`remember-check ${rememberMe ? 'checked' : ''}`}>
              {rememberMe && <Icon name='check' size={20} color='#fff' />}
            </View>
            <Text className='remember-text'>记住密码</Text>
          </View>
        )}

        <View
          className={`submit-btn ${loading ? 'disabled' : ''}`}
          onClick={!loading ? handleSubmit : undefined}
        >
          <Text>{loading ? '处理中...' : (isLogin ? '登 录' : '注 册')}</Text>
        </View>

        <View className='login-options'>
          <Text className='option-text'>
            {isLogin ? '集团用户登录' : '已有账号？去登录'}
          </Text>
        </View>
      </View>

      <View className='login-footer'>
        <Text className='footer-text'>GPS Tracker v1.0.8</Text>
      </View>
    </View>
  )
}

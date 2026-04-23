import { useState, useEffect } from 'react'
import { View, Text } from '@tarojs/components'
import Taro from '@tarojs/taro'
import { useStore } from '../../store'
import Icon from '../../components/Icon'
import './index.scss'

export default function ProfilePage() {
  const { user, currentDevice, setUser, setToken, refreshInterval, setRefreshInterval } = useStore()

  useEffect(() => {
    const userStr = Taro.getStorageSync('user')
    if (userStr && !user) {
      try { setUser(JSON.parse(userStr)) } catch {}
    }
  }, [])

  const handleLogout = () => {
    Taro.showModal({
      title: '确认退出',
      content: '确定要退出登录吗？',
      success: (res) => {
        if (res.confirm) {
          Taro.removeStorageSync('token')
          Taro.removeStorageSync('user')
          setUser(null)
          setToken(null)
          Taro.redirectTo({ url: '/pages/login/index' }).catch(() => {})
        }
      }
    })
  }

  const menuItems = [
    {
      title: '设备管理',
      items: [
        { label: '添加设备', iconName: 'plus-circle', onClick: () => Taro.navigateTo({ url: '/pages/add-device/index' }) },
        {
          label: '当前设备',
          iconName: 'smartphone',
          value: currentDevice?.deviceId || '未绑定',
          onClick: () => {
            if (currentDevice) {
              Taro.navigateTo({ url: `/pages/detail/index?deviceId=${currentDevice.deviceId}` })
            }
          }
        },
      ]
    },
    {
      title: '系统设置',
      items: [
        {
          label: '刷新频率',
          iconName: 'refresh-cw',
          value: refreshInterval >= 60000 ? `${refreshInterval / 60000}分钟` : `${refreshInterval / 1000}秒`,
          onClick: () => {
            Taro.showActionSheet({
              itemList: ['5秒', '10秒', '30秒', '1分钟', '5分钟', '10分钟'],
              success: (res) => {
                const intervals = [5000, 10000, 30000, 60000, 300000, 600000]
                setRefreshInterval(intervals[res.tapIndex])
              }
            })
          }
        },
        { label: '语言', iconName: 'globe', value: '中文', onClick: () => Taro.showToast({ title: '暂只支持中文', icon: 'none' }) },
      ]
    },
    {
      title: '其他',
      items: [
        { label: '修改密码', iconName: 'key', onClick: () => Taro.showToast({ title: '功能开发中', icon: 'none' }) },
        { label: '售后投诉', iconName: 'phone', onClick: () => Taro.showToast({ title: '请联系客服', icon: 'none' }) },
        { label: '关于', iconName: 'info', value: 'v1.0.0', onClick: () => Taro.showToast({ title: 'GPS Tracker v1.0.0', icon: 'none' }) },
      ]
    }
  ]

  return (
    <View className='profile-page'>
      <View className='user-card'>
        <View className='avatar'>
          <Text className='avatar-text'>{user?.username?.[0]?.toUpperCase() || 'U'}</Text>
        </View>
        <View className='user-info'>
          <Text className='username'>{user?.username || '未登录'}</Text>
          <Text className='user-type'>{user?.userType === 'enterprise' ? '集团用户' : '个人用户'}</Text>
        </View>
      </View>

      {menuItems.map((section, sIdx) => (
        <View key={sIdx} className='menu-section'>
          <Text className='section-title'>{section.title}</Text>
          {section.items.map((item, iIdx) => (
            <View key={iIdx} className='menu-item' onClick={item.onClick}>
              <View className='item-icon-wrap'>
                <Icon name={item.iconName} size={36} color='#666' />
              </View>
              <Text className='item-label'>{item.label}</Text>
              <View className='item-right'>
                {'value' in item && <Text className='item-value'>{item.value}</Text>}
                <Icon name='chevron-right' size={28} color='#ccc' />
              </View>
            </View>
          ))}
        </View>
      ))}

      <View className='logout-section'>
        <View className='logout-btn' onClick={handleLogout}>
          <Icon name='log-out' size={32} color='#ff4d4f' />
          <Text className='logout-text'>退出登录</Text>
        </View>
      </View>
    </View>
  )
}

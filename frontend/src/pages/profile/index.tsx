import { useState, useEffect } from 'react'
import { View, Text } from '@tarojs/components'
import Taro from '@tarojs/taro'
import { useStore } from '../../store'
import Icon from '../../components/Icon'
import ColorIconBadge from '../../components/ColorIconBadge'
import './index.scss'

export default function ProfilePage() {
  const { user, currentDevice, devices, setUser, setToken, refreshInterval, setRefreshInterval } = useStore()

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
        { label: '添加设备', iconName: 'plus-circle', preset: 'blue' as const, onClick: () => Taro.navigateTo({ url: '/pages/add-device/index' }) },
        {
          label: '当前设备',
          iconName: 'smartphone',
          preset: 'green' as const,
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
          preset: 'purple' as const,
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
        { label: '语言', iconName: 'globe', preset: 'orange' as const, value: '中文', onClick: () => Taro.showToast({ title: '暂只支持中文', icon: 'none' }) },
      ]
    },
    {
      title: '其他',
      items: [
        { label: '修改密码', iconName: 'key', preset: 'red' as const, onClick: () => Taro.navigateTo({ url: '/pages/change-password/index' }) },
        { label: '售后投诉', iconName: 'headphones', preset: 'teal' as const, onClick: () => Taro.showToast({ title: '请联系客服：400-000-0000', icon: 'none' }) },
        { label: '关于', iconName: 'info', preset: 'gray' as const, value: 'v1.0.7', onClick: () => {
          Taro.showModal({
            title: 'GPS定位器',
            content: '版本 v1.0.7\n智能定位 安全守护\n\n实时定位追踪\n历史轨迹回放\n电子围栏安全守护\n多设备管理',
            showCancel: false,
          })
        }},
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
          <View className='user-meta'>
            <Text className='user-type'>{user?.userType === 'enterprise' ? '集团用户' : '个人用户'}</Text>
            <Text className='device-count'>{devices.length}台设备</Text>
          </View>
        </View>
      </View>

      {menuItems.map((section, sIdx) => (
        <View key={sIdx} className='menu-section'>
          <Text className='section-title'>{section.title}</Text>
          {section.items.map((item, iIdx) => (
            <View key={iIdx} className='menu-item' onClick={item.onClick}>
              <ColorIconBadge iconName={item.iconName} size='sm' preset={item.preset} />
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
          <Icon name='log-out' size={32} color='#FF3D00' />
          <Text className='logout-text'>退出登录</Text>
        </View>
      </View>
    </View>
  )
}

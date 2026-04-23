import { View, Text } from '@tarojs/components'
import Taro from '@tarojs/taro'
import Icon from './Icon'

interface NavBarProps {
  title: string
  back?: boolean
  rightContent?: React.ReactNode
}

export default function NavBar({ title, back = true, rightContent }: NavBarProps) {
  const handleBack = () => {
    const pages = Taro.getCurrentPages()
    if (pages.length > 1) {
      Taro.navigateBack()
    } else {
      Taro.switchTab({ url: '/pages/index/index' })
    }
  }

  return (
    <View className='navbar'>
      {back ? (
        <View className='navbar-back' onClick={handleBack}>
          <Icon name='chevron-left' size={44} color='#333' />
          <Text className='navbar-back-text'>返回</Text>
        </View>
      ) : (
        <View className='navbar-placeholder' />
      )}
      <Text className='navbar-title'>{title}</Text>
      <View className='navbar-right'>
        {rightContent}
      </View>
    </View>
  )
}

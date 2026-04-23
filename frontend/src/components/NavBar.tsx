import { View, Text } from '@tarojs/components'
import Taro from '@tarojs/taro'
import Icon from './Icon'

interface NavBarProps {
  title: string
  back?: boolean
}

export default function NavBar({ title, back = true }: NavBarProps) {
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
      {back && (
        <View className='navbar-back' onClick={handleBack}>
          <Icon name='chevron-left' size={40} color='#333' />
        </View>
      )}
      <Text className='navbar-title'>{title}</Text>
      <View className='navbar-right' />
    </View>
  )
}

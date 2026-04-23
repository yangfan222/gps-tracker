import { useState } from 'react'
import { View, Text, ScrollView } from '@tarojs/components'
import Taro, { useRouter } from '@tarojs/taro'
import Icon from '../../components/Icon'
import NavBar from '../../components/NavBar'
import './index.scss'

interface RechargePackage {
  id: string
  name: string
  data: string
  duration: string
  price: number
  originalPrice: number
  tag?: string
}

const PACKAGES: RechargePackage[] = [
  { id: 'pkg_month_30m', name: '月套餐', data: '30MB', duration: '1个月', price: 5, originalPrice: 8 },
  { id: 'pkg_quarter_100m', name: '季套餐', data: '100MB', duration: '3个月', price: 12, originalPrice: 20, tag: '热门' },
  { id: 'pkg_year_300m', name: '年套餐', data: '300MB', duration: '12个月', price: 36, originalPrice: 60, tag: '超值' },
  { id: 'pkg_year_1g', name: '大流量年套餐', data: '1GB', duration: '12个月', price: 68, originalPrice: 120, tag: '推荐' },
]

export default function RechargePage() {
  const router = useRouter()
  const deviceId = router.params.deviceId || ''
  const simNumber = router.params.simNumber || ''
  const [selectedPkg, setSelectedPkg] = useState<string>(PACKAGES[1].id)
  const [paying, setPaying] = useState(false)

  const selectedPackage = PACKAGES.find(p => p.id === selectedPkg)

  const handlePay = async () => {
    if (!selectedPackage) return
    setPaying(true)

    // TODO: 对接实际支付接口 (微信支付/支付宝)
    // 当前为模拟流程，实际生产环境需要对接:
    // 1. 后端创建充值订单: POST /api/sim-card/:deviceId/recharge
    // 2. 后端返回支付参数 (prepay_id 等)
    // 3. 前端调用 Taro.requestPayment 发起微信支付
    // 4. 支付回调后确认订单状态

    try {
      // 模拟支付延迟
      await new Promise(resolve => setTimeout(resolve, 1500))
      Taro.showModal({
        title: '充值提示',
        content: `充值功能需要对接运营商和支付平台。\n\n当前选择：${selectedPackage.name}\n套餐流量：${selectedPackage.data}/${selectedPackage.duration}\n支付金额：¥${selectedPackage.price}\n\n实际充值功能将在对接支付接口后开通。`,
        showCancel: false,
        confirmText: '我知道了',
        confirmColor: '#00C853',
      })
    } finally {
      setPaying(false)
    }
  }

  return (
    <View className='recharge-page'>
      <NavBar title='流量充值' />

      <View className='device-info'>
        <View className='info-left'>
          <Icon name='smartphone' size={40} color='#00C853' />
          <View className='info-text'>
            <Text className='device-label'>充值设备</Text>
            <Text className='device-id'>{deviceId || '未知设备'}</Text>
          </View>
        </View>
        {simNumber && <Text className='sim-num'>SIM: {simNumber}</Text>}
      </View>

      <View className='section-header'>
        <Text className='section-title'>选择套餐</Text>
        <Text className='section-desc'>选择适合您设备的流量套餐</Text>
      </View>

      <ScrollView className='pkg-list' scrollY>
        {PACKAGES.map(pkg => (
          <View
            key={pkg.id}
            className={`pkg-card ${selectedPkg === pkg.id ? 'selected' : ''}`}
            onClick={() => setSelectedPkg(pkg.id)}
          >
            {pkg.tag && (
              <View className='pkg-tag'>
                <Text className='tag-text'>{pkg.tag}</Text>
              </View>
            )}
            <View className='pkg-main'>
              <Text className='pkg-name'>{pkg.name}</Text>
              <View className='pkg-detail'>
                <Text className='pkg-data'>{pkg.data}</Text>
                <Text className='pkg-duration'>/ {pkg.duration}</Text>
              </View>
            </View>
            <View className='pkg-price'>
              <View className='price-row'>
                <Text className='price-symbol'>¥</Text>
                <Text className='price-num'>{pkg.price}</Text>
              </View>
              <Text className='price-original'>¥{pkg.originalPrice}</Text>
            </View>
            <View className='pkg-check'>
              {selectedPkg === pkg.id ? (
                <Icon name='check-circle' size={44} color='#00C853' />
              ) : (
                <View className='check-empty' />
              )}
            </View>
          </View>
        ))}
      </ScrollView>

      <View className='pay-section'>
        <View className='pay-info'>
          <Text className='pay-label'>应付金额</Text>
          <View className='pay-amount'>
            <Text className='amount-symbol'>¥</Text>
            <Text className='amount-num'>{selectedPackage?.price || 0}</Text>
          </View>
        </View>
        <View
          className={`pay-btn ${paying ? 'disabled' : ''}`}
          onClick={paying ? undefined : handlePay}
        >
          <Text className='btn-text'>{paying ? '处理中...' : '立即充值'}</Text>
        </View>
      </View>

      <View className='tips-section'>
        <Text className='tips-title'>充值须知</Text>
        <Text className='tips-item'>· 充值成功后流量立即生效</Text>
        <Text className='tips-item'>· 套餐到期后未使用流量将清零</Text>
        <Text className='tips-item'>· 充值后不支持退款，请确认后购买</Text>
        <Text className='tips-item'>· 如有疑问请联系客服</Text>
      </View>
    </View>
  )
}

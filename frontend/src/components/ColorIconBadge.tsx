import { View } from '@tarojs/components'
import Icon from './Icon'

const PRESETS: Record<string, [string, string]> = {
  green: ['#00E676', '#00C853'],
  blue: ['#448AFF', '#2979FF'],
  orange: ['#FFAB40', '#FF9100'],
  purple: ['#B388FF', '#7C4DFF'],
  pink: ['#FF80AB', '#F50057'],
  red: ['#FF6E40', '#FF3D00'],
  teal: ['#64FFDA', '#1DE9B6'],
  gray: ['#90A4AE', '#607D8B'],
}

const SIZES = {
  sm: { box: 40, icon: 36 },
  md: { box: 80, icon: 48 },
  lg: { box: 100, icon: 56 },
}

interface ColorIconBadgeProps {
  iconName: string
  size?: 'sm' | 'md' | 'lg'
  preset?: keyof typeof PRESETS
  gradient?: [string, string]
  className?: string
}

export default function ColorIconBadge({
  iconName,
  size = 'md',
  preset = 'green',
  gradient,
  className = '',
}: ColorIconBadgeProps) {
  const [colorA, colorB] = gradient || PRESETS[preset] || PRESETS.green
  const s = SIZES[size]

  return (
    <View
      className={`color-icon-badge ${className}`}
      style={{
        width: `${s.box}px`,
        height: `${s.box}px`,
        minWidth: `${s.box}px`,
        minHeight: `${s.box}px`,
        borderRadius: size === 'sm' ? '10px' : size === 'md' ? '18px' : '22px',
        background: `linear-gradient(135deg, ${colorA}, ${colorB})`,
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
      }}
    >
      <Icon name={iconName} size={s.icon} color='#fff' />
    </View>
  )
}

import { useEffect, useRef } from 'react'
import Taro from '@tarojs/taro'

// Static import for H5 - webpack will bundle it
import L from 'leaflet'
import 'leaflet/dist/leaflet.css'

// Fix Leaflet default icon paths (webpack breaks them)
delete (L.Icon.Default.prototype as any)._getIconUrl
L.Icon.Default.mergeOptions({
  iconRetinaUrl: require('leaflet/dist/images/marker-icon-2x.png'),
  iconUrl: require('leaflet/dist/images/marker-icon.png'),
  shadowUrl: require('leaflet/dist/images/marker-shadow.png'),
})

interface MapViewProps {
  latitude: number
  longitude: number
  deviceName?: string
  zoom?: number
  trackPoints?: { latitude: number; longitude: number; speed?: number; createdAt?: string }[]
  onMapReady?: () => void
}

export default function MapView({ latitude, longitude, deviceName, zoom = 15, trackPoints, onMapReady }: MapViewProps) {
  const mapRef = useRef<L.Map | null>(null)
  const markerRef = useRef<L.Marker | null>(null)
  const polylineRef = useRef<L.Polyline | null>(null)
  const trackMarkersRef = useRef<L.Marker[]>([])
  const containerRef = useRef<HTMLDivElement>(null)
  const observerRef = useRef<ResizeObserver | null>(null)

  // Initialize map
  useEffect(() => {
    if (typeof window === 'undefined' || !containerRef.current) return

    // Use requestAnimationFrame to ensure container is laid out
    const rafId = requestAnimationFrame(() => {
      const container = containerRef.current
      if (!container || mapRef.current) return

      const map = L.map(container, {
        center: [latitude || 22.5431, longitude || 114.0579],
        zoom,
        zoomControl: false,
        attributionControl: false,
      })

      // Gaode (AMap) tiles - accessible in China
      L.tileLayer('https://webrd0{s}.is.autonavi.com/appmaptile?lang=zh_cn&size=1&scale=1&style=8&x={x}&y={y}&z={z}', {
        maxZoom: 18,
        subdomains: ['1', '2', '3', '4'],
        attribution: '&copy; 高德地图',
      }).addTo(map)

      // Zoom control at bottom-right
      L.control.zoom({ position: 'bottomright' }).addTo(map)

      // Attribution at bottom-left (collapsed)
      L.control.attribution({ position: 'bottomleft', prefix: false })
        .addAttribution('&copy; <a href="https://osm.org">OSM</a>')
        .addTo(map)

      mapRef.current = map

      // ResizeObserver to handle container size changes
      observerRef.current = new ResizeObserver(() => {
        map.invalidateSize()
      })
      observerRef.current.observe(container)

      onMapReady?.()
    })

    return () => {
      cancelAnimationFrame(rafId)
      if (observerRef.current) {
        observerRef.current.disconnect()
        observerRef.current = null
      }
      if (mapRef.current) {
        mapRef.current.remove()
        mapRef.current = null
      }
      markerRef.current = null
      polylineRef.current = null
      trackMarkersRef.current = []
    }
  }, []) // Only run once on mount

  // Update marker position when lat/lng changes
  useEffect(() => {
    const map = mapRef.current
    if (!map || !latitude || !longitude) return

    const pos: L.LatLngExpression = [latitude, longitude]

    if (markerRef.current) {
      markerRef.current.setLatLng(pos)
    } else {
      const deviceIcon = L.divIcon({
        className: 'device-marker-icon',
        html: `<div style="
          width: 22px; height: 22px;
          background: #1890ff;
          border: 3px solid #fff;
          border-radius: 50%;
          box-shadow: 0 2px 10px rgba(24,144,255,0.5);
        "></div>`,
        iconSize: [22, 22],
        iconAnchor: [11, 11],
      })
      markerRef.current = L.marker(pos, { icon: deviceIcon }).addTo(map)
    }

    markerRef.current.bindPopup(
      `<div style="font-size:13px;line-height:1.6">
        <b>${deviceName || 'Device'}</b><br/>
        Lat: ${latitude.toFixed(6)}<br/>
        Lng: ${longitude.toFixed(6)}
      </div>`
    )

    // Only pan if not showing track
    if (!trackPoints?.length) {
      map.setView(pos, map.getZoom())
    }
  }, [latitude, longitude, deviceName])

  // Draw track
  useEffect(() => {
    const map = mapRef.current
    if (!map) return

    // Clean up previous track
    if (polylineRef.current) {
      map.removeLayer(polylineRef.current)
      polylineRef.current = null
    }
    trackMarkersRef.current.forEach(m => map.removeLayer(m))
    trackMarkersRef.current = []

    if (!trackPoints?.length) return

    const latlngs: L.LatLngExpression[] = trackPoints.map(p => [p.latitude, p.longitude])

    // Gradient-like polyline
    polylineRef.current = L.polyline(latlngs, {
      color: '#1890ff',
      weight: 4,
      opacity: 0.85,
      smoothFactor: 1,
    }).addTo(map)

    // Start / End markers
    if (trackPoints.length >= 2) {
      const startIcon = L.divIcon({
        className: '',
        html: '<div style="width:22px;height:22px;background:#52c41a;border:2px solid #fff;border-radius:50%;display:flex;align-items:center;justify-content:center;color:#fff;font-size:11px;font-weight:700;box-shadow:0 2px 6px rgba(82,196,26,0.4);">S</div>',
        iconSize: [22, 22],
        iconAnchor: [11, 11],
      })
      const endIcon = L.divIcon({
        className: '',
        html: '<div style="width:22px;height:22px;background:#ff4d4f;border:2px solid #fff;border-radius:50%;display:flex;align-items:center;justify-content:center;color:#fff;font-size:11px;font-weight:700;box-shadow:0 2px 6px rgba(255,77,79,0.4);">E</div>',
        iconSize: [22, 22],
        iconAnchor: [11, 11],
      })

      const sMarker = L.marker([trackPoints[0].latitude, trackPoints[0].longitude], { icon: startIcon }).addTo(map)
      const eMarker = L.marker([trackPoints[trackPoints.length - 1].latitude, trackPoints[trackPoints.length - 1].longitude], { icon: endIcon }).addTo(map)
      trackMarkersRef.current.push(sMarker, eMarker)
    }

    map.fitBounds(polylineRef.current.getBounds(), { padding: [40, 40] })
  }, [trackPoints])

  return (
    <div
      ref={containerRef}
      style={{
        position: 'absolute',
        top: 0,
        left: 0,
        right: 0,
        bottom: 0,
        background: '#e8edf3',
      }}
    />
  )
}

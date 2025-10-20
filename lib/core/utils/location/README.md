# Basm Allah Elrahman Elrahim

## Guide permisison

0. install flutter

* flutter 3.29.4

```
  geolocator: 13.0.1
```

1. android manifest.xml

```

    <!--     location permissions-->
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />

```

2. ios

* info.plist

```
<key>NSLocationWhenInUseUsageDescription</key>
<string>We need your location to show nearby data.</string>
<key>NSLocationAlwaysUsageDescription</key>
<string>We use your location even when the app is in the background.</string>
<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
<string>We use your location to improve your experience.</string>
```

* Capabilities

```
Select Runner target → Signing & Capabilities → + Capability

Add Background Modes, and enable:

Location updates (only if needed)
```
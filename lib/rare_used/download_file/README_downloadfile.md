# basm allah elrahman elraheem

# Download File Intent  

- dependencies :
``` 

  # file download
  path_provider: 2.1.5
  open_file: 3.3.2
  device_info_plus: 9.1.1

```

- android manfiest permissions :
```
    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />

    <!-- AI SET >> File picker permissions for Android 13+ (API 33+) -->
    <uses-permission android:name="android.permission.READ_MEDIA_IMAGES"/>
    <uses-permission android:name="android.permission.READ_MEDIA_VIDEO"/>
    <uses-permission android:name="android.permission.READ_MEDIA_AUDIO"/>
    
```

- ios not tested yet 
```

    	<key>NSPhotoLibraryUsageDescription</key>
    	<string>Capture personal photo for his profile, to be show at his profile page</string>

    	<!-- Permission for adding photos/files to photo library -->
    	<key>NSPhotoLibraryAddUsageDescription</key>
    	<string>Save downloaded images and files to your photo library</string>

    	<!-- Permission for camera access -->
    	<key>NSCameraUsageDescription</key>
    	<string>Take photos for your profile and property listings</string>

    	<!-- Permission for accessing documents directory -->
    	<key>UIFileSharingEnabled</key>
    	<true/>
    	<key>LSSupportsOpeningDocumentsInPlace</key>
    	<true/>

```
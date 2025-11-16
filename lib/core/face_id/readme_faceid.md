# Basm allah ElRahman ElRahim

## Flutter setup

```
  #auth
  local_auth: 2.3.0

```

## IOS Config:

```
	<key>NFCReaderUsageDescription</key>
	<string>We use NFC to scan smart Store cards to allow user to purchases</string>
	
    <key>NSFaceIDUsageDescription</key>
    <string>This app uses Face ID to authenticate the user securely.</string>
```

## Android config

* AndroidManifest file

``` 
<uses-permission android:name="android.permission.USE_BIOMETRIC" />
<uses-permission android:name="android.permission.USE_FINGERPRINT" />
```

* style file

```
  <style name="LaunchTheme" parent="Theme.AppCompat.DayNight">
    ...
  </style>
```

2. File MainActivity :

* change from "Activity" to "Fragment"

```
- from 

class MainActivity : FlutterActivity() {

- to 

import io.flutter.embedding.android.FlutterFragmentActivity
class MainActivity : FlutterFragmentActivity() {
```

* change any context to type "applicationContext"

```
- from 
   context.startActivity(intent)
   
- to
   applicationContext.startActivity(intent)
```

(Note: if still show error, you need to clean flutter and run device with terminal to see logs )

## Example

```
    await FaceIdHelper.openAuthDialog(
        context: context,
        onNotSupportedCallback: () async {
          await chooseNextPageLiveAfterSplash(context);
        },
        onComplete: (status, errorMessage, codeError) async {
          if (status) {
            await chooseNextPageLiveAfterSplash(context);
          }
        });
```
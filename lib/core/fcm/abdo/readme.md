#بسم الله الرحمن الرحيم 

* date update: 2025-09-15


# Notification handler when click

--------------------------------------------------------------------------- Document by Abdallah HimSelf

## Document by Abdallah HimSelf

### in Manfiest Android 
* under <Manifest> tag
```
    <uses-permission android:name="android.permission.POST_NOTIFICATIONS"/>
```

* under <Application> tag
```

            <!-- abdo : notification -->
            <meta-data
                android:name="com.google.firebase.messaging.default_notification_channel_id"
                android:value="high_importance_channel"/>


            <meta-data
                android:name="com.google.firebase.messaging.default_notification_icon"
                android:resource="@drawable/notification_icon" />
            <meta-data
                android:name="com.google.firebase.messaging.default_notification_color"
                android:resource="@color/notification_icon_color"  />
 
            <meta-data
              android:name="io.flutter.embedding.android.NormalTheme"
              android:resource="@style/NormalTheme"         />

            <meta-data
                android:name="firebase_messaging_auto_init_enabled"
                android:value="false" />
            <meta-data
                android:name="firebase_analytics_collection_enabled"
                android:value="false" />
```

### Drawable Resource

image notification size 24 * 24 px

```
//found in android/src/main/res/drawable/notification_icon.png
```

## FCM get counter notification unread

* once there is message received from FCM, redownload the counter from server
``` 
  Future refreshNotificationBadgeCounter() async {
    Log.i( "fcm - refreshNotificationBadgeCounter() - contextFcm: " + contextFcm.toString() );
    if( contextFcm == null ) return;
    NotificationsCubit.get( contextFcm).getCounter(); 
  }

```

## Handle on click notification :

* file   "SocketDataFcmListener.dart"
```
   Future eventData(MMessageFcm mFcm ) async {
    Log.i( "eventData- mFcm: " + mFcm.toString() );
    /// to do
   }
```

## at main method 
```
    WidgetsFlutterBinding.ensureInitialized();
    var options = DefaultFirebaseOptions.currentPlatform;
    Log.i("main() - DefaultFirebaseOptions: $options");
    await Firebase.initializeApp(
      options: options,
    );
    await setupFcmFromMainMethod();
```

## at myapp 

``` 

class MyAppState extends State<MyApp>  with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback( (t){
      if(GlobalApp.getContexts() != null ) setupFcmFromMainPage( GlobalApp.getContexts()!);
    });

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      Log.i("fcm - MyAppState - didChangeAppLifecycleState");
      isStateFromTerminated = false;
    }
  }
```

## SSH key 

### Android debug:

1. get android key
```
keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android

```

2. add to firebase console android app 

### Android release jks file :

1. get android key
* how to get  fingerprint sha for jks path - jks
```
/Users/abdallahandroid/Project-flutter-dafa/Maqsafy/wk/Maqsafy_Flutter_App/android/app/fastor_app_ui_widget_egypt.jks

```
* generate by path
```
cd /Users/abdallahandroid/Project-flutter-dafa/Maqsafy/wk/Maqsafy_Flutter_App/android/app 
keytool -list -v -keystore fastor_app_ui_widget_egypt.jks -alias <your-alias> -storepass <store-password> -keypass <key-password>

```
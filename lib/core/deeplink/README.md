basm allah alrahman elrahmim

## Get start 

1. code setup form main screens 
```
    @override
    void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback( ( t ){
    initDeepLinkFromMainScreens(context);
    });
    }

```

2. at file "DeepLinkSetup" handle navigation 
 
4. Android Manfiest 
``` 
            <!-- Deep Link skip verify AppLink -->
           <intent-filter  android:autoVerify="true"  >

                <action android:name="android.intent.action.VIEW" />
                <category android:name="android.intent.category.DEFAULT" />
                <category android:name="android.intent.category.BROWSABLE" />
                <data
                    android:scheme="https"
                    android:host="matjaraqar.com"
                    android:pathPrefix="/r/" />

            </intent-filter>

```

basm allah alrahman elrahmim

## Get start 

1. form main() 
```
await initDeepLinkFromMainMethod();
```

2. from main screen : 
* like home/login/any navigation bottom main
```
  @override
  void initState() { 
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) { 
      initDeepLinkFromMainScreens(context);
    });
  }

```

3. at file "DeepLinkSetup" handle navigation 
 
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

5. at class target navigation :
* make once click back refresh the app, by open home page 
- router :
```
  static void realestateDetailPageByIdOpenByDeepLink(BuildContext context, int  realestateModelSelectedId) {
    Log.i("RouterPage - realestateDetailPageByIdOpenByDeepLink() - context: $context");
    Log.i("RouterPage - realestateDetailPageByIdOpenByDeepLink() - realestateModelSelectedId: $realestateModelSelectedId");
    NavigationTools.push(context, RealestateDetailScreen(
        id: realestateModelSelectedId,
        isOpenFromDeepLink : true,
    ) );
  }
```

- handle click back :
```
  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop:  false    ,
        onPopInvoked: ( b ) async {
          Log.i( "RealestateDetailScreen - PopScope() - click - isOpenFromDeepLink: ${widget.isOpenFromDeepLink}");
          if( widget.isOpenFromDeepLink! ) {
            RouterPage.home(context);
          } else {
            Navigator.pop(context);
          }
          return   ;
        },
        child: consumerRealestate()
    );
  }

```
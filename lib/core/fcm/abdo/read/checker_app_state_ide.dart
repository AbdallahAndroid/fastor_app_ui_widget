import 'package:fastor_app_ui_widget/core/fcm/abdo/FCMRegister.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';

/**
 how to use
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
 */
bool isAppTerminatedWhileReceivedMessageBackgroundInvoked() {

  // bool caseAppTerminatedWhileReceivedMessageBackgroundInvoked = contextFcm == null;
  // Log.i( "fcm - isAppTerminatedWhileReceivedMessageBackgroundInvoked() - contextFcm: $contextFcm "  );
  Log.i( "fcm - isAppTerminatedWhileReceivedMessageBackgroundInvoked() - isStateFromTerminated: $isStateFromTerminated "  );
  // Log.i( "fcm - isAppTerminatedWhileReceivedMessageBackgroundInvoked() - caseAppTerminatedWhileReceivedMessageBackgroundInvoked: $caseAppTerminatedWhileReceivedMessageBackgroundInvoked "  );
  return isStateFromTerminated;
}
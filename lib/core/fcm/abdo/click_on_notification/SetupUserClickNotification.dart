import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/core/fcm/abdo/general/m/MFcm.dart';

import 'FCMNavigateToSpecificPage.dart';



    Future setupClickNotificationOnForegroundIOS(MMessageFcm  mFcm ) async {

    Log.i( "fcm - setupClickNotificationOnForegroundIOS()"  );

    // //check not foregorund
    // bool isForeground = FastorStateManagement.instance().isAppForeground();
    // if(isForeground == false ) {
    //   Log.i( "fcm - setupClickNotificationOnForegroundIOS() - isForeground == false  - stop "  );
    //   return;
    // }

    //parse sender_id from payload

    clickNotificationHappened(      ""  ); //senderIdFromPayload
  }


    Future setupClickNotificationOnForegroundAndroid( String?  pathPayload) async {
    //check empty
    if( pathPayload == null ) {
      Log.i( "fcm - setupClickNotificationOnForegroundAndroid() - pathPayload == null  - stop  "   );
      return;
    }
    Log.i( "fcm - setupClickNotificationOnForegroundAndroid() - pathPayload found data"   );

    // //check not foregorund
    // bool isForeground = FastorStateManagement.instance().isAppForeground();
    // if(isForeground == false ) {
    //   Log.i( "fcm - setupClickNotificationOnForeground() - isForeground == false  - stop "  );
    //   return;
    // }

    //parse sender_id from payload
    //
    //  Log.i( "fcm - setupClickNotificationOnForegroundAndroid() - senderIdFromPathPayload: " + senderIdFromPathPayload  );
     clickNotificationHappened(    pathPayload );

  }

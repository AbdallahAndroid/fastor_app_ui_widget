
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/core/utils/values/ToolsValidation.dart';
import 'package:flutter/material.dart';
import 'package:uni_links3/uni_links.dart';

enum  EnumDeepLinkReceivedTypes { foreground, firsTimeOpenApp }

///------------------------------------------------------------------------------- vairalbe

/// this save there pending action need to open after sometime
String? deepLinkPending;
EnumDeepLinkReceivedTypes? deepLinkReceivedTypes;


///------------------------------------------------------------------------------------- setup and pulbic method


/// at main()
Future initDeepLinkFromMainMethod() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await _checkThereIsDeepLinkAfterTerminatedState();
}

/**
 *
    //- from main screens like home/login / ... etc
 */
Future<void> initDeepLinkFromMainScreens(BuildContext contextPage ) async {
  _setupListenerForegroundState(contextPage);
  _handleDeepLinkIfFound(contextPage);
}


///----------------------------------------------------------------------------- private methods


Future _checkThereIsDeepLinkAfterTerminatedState()async {
  try {
    final initialLink = await getInitialLink();
    if (initialLink != null) {
      deepLinkPending = initialLink;
      deepLinkReceivedTypes = EnumDeepLinkReceivedTypes.firsTimeOpenApp;
      // handleDeepLinkIfFound(contextPage);
      Log.i('deeplink - _checkThereIsDeepLinkAfterTerminatedState() once open app there is deepLink: $deepLinkPending');

    }
  } catch (e) {
    Log.i('deeplink - _checkThereIsDeepLinkAfterTerminatedState()  - Failed to get initial link: $e');
  }
}


void _setupListenerForegroundState(BuildContext contextPage) async {

  /// uinlinks plugin stream
  linkStream.listen((String? link) {
    if (link != null) {
      deepLinkPending = link;
      deepLinkReceivedTypes = EnumDeepLinkReceivedTypes.foreground;
      Log.i('deeplink - _setupListenerForegroundState() linkStream.listen found deepLink: $deepLinkPending');
      _refreshAppThePreviewDataDeedLink(contextPage);
      // handleDeepLinkIfFound( contextPage );
    }
  }, onError: (err) {
    print('deeplink - _setupListenerForegroundState() Error listening to deep link: $err');
  });

}


void _refreshAppThePreviewDataDeedLink(BuildContext contextPage){
  try {
    if( contextPage.mounted ) {
      Log.i("deeplink - _refreshAppThePreviewDataDeedLink()  ");
      // RouterPage.splash(contextPage);
    }
  } catch (e) {
    Log.i('deeplink - _refreshAppThePreviewDataDeedLink() Invalid deep link: $deepLinkPending, error: $e');
  }
}

///---------------------------------------------------------------------------- handle

void _handleDeepLinkIfFound(BuildContext contextPage ) {


  try {
    if( contextPage.mounted == false  ) {
      Log.i("deeplink - _handleDeepLinkIfFound() - contextPage: $contextPage");
      Log.i("deeplink - _handleDeepLinkIfFound() - contextPage not mounted - stop ! ");
      return;
    }

    if( ToolsValidation.isEmpty( deepLinkPending) )return;
    Log.i("deeplink - handleDeepLinkIfFound()  - found data  - deepLinkReceivedTypes: $deepLinkReceivedTypes");

    /// get old deep link data . then clear it
    final uri = Uri.parse(deepLinkPending!);
    _clearPendingDeepLinkDataAfterUsed();

    // Check that path starts with /r/
    final segments = uri.pathSegments;
    if (segments.length >= 2 && segments[0] == 'r') {
      final realestateId = segments.last;
      Log.i("deeplink - handleDeepLinkIfFound()  - realestateId: $realestateId ");
      // int idInteger = int.parse( realestateId );
      // RouterPage.realestateDetailPageByIdOpenByDeepLink( contextPage , idInteger );
    }
  } catch (e) {
    Log.i('deeplink - handleDeepLinkIfFound() Invalid deep link: $deepLinkPending, error: $e');
  }
}


void _clearPendingDeepLinkDataAfterUsed() {
  Log.i("deeplink - _clearPendingDeepLinkDataAfterUsed()");
  deepLinkPending = null;
  deepLinkReceivedTypes = null;
}


import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/core/utils/values/ToolsValidation.dart';
import 'package:flutter/material.dart';
import 'package:uni_links3/uni_links.dart';

///------------------------------------------------------------------------------- vairalbe

String? deepLink;


///------------------------------------------------------------------------------------- setup

/**
 *
 * 1- from main screens like home/login / ... etc
    @override
    void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback( ( t ){
    initDeepLinkFromMainScreens(context);
    });
    }

    2- pluign
    uni_links3: ^0.5.3
 */
Future<void> initDeepLinkFromMainScreens(BuildContext contextPage ) async {
    try {
      final initialLink = await getInitialLink();
      if (initialLink != null) {

          deepLink = initialLink;

          _handleDeepLink(contextPage);
          Log.i('deeplink - _initDeepLink() deepLink: $deepLink');

      }
    } catch (e) {
      Log.i('deeplink - _initDeepLink()  - Failed to get initial link: $e');
    }

    /// uinlinks plugin stream
    linkStream.listen((String? link) {
      if (link != null) {
        // setState(() {
          deepLink = link;
          Log.i('deeplink - _initDeepLink() linkStream.listen deepLink: $deepLink');
          _handleDeepLink( contextPage );

        // });
      }
    }, onError: (err) {
      print('deeplink - _initDeepLink() Error listening to deep link: $err');
    });
  }

  ///---------------------------------------------------------------------------- handle

/// example: https://matjaraqar.com/r/212
  void _handleDeepLink(BuildContext contextPage ) {
    Log.i("Deeplink - _handleLink()  - start  ");
    if( ToolsValidation.isEmpty( deepLink) )return;

    try {
      final uri = Uri.parse(deepLink!);

      // Check that path starts with /r/
      final segments = uri.pathSegments;
      if (segments.length >= 2 && segments[0] == 'r') {
        final realestateId = segments.last;
        Log.i("Deeplink - _handleLink()  - realestateId: $realestateId ");
          int idInteger = int.parse( realestateId );
          // RouterPage.realestateDetailPageById( contextPage , idInteger );
      }
    } catch (e) {
      Log.i('deeplink - _handleDeepLink() Invalid deep link: $deepLink, error: $e');
    }
  }

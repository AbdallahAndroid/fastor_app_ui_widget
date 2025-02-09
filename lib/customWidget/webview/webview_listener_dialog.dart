import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/customWidget/page/ScaffoldApp.dart';
import 'package:fastor_app_ui_widget/customWidget/progressView/ProgressCircleApp.dart';
import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class WebviewWithListenerDialog extends StatefulWidget {
  String url;

  // Function(int progress) onProgress;
  // Function(HttpAuthRequest p0) onAuthError;
  // Function(WebResourceError e) onError;
  Function(String url) onFinished;

  WebviewWithListenerDialog(
      {required this.url,
      // required this.onProgress,
      // required this.onAuthError,
      // required this.onError,
      required this.onFinished});

  @override
  State<StatefulWidget> createState() {
    return _WebviewState();
  }
}

class _WebviewState extends State<WebviewWithListenerDialog> {
  late WebViewController _controller;

  bool isLoadingPage = true;

  @override
  void initState() {
    setupController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldApp(
        shapeTransparent: true,
        shapeTransparentColor: Colors.black.withOpacity(0.5),
        body: Stack(
          children: [
            webview(),
            if (isLoadingPage)
              Positioned(
                child: ProgressCircleApp(color:  Colors.blue, size: 50 ),
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
              )
          ],
        ));
  }

  webview() {
    return Container(
      width: DeviceTools.getWidth(context),
      height: DeviceTools.getHeightInsideSafeArea(context),
      child: Expanded(
        child: WebViewWidget(controller: _controller),
      ),
    );
    // return   WebViewWidget(
    //     controller: WebviewHelper.getWebViewController(
    //     onAuthError: onAuthError,
    //     onProgress: onProgress,
    //     onError: onError,
    //     onFinished: onFinished,
    //     ),
    // );
  }

  void setupController() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (String url) {
          Log.i('setupController()- started loading: $url');
          setState(() {
            isLoadingPage = true;
          });
        },
        onPageFinished: (String url) {
          Log.i('setupController()- finished loading: $url');
          setState(() {
            isLoadingPage = false;
          });
          widget.onFinished(url);
        },
        onUrlChange: (UrlChange? change) {
          if (change != null && change.url != null) {
            debugPrint('URL changed to: ${change.url}');
            Log.i('setupController()- URL changed to:  ${change.url}');
            setState(() {
              isLoadingPage = true;
            });
          }
        },
      ))
      ..loadRequest(Uri.parse(widget.url));
  }
}

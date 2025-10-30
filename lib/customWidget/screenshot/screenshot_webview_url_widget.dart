import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/values/ToolsValidation.dart';
import 'package:fastor_app_ui_widget/customWidget/screenshot/logic/logic_screenshoot.dart';
import 'package:flutter/material.dart';

// import 'package:screenshot/screenshot.dart';
import 'package:webview_flutter/webview_flutter.dart';

typedef PrintUrlBase64OnComplete = Function(String base64);

class ScreenshotWebviewlWidget extends StatefulWidget {
  String? invoiceUrl;
  PrintUrlBase64OnComplete onComplete;

  ScreenshotWebviewlWidget({
    required this.invoiceUrl,
    required this.onComplete,
  });

  @override
  State<StatefulWidget> createState() => ScreenshotWebViewState();
}

class ScreenshotWebViewState extends State<ScreenshotWebviewlWidget> {
  // final ScreenshotController screenshotController = ScreenshotController();
  final GlobalKey webViewKey = GlobalKey();
  WebViewController webViewController = WebViewController();
  String? base64String;
  double? captureHeight;

  /// progress
  bool isLoading = true;
  bool isCapturing = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((t) async {
      await setupController();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (ToolsValidation.isEmpty(widget.invoiceUrl)) {
      return SizedBox();
    }
    return Container(
      width: DeviceTools.isLandscape(context)
          ? 300.h
          : DeviceTools.getWidth(context),
      height: DeviceTools.getHeight(context),
      color: AppColors.white,
      // padding: EdgeInsets.all(10),
      child: webViewScreenshot(),
    );
  }

  Widget webViewScreenshot() {
    return SizedBox.expand(
        child: Stack(children: [
      if (captureHeight != null) webViewWithFixedHeightAfterCompleteLoaded(),
      if (captureHeight == null) webViewWhileLoading(),
    ]));
  }

  ///--------------------------------------------- shape webview

  webViewWithFixedHeightAfterCompleteLoaded() {
    return SingleChildScrollView(
      child: RepaintBoundary(
        key: webViewKey,
        child: Container(
          color: Colors.white,
          // Reduced padding to prevent excessive spacing at high pixelRatio
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SizedBox(
            width: double.infinity,
            height: captureHeight,
            child: WebViewWidget(
              controller: webViewController,
            ),
          ),
        ),
      ),
    );
  }

  Widget webViewWhileLoading() {
    return RepaintBoundary(
      key: webViewKey,
      child: SizedBox.expand(
        child: WebViewWidget(
          controller: webViewController,
        ),
      ),
    );
  }
}

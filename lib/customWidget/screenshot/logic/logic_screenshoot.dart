import 'dart:convert';
import 'dart:ui' as ui;

import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/core/utils/values/ToolsValidation.dart';
import 'package:fastor_app_ui_widget/customWidget/screenshot/screenshot_webview_url_widget.dart';
import 'package:flutter/rendering.dart';

import 'package:webview_flutter/webview_flutter.dart';

extension LogicScreenshoot on ScreenshotWebViewState {
  ///----------------------------------------------------- logic

  setupController() {
    if (ToolsValidation.isEmpty(widget.invoiceUrl)) return;
    Log.i(
        "screenshot - setupController()   start  invoiceUrl: ${widget.invoiceUrl}");

    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) async {
            hideProgress();

            Log.i("screenshot - setupController()   onPageFinished");
            showWebviewCaptured();
            await _takeScreenshotGenerateToBase64();
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.invoiceUrl!));

    //
  }

  Future<void> _takeScreenshotGenerateToBase64() async {
    captureHeight = await _getHeight();
    await _setDocumentWebViewHeightAuto();
    await _captureByWebViewKey();
    await _resetWebviewSizeAgainAfterCompleteGenerateBase64();
  }

  Future<double> _getHeight() async {
    // await Future.delayed(const Duration(milliseconds: 1000));

    var scrollHeightResult =
        await webViewController.runJavaScriptReturningResult(
      'document.documentElement.scrollHeight',
    );
    double r = double.tryParse(
          scrollHeightResult.toString().replaceAll('"', ''),
        ) ??
        1000.0;

    /// fix content height too height more than paper size
    r = r * 1.2;

    return r;
  }

  Future _setDocumentWebViewHeightAuto() async {
    /** --- increase font size
        document.body.style.fontSize = '12px';


        document.querySelectorAll('.total-m').forEach(el => {
        el.style.fontSize = '18px';
        el.style.fontWeight = '900';
        });

        document.querySelectorAll('.invoice').forEach(el => {
        el.style.fontSize = '18px';
        el.style.fontWeight = '900';
        });

        document.querySelectorAll('.h2').forEach(el => {
        el.style.fontSize = '18px';
        el.style.fontWeight = '900';
        });

        document.body.style.fontWeight = '900';

        const policy = document.querySelector('.return-policy');
        policy.style.fontSize = '12px';
        policy.style.fontWeight = '900';

        document.body.style.fontWeight = '900';

     */

    // Step 1: Make HTML render at full height (no internal scrolling)
    await webViewController.runJavaScript('''
        document.body.style.overflow = 'visible';
        document.body.style.height = 'auto';  
        document.documentElement.style.overflow = 'visible';
        document.documentElement.style.height = 'auto';
        
       
        const policy = document.querySelector('.return-policy');
        policy.style.fontSize = '12px';
        policy.style.fontWeight = '900';
      ''');

    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {});
  }

  Future _captureByWebViewKey() async {
    // Wait for the widget to rebuild and layout with new height
    await Future.delayed(const Duration(milliseconds: 1000));

    Log.i(
        'screenshot - _captureByWebViewKey() full widget at height: $captureHeight');

    // Get the RepaintBoundary
    final boundary =
        webViewKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;

    if (boundary == null) {
      // throw Exception('Could not find RepaintBoundary');
      Log.i(
          'screenshot - _captureByWebViewKey() Could not find RepaintBoundary - stop !');
      return;
    }

    // Capture the ENTIRE expanded widget with high resolution
    // final pixelRatio = math.min(ui.window.devicePixelRatio * 2, 4.0);
    // Log.i('_captureByWebViewKey() - pixelRatio: ${pixelRatio} ');
    final image = await boundary.toImage(pixelRatio: 10);
    Log.i(
        'screenshot - _captureByWebViewKey() - image: ${image.width}x${image.height} pixels');

    // Convert to base64
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    if (byteData == null) {
      image.dispose();
      return;
    }

    final pngBytes = byteData.buffer.asUint8List();
    base64String = base64Encode(pngBytes);
    if (base64String == null) {
      Log.i(
          'screenshot - _captureByWebViewKey()   base64String == null   - stop !');
      return;
    }

    Log.i(
        "screenshot - _captureByWebViewKey()   Base64 Screenshot: ${base64String!.length}");
    widget.onComplete(base64String!);
  }

  void showWebviewCaptured() {
    setState(() {
      isCapturing = true;
    });
  }

  void hideProgress() {
    setState(() {
      isLoading = false;
    });
  }

  _resetWebviewSizeAgainAfterCompleteGenerateBase64() async {
    // Restore HTML scrolling
    await webViewController.runJavaScript('''
        document.body.style.overflow = '';
        document.body.style.height = '';
        document.documentElement.style.overflow = '';
        document.documentElement.style.height = '';
      ''');

    // Restore normal Flutter widget height
    setState(() {
      captureHeight = null;
    });
    Log.i(
        "screenshot - _resetWebviewSizeAgainAfterCompleteGenerateBase64()    ");
  }
}

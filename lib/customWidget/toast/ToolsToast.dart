import 'package:fastor_app_ui_widget/core/lang/PositionedApp.dart';
import 'package:flutter/material.dart';

class ToolsToast{


  static bottom(BuildContext context, String  msg, {
    Color? colorBackground,
    Color? colorText,
    int? milisecond,

  }  ) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => PositionedApp.langApp(
        right: 50.0,
        left: 50.0,
        bottom: 150,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: colorBackground??Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              msg,
              style: TextStyle(color: colorText??Colors.black, fontSize: 16.0),
            ),
          ),
        ),
      ),
    );

    overlay?.insert(overlayEntry);

    // Remove the toast after a delay
    Future.delayed(Duration(milliseconds: milisecond??1500), () {
      overlayEntry.remove();
    });
  }

  static top(BuildContext context, String  msg, {
    Color? colorBackground,
    Color? colorText,
    int? milisecond,

  }  ) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => PositionedApp.langApp(
        right: 50.0,
        left: 50.0,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: colorBackground??Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              msg,
              style: TextStyle(color: colorText??Colors.black, fontSize: 16.0),
            ),
          ),
        ),
      ),
    );

    overlay?.insert(overlayEntry);

    // Remove the toast after a delay
    Future.delayed(Duration(milliseconds: milisecond??1500), () {
      overlayEntry.remove();
    });
  }


  static topRight(BuildContext context, String  msg, {
    Color? colorBackground,
    Color? colorText,
    int? milisecond,

  }  ) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => PositionedApp.langApp(
        right: 50.0, // Set the custom position here
        left: MediaQuery.of(context).size.width * 0.1,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: colorBackground??Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              msg,
              style: TextStyle(color: colorText??Colors.black, fontSize: 16.0),
            ),
          ),
        ),
      ),
    );

    overlay?.insert(overlayEntry);

    // Remove the toast after a delay
    Future.delayed(Duration(milliseconds: milisecond??1500), () {
      overlayEntry.remove();
    });
  }


  static topLeft(BuildContext context, String  msg, {
    Color? colorBackground,
    Color? colorText,
    int? milisecond,

  }  ) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => PositionedApp.langApp(
        top: 50.0, // Set the custom position here
        left: MediaQuery.of(context).size.width * 0.1,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: colorBackground??Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              msg,
              style: TextStyle(color: colorText??Colors.black, fontSize: 16.0),
            ),
          ),
        ),
      ),
    );

    overlay?.insert(overlayEntry);

    // Remove the toast after a delay
    Future.delayed(Duration(milliseconds: milisecond??1500), () {
      overlayEntry.remove();
    });
  }


}
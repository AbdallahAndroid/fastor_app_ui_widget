import 'package:fastor_app_ui_widget/core/lang/PositionedApp.dart';
import 'package:flutter/material.dart';

/// declare "rootScaffoldMessengerKey" at MaterialApp()
/// MaterialApp(
///              scaffoldMessengerKey: rootScaffoldMessengerKey,
final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();


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


  //------------------------------------------------------------- snake bar



  static snackBar(
      BuildContext context, {
        required String message,
        bool isMessageError = false,
      }) {
    rootScaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
      padding: EdgeInsets.only(right: 15.0, left: 15.0 , top: 15.0 ,bottom: 10.0 ),
      content: Row(
        children: [
          isMessageError
              ? CircleAvatar(
            backgroundColor: Colors.red.withOpacity(0.5),
            radius: 12,
            child: Icon(
              Icons.close,
              color: Colors.white,
              size: 14,
            ),
          )
              : Image.asset( "assets/images/logo.png",
            width: 20.0 ,
            height: 20.0,
            fit: BoxFit.fill,
          ),
          SizedBox( width: 10 ),
          Expanded(
            child: Text(
              message,
              maxLines: 2,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 12 ),
            ),
          ),
          // const Spacer(),
          InkWell(
            onTap: (){
              rootScaffoldMessengerKey.currentState?.hideCurrentSnackBar();
            },
            child: Text(
              'Dismiss'.trim(),
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  fontSize: 12),
            ),
          ),
        ],
      ),
      duration: const Duration(seconds: 4),
      backgroundColor: isMessageError ? Colors.red : Colors.green,
    ));
  }


}
import 'package:fastor_app_ui_widget/customWidget/page/ScaffoldApp.dart';
import 'package:flutter/material.dart';


class UnderDevelopmentNavigationScreen extends StatefulWidget {

  String title;

  UnderDevelopmentNavigationScreen( this.title);

  @override
  UnderDevelopmentNavigationState createState()  => UnderDevelopmentNavigationState();


}

class UnderDevelopmentNavigationState extends State<UnderDevelopmentNavigationScreen> {

  @override
  Widget build(BuildContext context) {
    return ScaffoldApp(body: Container(
      margin: EdgeInsets.all(40),
      alignment: Alignment.center,
      child: Text(widget.title),
    ));
  }

}
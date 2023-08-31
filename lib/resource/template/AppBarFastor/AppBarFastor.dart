import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:fastor_app_ui_widget/resource/resources/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/resource/resources/boarder/BorderRadiusTools.dart';
import 'package:fastor_app_ui_widget/resource/resources/ds/DesignSystemColor.dart';
import 'package:fastor_app_ui_widget/resource/resources/ds/DesignSystemDimen.dart';
import 'package:fastor_app_ui_widget/resource/resources/ds/LevelDS.dart';
import 'package:flutter/material.dart';

@Deprecated( "Under Development")
class AppBarFastor extends StatelessWidget {

  String title;


  BorderRadius? radiusBorder;
  double height;
  Color? colorBackground;
  Color? colorLine;


  AppBarFastor( {
    required this.title,
    required this.height,
    BorderRadius? this.radiusBorder,

    Color? this.colorBackground,
    Color? this.colorLine,
  });


  BuildContext? _context;

  @override
  Widget build(BuildContext context) {
    this._context = context;

    DSDimen.toolbar_height = height; //set now

    return getAppBar();
  }

  Widget getAppBar() {
    return  Container(
      width: DeviceTools.getWidth(_context!),
      height: height ,
      decoration: BoarderHelper.rounded(
          colorBackground: colorBackground??DSColor.ds_background_toolbar,
          colorLine: colorLine??DSColor.ds_background_toolbar,

          //radius
          radiusBorder: radiusBorder??_defaultBoarder()

      ),

      alignment: Alignment.center,

      child: TextFastor(  title,
        levelDS: LevelDS.parent ,
        color: DSColor.toolbar_title,
      ),
    );
  }


  double getHeight() {
    return height;
  }

  BorderRadius _defaultBoarder() {
    return BorderRadiusTools.get(
        radius_bottomLeft : DSDimen.toolbar_corner,
        radius_bottomRight: DSDimen.toolbar_corner
    );
  }

}
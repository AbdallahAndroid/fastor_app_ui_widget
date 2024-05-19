
import 'package:fastor_app_ui_widget/core/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/resource/template/stack/StackTemplate.dart';
import 'package:fastor_app_ui_widget/resource/uiFastor/responsive_views/helper/ResponsiveFastor.dart';
import 'package:flutter/cupertino.dart';


 /// Responsive to landscape
class ForumPortraitToLandscapeResponsiveFastor     extends StatelessWidget {

  Color colorBackground;
  Widget body ;

  ForumPortraitToLandscapeResponsiveFastor( { required this.body , required this.colorBackground});

  @override
  Widget build(BuildContext context) {
    return wrapHeight(context, body, colorBackground);
  }

  //------------------------------------------------------------------ wrap height

  static Widget wrapHeight(BuildContext context, Widget content, Color colorBackground ) {
    //check default mobile
    if( DeviceTools.isPortrait( context) ) {
      return content;
    }

    //stack
    var stack =  StackTemplate.AlignParentPage( context: context,
        alignCenterTop: _cardViewWrap( context, content, colorBackground )
    );

    //margin to parent
    return Container(child: stack,
        margin: EdgeInsets.all(20)
    );
  }

  static Widget _cardViewWrap(BuildContext context, Widget content, Color colorBackground ) {

    //card
    return Container( child:  content,
      width: ResponsiveFastor.getDeviceWidthPortraitNormalWhileLandscapeCenter( context),
      decoration: BoarderHelper.cardViewShadow(
        colorBackground:  colorBackground,
        colorLine: colorBackground,

      )  ,
    );
  }


}

/**

    //------------------------------------------------------------------ fixed height

    static Widget fixedHeight(BuildContext context, Widget content, double height ) {
    //check default mobile
    if( DeviceTools.isPortrait( context ) ) {
    return content;
    }

    var stack =  StackTemplate.AlignParentPage( context: context,
    alignCenterTop: _cardviewFixedHeight( context, content,  height)
    );

    //margin to parent
    return Container(child: stack,
    margin: EdgeInsets.all(DSDimen.space_parent)
    );
    }


    static Widget _cardviewFixedHeight( BuildContext context, Widget child, double height){

    return CardViewTemplate.t(
    child:   child  ,
    width: PortraitToLandscapeUtilsResponsiveFastor.getDeviceWidthPortraitNormalWhileLandscapeCenter( context),
    height: height,
    radius_all: DSDimen.ds_size_corner_level_2,
    elevationValue: DSDimen.elevation_level_2,
    );
    }
 */
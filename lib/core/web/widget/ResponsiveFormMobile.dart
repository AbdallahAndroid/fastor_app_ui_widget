



import 'package:fastor_app_ui_widget/core/resource/ColorResource.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/customWidget/cardview/CardViewApp.dart';
import 'package:fastor_app_ui_widget/customWidget/emptyView/EmptyView.dart';
import 'package:fastor_app_ui_widget/core/web/ResponsiveConstant.dart';
import 'package:fastor_app_ui_widget/core/web/widget/ResponsiveLandscapeCenterTopBody.dart';
import 'package:flutter/material.dart';

/**
 * ResponsiveFormMobile used for toolsUI mobile to be good shape in website
 */

class ResponsiveFourmMobile  {

  //------------------------------------------------------------------ wrap height

  static Widget wrapHeight(BuildContext context, Widget content ) {
    /**
     *    //check default mobile
        if( DeviceTools.isPortrait( context) ) {
        return content;
        }

        //stack
        // var stack =  StackTemplate.AlignParentPage( context: context,
        //     alignCenterTop: _cardViewWrap( context, content )
        // );
        var stack = Stack(
        children: [

        EmptyView.allDeviceScreen(context),
        Positioned(child:  _cardViewWrap(context, content), left: 0, right: 0, top:  0,)
        ],
        );


        //margin to parent
        return Container(child: stack,
        margin: EdgeInsets.all(DSDimen.space_parent)
        );
     */
    return ResponsiveLandscapeCenterTopBody(body:  content );
  }

  static Widget _cardViewWrap(BuildContext context, Widget content ) {

    //card
    return Container( child:  content,
      width: ResponsiveConstant.widthMobileNormal,
      decoration: BoarderHelper.cardViewShadow(
        colorBackground: AppColor.backgroundAllScreens,
      )  ,
    );
  }

  //------------------------------------------------------------------ fixed height

  static Widget fixedHeight(BuildContext context, Widget content, double height ) {
    //check default mobile
    if( DeviceTools.isPortrait( context ) ) {
      return content;
    }

    // var stack =  StackTemplate.AlignParentPage( context: context,
    //     alignCenterTop: _cardviewFixedHeight( context, content,  height)
    // );
    var stack = Stack(
      children: [

        EmptyView.allDeviceScreen(context),
        Positioned(child:  _cardviewFixedHeight(context, content, height), left: 0, right: 0, top:  0,)
      ],
    );

    //margin to parent
    return Container(child: stack,
    margin: EdgeInsets.all(30)
    );
  }


  static Widget _cardviewFixedHeight( BuildContext context, Widget child, double height){

    return CardViewApp.t(
      child:   child  ,
      width: ResponsiveConstant.widthMobileNormal,
      height: height,
      radius_all: 15,
      elevationValue: 6,
    );
  }

}
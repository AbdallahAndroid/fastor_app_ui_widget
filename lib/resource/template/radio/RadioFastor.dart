// import 'package:flutter/material.dart';
//
// 
// 
// import 'package:fastor_app_ui_widget/resource/template/EdgeInsets/EdgeInsetsTools.dart';
// import 'package:fastor_app_ui_widget/resource/template/emptyView/EmptyView.dart';
// import 'package:fastor_app_ui_widget/resource/template/row/RowTemplate.dart';
// import 'package:fastor_app_ui_widget/resource/template/text/TextTemplate.dart';
//
// class RadioFastor extends StatelessWidget {
//
//   String radioSpecialValue ;
//   String groupValue;
//   ValueChanged<String> onChange;
//
//   //test
//   Widget? textWidget ;
//   String? text = "";
//
//   //size
//   double? sizeScale = 1.0;
//
//   //space
//   EdgeInsets? margin;
//   EdgeInsets? padding;
//   bool? removePaddingClick = true;
//
//   //
//   Decoration? decoration;
//   Color? colorBackground;
//
//
//   RadioFastor(
//
//   {
//     //required BuildContext context,
//
//     //radio action
//     required this.radioSpecialValue ,
//     required this.groupValue,
//     required this.onChange,
//
//     //test
//      this.textWidget ,
//     this.text = "",
//
//     //size
//     this.sizeScale = 1.0,
//
//     //space
//     this.margin,
//     this.padding,
//     this.removePaddingClick = true,
//
//     // background
//     this.decoration,
//     this.colorBackground,
//   }
//       ){
//
//     this.removePaddingClick ??= true;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     // text used in second pirority
//     if( textWidget == null ) {
//       textWidget = TextTemplate.t( text, levelDS: LevelDS.l3);
//     }
//
//     //radio
//     var rd  = Radio<String>(value: radioSpecialValue , groupValue: groupValue,
//         onChanged:  (s){ onChange(radioSpecialValue);   }
//     );
//
//     //theme
//     var theme = Theme(
//       data: Theme.of( context).copyWith(
//           unselectedWidgetColor: DSColor.tap_inactive,       //inactive color
//          // toggleableActiveColor: DSColor.tap_active      //active color
//       ),
//       child: rd ,
//     );
//
//     // default padding size
//     final double defaultPaddingSizeClick = 20;
//
//     /**
//      * - why 40?
//      *    because the default padding is 40
//      */
//     double paddingCheckBoxClick = 40;
//     if ( removePaddingClick! ) {
//       paddingCheckBoxClick = defaultPaddingSizeClick;
//     }
//
//     //fix : remove default
//     var sizeBox = SizedBox( child:  theme, width: paddingCheckBoxClick, height: paddingCheckBoxClick   );
//
//     //fix material
//     var material = Material(child:  sizeBox    );
//
//     //size by scale
//     var scale = Transform.scale(scale: sizeScale!, child:  material );
//
//     //space between title
//     var spaceBetweenTitle = EmptyView.empty(  5,  5);
//
//     //row
//     var row = RowTemplate.wrapChildren( [ scale, spaceBetweenTitle, textWidget! ]);
//
//     //case: have custome padding
//     //fix default padding at the container when there is padding for click
//     if(removePaddingClick == false ){
//       padding = EdgeInsetsTools.fixDefaultSpace( padding, defaultPaddingSizeClick);
//     }
//
//     // space
//     var ct = Container(
//         color:  colorBackground,
//         decoration: decoration,
//         margin: margin ,
//         padding: padding,
//         child:  row );
//
//     //tab on
//     var tab = GestureDetector( child:  ct , onTap: () =>  onChange(radioSpecialValue)   );
//     return tab;
//     return row;
//   }
//
//
// }
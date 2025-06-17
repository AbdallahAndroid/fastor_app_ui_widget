import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/values/ToolsPrice.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';


/**
 ----------- example

    TextPrice( product.price,
    textStyle: AppTextStyles.font14Primary500,
    sizeIcon: 9.wr ,
    spaceBetweenIconAndPrice : 9.wr,
    )

 */
class TextPriceWithIcon extends StatelessWidget {

  double? price;
  double sizeIcon;
  TextStyle textStyle;
  Color? iconColor;
  double? spaceBetweenIconAndPrice;
  double? marginTopIcon;

  TextPriceWithIcon(  this.price, {
    required this.sizeIcon,
    required this.textStyle,
    this.iconColor,
    this.marginTopIcon,
    this.spaceBetweenIconAndPrice
});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        TextApp( ToolsPrice.priceWithoutCurrency( price ) ,  color: textStyle.color, fontSize: textStyle.fontSize??16 ,),
        SizedBox(
          width: spaceBetweenIconAndPrice??9.wr,
        ),
        Container(
          margin:  EdgeInsets.only(top: marginTopIcon??0),
          // child: Image.asset( AppIcons.rial_new, width: sizeIcon , height: sizeIcon , color: iconColor,),
        )

      ],
    );
  }


}
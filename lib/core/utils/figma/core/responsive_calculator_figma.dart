
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/core/portrait_phone_size.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/core/tablet_phone_size.dart';
import 'package:fastor_app_ui_widget/core/utils/globa/GlobalApp.dart';

extension ResponsiveCalculatorFigma on Figma {

  ///------------------------------------------------------------------ width/ height

  static double responsiveWidth(double figmaSize)  {
    ///case box
    if( isSemiBoxShape && GlobalApp.getContexts() != null  ) {
      return  figmaSize.hTabletInputField;
    }

    /// case   tablet
      if( isTablet && GlobalApp.getContexts() != null  ) {
      return figmaSize.wTabletInputField;
      }

      /// case phone
      return  PortraitPhoneSize.widthPortrait(figmaSize);
  }


  static double responsiveHeight(double figmaSize ) {
    ///case box
    if( isSemiBoxShape && GlobalApp.getContexts() != null  ) {
      return figmaSize.hTabletInputField;
    }

    /// case   tablet
    if( isTablet && GlobalApp.getContexts() != null  ) {
      return figmaSize.hTabletInputField;
    }

    /// case phone
    return  PortraitPhoneSize.heightPortrait(figmaSize);
  }

  ///------------------------------------------------------------------ text

  static double responsiveSp(double figmaSize)  {
    ///case box
    if( isSemiBoxShape && GlobalApp.getContexts() != null  ) {
      return figmaSize.spTablet;
    }

    /// case   tablet
    if( isTablet && GlobalApp.getContexts() != null  ) {
      return figmaSize.spTablet;
    }

    /// case phone
    return  figmaSize.spPortrait;
  }

}
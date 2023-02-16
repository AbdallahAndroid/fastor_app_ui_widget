
import 'package:flutter/material.dart';

import 'LanguageTools.dart';

class DirectionLanguage {


  /**
   * in logical: not need to make bottom at top of screen
   */
  static bool SingleChildScrollView_reverseStatus_vertical(BuildContext context) {
    return false;
  }

  /**
   * in arabic: i need to show data in reverse data to view,
   * because the row default is english direction
   */
  static bool SingleChildScrollView_reverseStatus_horizontal(BuildContext context) {
    return LanguageTools.isArabic( context );
  }


  static List<Widget> row_nestedScrollHorizontal_arrayWidget(BuildContext context,
      List<Widget> originalList) {
    //choose lang
    if( LanguageTools.isArabic( context ) ) {
      return new List.from(originalList.reversed);
    } else {
      return originalList;
    }
  }
}

import 'package:fastor_app_ui_widget/customWidget/navigation_bottom/NavigationBottomMainScreen.dart';
import 'package:fastor_app_ui_widget/customWidget/navigation_bottom/constant/EnumNavigationBottomScreen.dart';

extension NavigationBottomController on NavigationBottomMainState {

  setIndexSelectedByEnumNavigationBottomScreenValue(){
    if( widget.enumNavigationBottomScreen == EnumNavigationBottomScreen.page1 ) {
      selectedIndexNavigation = 0;
    } else if (  widget.enumNavigationBottomScreen == EnumNavigationBottomScreen.page2 ) {
      selectedIndexNavigation = 1;
    }  else if (  widget.enumNavigationBottomScreen == EnumNavigationBottomScreen.page3 ) {
      selectedIndexNavigation = 2;
    } else if (  widget.enumNavigationBottomScreen == EnumNavigationBottomScreen.page4 ) {
      selectedIndexNavigation = 3;
    } else if (  widget.enumNavigationBottomScreen == EnumNavigationBottomScreen.page5 ) {
      selectedIndexNavigation = 4;
    }
  }


  setTypePageMainOrSub(){
    if( widget.subPage != null ) {
      isTypeMainPage = false;
    }
  }

  setTypePageIsMainForEverWhenUserClickOneOfMainButtonWhileUserAtOneOfSubPage(){
    isTypeMainPage = true;
  }


}
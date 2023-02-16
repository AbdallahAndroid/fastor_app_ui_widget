library fastor_app_ui_widget;

//------------------------------------------------------------------------------ import


import 'package:fastor_app_ui_widget/resource/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/resource/ds/DesignSystemColor.dart';
import 'package:fastor_app_ui_widget/resource/ds/DesignSystemDimen.dart';
// import 'package:fastor_app_ui_widget/resource/color/ResourceColor.dart';
import 'package:fastor_app_ui_widget/resource/ds/DesignSystemFont.dart';
import 'package:fastor_app_ui_widget/resource/template/EdgeInsets/EdgeInsetsTools.dart';
import 'package:fastor_app_ui_widget/resource/template/button/ButtonFastor.dart';
export 'package:fastor_app_ui_widget/resource/template/button/ButtonFastor.dart';
import 'package:fastor_app_ui_widget/resource/template/button/ButtonTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/calendar/CalendarTemplate.dart';
export 'package:fastor_app_ui_widget/resource/template/calendar/CalendarTemplate.dart';

import 'package:fastor_app_ui_widget/resource/template/cardview/fixedSize/CardViewTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/checkbox/CheckboxTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/click/GestureDetectorTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/column/ColumnTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/container/ContainerTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/crop/CropTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/elevation/ElevationTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/emptyView/EmptyView.dart';
import 'package:fastor_app_ui_widget/resource/template/image/ImageFastor.dart';
export 'package:fastor_app_ui_widget/resource/template/image/ImageFastor.dart';
import 'package:fastor_app_ui_widget/resource/template/image/ImageView.dart';
import 'package:fastor_app_ui_widget/resource/template/image/ImageViewTemplate.dart';
export 'package:fastor_app_ui_widget/resource/template/image/ImageViewTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/listview/ListViewTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/listview/gridview/GridViewFastor.dart';
export 'package:fastor_app_ui_widget/resource/template/listview/gridview/GridViewFastor.dart';
import 'package:fastor_app_ui_widget/resource/template/page/PageFastor.dart';
export 'package:fastor_app_ui_widget/resource/template/page/PageFastor.dart';
import 'package:fastor_app_ui_widget/resource/template/page/PageTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/placeholder/PlaceholderTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/progressView/ProgressPage.dart';
import 'package:fastor_app_ui_widget/resource/template/progressView/ProgressSpinkit.dart';

import 'package:fastor_app_ui_widget/resource/template/radio/RadioTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/row/RowTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/scrollview/ScrollViewPage.dart';
import 'package:fastor_app_ui_widget/resource/template/select/template/SpinnerTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/select/view/SpinnerView.dart';

import 'package:fastor_app_ui_widget/resource/template/stack/StackTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/switch/SwitchTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/table/TableView.dart';
import 'package:fastor_app_ui_widget/resource/template/text/TextFastor.dart';
export 'package:fastor_app_ui_widget/resource/template/text/TextFastor.dart';
import 'package:fastor_app_ui_widget/resource/template/text/TextTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/textfield/TextFieldTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/textfield/validator/ValidatorTemplate.dart';
import 'package:fastor_app_ui_widget/resource/toolsFastor/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/resource/toolsFastor/device/deviceChangeSize/ListenerChangeDeviceSize.dart';
import 'package:fastor_app_ui_widget/resource/toolsFastor/log/Log.dart';
export  'package:fastor_app_ui_widget/resource/toolsFastor/log/Log.dart';

import 'package:fastor_app_ui_widget/resource/toolsFastor/values/ToolsValidation.dart';
import 'package:fastor_app_ui_widget/resource/toolsFastor/values/UniqueIdTools.dart';
import 'package:fastor_app_ui_widget/resource/uiFastor/language/LanguageTools.dart';
import 'package:fastor_app_ui_widget/resource/uiFastor/statusBar/StatusBarConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';


import 'resource/boarder/BorderRadiusTools.dart';
export 'resource/boarder/BorderRadiusTools.dart';
import 'resource/state/FastorStateManagement.dart';
export 'resource/state/FastorStateManagement.dart';


import 'resource/template/image/ImageCircleView.dart';
import 'package:fastor_app_ui_widget/resource/template/scrollview/ScrollSpeed.dart';

export 'package:fastor_app_ui_widget/resource/template/scrollview/ScrollSpeed.dart';

//------------------------------------------------------------------------------ export

export 'package:fastor_app_ui_widget/resource/boarder/BoarderHelper.dart';
export 'package:fastor_app_ui_widget/resource/ds/DesignSystemColor.dart';
// export 'package:fastor_app_ui_widget/resource/color/ResourceColor.dart';
export 'package:fastor_app_ui_widget/resource/ds/DesignSystemDimen.dart';
export 'package:fastor_app_ui_widget/resource/ds/DesignSystemFont.dart';
export 'package:fastor_app_ui_widget/resource/template/EdgeInsets/EdgeInsetsTools.dart';
export 'package:fastor_app_ui_widget/resource/template/button/ButtonTemplate.dart';
export 'package:fastor_app_ui_widget/resource/template/cardview/fixedSize/CardViewTemplate.dart';
export 'package:fastor_app_ui_widget/resource/template/checkbox/CheckboxTemplate.dart';
export 'package:fastor_app_ui_widget/resource/template/click/GestureDetectorTemplate.dart';
export 'package:fastor_app_ui_widget/resource/template/column/ColumnTemplate.dart';
export 'package:fastor_app_ui_widget/resource/template/container/ContainerTemplate.dart';
export 'package:fastor_app_ui_widget/resource/template/elevation/ElevationTemplate.dart';
export 'package:fastor_app_ui_widget/resource/template/emptyView/EmptyView.dart';
export 'package:fastor_app_ui_widget/resource/template/image/ImageView.dart';
export 'package:fastor_app_ui_widget/resource/template/listview/ListViewTemplate.dart';
export 'package:fastor_app_ui_widget/resource/template/page/PageTemplate.dart';
export 'package:fastor_app_ui_widget/resource/template/placeholder/PlaceholderTemplate.dart';
export 'package:fastor_app_ui_widget/resource/template/progressView/ProgressPage.dart';
export 'package:fastor_app_ui_widget/resource/template/radio/RadioTemplate.dart';
export 'package:fastor_app_ui_widget/resource/template/row/RowTemplate.dart';
export 'package:fastor_app_ui_widget/resource/template/scrollview/ScrollViewPage.dart';

export 'package:fastor_app_ui_widget/resource/template/stack/StackTemplate.dart';
export 'package:fastor_app_ui_widget/resource/template/switch/SwitchTemplate.dart';
export 'package:fastor_app_ui_widget/resource/template/table/TableView.dart';
export 'package:fastor_app_ui_widget/resource/template/text/TextTemplate.dart';
export 'package:fastor_app_ui_widget/resource/template/textfield/TextFieldTemplate.dart';
export 'package:fastor_app_ui_widget/resource/toolsFastor/device/DeviceTools.dart';
export 'package:fastor_app_ui_widget/resource/toolsFastor/values/ToolsValidation.dart';
export 'package:fastor_app_ui_widget/resource/toolsFastor/values/UniqueIdTools.dart';
export 'package:fastor_app_ui_widget/resource/uiFastor/language/LanguageTools.dart';
export 'package:fastor_app_ui_widget/resource/uiFastor/statusBar/StatusBarConstant.dart';
export 'package:hexcolor/hexcolor.dart';

export 'package:fastor_app_ui_widget/resource/ds/LevelDS.dart';
export 'package:fastor_app_ui_widget/resource/template/crop/CropTemplate.dart';
export 'package:fastor_app_ui_widget/resource/template/textfield/validator/ValidatorTemplate.dart';
export 'package:fastor_app_ui_widget/resource/toolsFastor/device/deviceChangeSize/ListenerChangeDeviceSize.dart';
export  'package:fastor_app_ui_widget/resource/template/progressView/ProgressSpinkit.dart';
export 'resource/template/image/ImageCircleView.dart';

export 'package:fastor_app_ui_widget/resource/template/select/template/SpinnerTemplate.dart';
export 'package:fastor_app_ui_widget/resource/template/select/view/SpinnerView.dart';

// export 'package:fastor_app_ui_widget/resource/template/select/view/SpinnerView.dart';

//-------------------------------------------------------- both export and improt
import 'package:fastor_app_ui_widget/resource/uiFastor/scroll/FastorScrollTheme.dart';
export 'package:fastor_app_ui_widget/resource/uiFastor/scroll/FastorScrollTheme.dart';
import 'package:fastor_app_ui_widget/resource/uiFastor/iphoneNotchBar/NotchBarConstant.dart';
export 'package:fastor_app_ui_widget/resource/uiFastor/iphoneNotchBar/NotchBarConstant.dart';


import  'package:fastor_app_ui_widget/resource/template/material_app/FastorMaterialApp.dart';
export  'package:fastor_app_ui_widget/resource/template/material_app/FastorMaterialApp.dart';

import  'package:fastor_app_ui_widget/resource/template/AppBarFastor/AppBarFastor.dart';
export  'package:fastor_app_ui_widget/resource/template/AppBarFastor/AppBarFastor.dart';


///fastor_app_ui_widget app all class
class fastor_app_ui_widget extends fastor {

  ///widget
  late ButtonTemplate b;
  late CardViewTemplate card;
  late CheckboxTemplate ch;
  late GestureDetectorTemplate gs;
  late ColumnTemplate col;
  late ContainerTemplate cont;
  late EdgeInsetsTools edge ;
  late ElevationTemplate elv;
  late EmptyView em;
  late ImageView im;
  late ImageViewTemplate imTemplate;
  late ImageCircleView imCircle;
  late ListViewTemplate ls;
  late GridViewFastor gridlist;
  late PageTemplate page;
  late ScrollSpeed scrollSpeed;
  late ScrollViewPage scroll;
  late PlaceholderTemplate pls;
  late ProgressCircle prg;
  late ProgressSpinkit prgSpin;
  late ProgressCircleState prgState;
  late RadioTemplate rd;
  late RowTemplate rw;
  late SpinnerTemplate sp;
  late SpinnerTemplateState spSate;
  late SpinnerView spView;
  late SpinnerViewState spStateView;
  late StackTemplate st;
  late SwitchTemplate sw;
  late TableView tb;
  late TableState tbState;
  late CalendarTemplate calendar;
  late TextFastor textFastor;
  late ButtonFastor buttonFastor;
  late PageFastor pageFastor;
  late ImageFastor imageFastor;
  late FastorMaterialApp materialApp;
  late AppBarFastor appBar;

  ///text field
  late TextTemplate tx;
  late TextFieldTemplate tf;
  late ValidatorTemplate validatorTemplate;

  ///resources
  late DSDimen dimen;
  late DSColor color;
  late DSFont font;
  late BoarderHelper boarder;
  late BorderRadiusTools borderRadiusTools;
  late HexColor hexColor;

  ///tools util
  late DeviceTools deviceTools;
  late ToolsValidation toolsValidation;
  late UniqueIdTools uniqueIdTools;
  late LanguageTools language;
  late Log myLog;

  ///tools ui
  late StatusBarConstant statusBar;
  late ListenerChangeDeviceSize listenerChangeDeviceSize;
  late CropTemplate cropTemplate;
  late FastorScrollTheme scrollTheme;

  ///state managmetn
  late FastorStateManagement stateManagement;

  //constant
late NotchBarConstant notch;
}

///fastor app all class
class fastor extends StatefulWidget{


  @override
  _fastorState createState() {
    return  _fastorState();
  }
}

class _fastorState extends State<fastor > {

  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context =context;
    setArabic();

    return TextTemplate.t( "" );
  }

  ///language : set language
  void setArabic(){
    LanguageTools.setArabic( context );
  }

}


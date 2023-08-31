library fastor_app_ui_widget;

//------------------------------------------------------------------------------ import


import 'package:fastor_app_ui_widget/resource/resources/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/resource/resources/ds/DesignSystemColor.dart';
import 'package:fastor_app_ui_widget/resource/resources/ds/DesignSystemDimen.dart';
// import 'package:fastor_app_ui_widget/resource/color/ResourceColor.dart';
import 'package:fastor_app_ui_widget/resource/resources/ds/DesignSystemFont.dart';
import 'package:fastor_app_ui_widget/resource/template/EdgeInsets/EdgeInsetsTools.dart';
import 'package:fastor_app_ui_widget/resource/template/button/ButtonFastor.dart';
export 'package:fastor_app_ui_widget/resource/template/button/ButtonFastor.dart';
import 'package:fastor_app_ui_widget/resource/template/button/ButtonTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/calendar/CalendarTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/calendar/offical_sdk/CalenderFastor.dart' ;
export 'package:fastor_app_ui_widget/resource/template/calendar/offical_sdk/CalenderFastor.dart' ;
export 'package:fastor_app_ui_widget/resource/template/calendar/CalendarTemplate.dart';

import 'package:fastor_app_ui_widget/resource/template/cardview/fixedSize/CardViewTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/checkbox/CheckboxTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/click/GestureDetectorTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/column/ColumnTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/container/ContainerTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/crop/CropTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/date/textfield/DateTextFieldFastor.dart';
export 'package:fastor_app_ui_widget/resource/template/date/textfield/DateTextFieldFastor.dart';

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
import 'package:fastor_app_ui_widget/resource/template/progressView/ProgressCircle.dart';
import 'package:fastor_app_ui_widget/resource/template/progressView/ProgressSpinkit.dart';

import 'package:fastor_app_ui_widget/resource/template/radio/RadioTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/row/RowTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/scrollview/ScrollViewPage.dart';
import 'package:fastor_app_ui_widget/resource/template/select/fastor/DropdownFastor.dart';
export 'package:fastor_app_ui_widget/resource/template/select/fastor/DropdownFastor.dart';

import 'package:fastor_app_ui_widget/resource/template/select/template/SpinnerTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/select/view/SpinnerView.dart';

import 'package:fastor_app_ui_widget/resource/template/stack/StackTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/switch/SwitchTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/table/TableView.dart';
import 'package:fastor_app_ui_widget/resource/template/text/TextFastor.dart';
export 'package:fastor_app_ui_widget/resource/template/text/TextFastor.dart';
import 'package:fastor_app_ui_widget/resource/template/text/TextTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/textfield/mobile/MobileCountryFastor.dart';
import 'package:fastor_app_ui_widget/resource/template/textfield/otp/OTPTextFieldFastor.dart';
export 'package:fastor_app_ui_widget/resource/template/textfield/otp/OTPTextFieldFastor.dart';

export 'package:fastor_app_ui_widget/resource/template/textfield/mobile/MobileCountryFastor.dart';


// export 'package:fastor_app_ui_widget/resource/template/textfield/stateless/TextFieldBackendErrorFastor.dart';
import 'package:fastor_app_ui_widget/resource/template/textfield/template/TextFieldTemplate.dart';

import 'package:fastor_app_ui_widget/resource/template/textfield/validator/ValidatorTemplate.dart';
import 'package:fastor_app_ui_widget/resource/toolsFastor/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/resource/toolsFastor/device/deviceChangeSize/ListenerChangeDeviceSize.dart';
import 'package:fastor_app_ui_widget/resource/toolsFastor/log/Log.dart';
import 'package:fastor_app_ui_widget/resource/toolsFastor/network/internet/InternetTools.dart';
import 'package:fastor_app_ui_widget/resource/toolsFastor/network/parse/ToolsAPI.dart';
import 'package:fastor_app_ui_widget/resource/toolsFastor/timer/ToolsWait.dart';
import 'package:fastor_app_ui_widget/resource/toolsFastor/values/ToolsPhone.dart';
export 'package:fastor_app_ui_widget/resource/toolsFastor/values/ToolsPhone.dart';

export 'package:fastor_app_ui_widget/resource/toolsFastor/timer/ToolsWait.dart';
export 'package:fastor_app_ui_widget/resource/toolsFastor/network/internet/InternetTools.dart';
export 'package:fastor_app_ui_widget/resource/toolsFastor/network/parse/ToolsAPI.dart';

export  'package:fastor_app_ui_widget/resource/toolsFastor/log/Log.dart';

import 'package:fastor_app_ui_widget/resource/toolsFastor/values/ToolsValidation.dart';
import 'package:fastor_app_ui_widget/resource/toolsFastor/values/UniqueIdTools.dart';
import 'package:fastor_app_ui_widget/resource/toolsFastor/zone/ZoneTools.dart';
export 'package:fastor_app_ui_widget/resource/toolsFastor/zone/ZoneTools.dart';


import 'package:fastor_app_ui_widget/resource/uiFastor/statusBar/StatusBarConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:fastor_app_ui_widget/resource/toolsFastor/network/dio/NetworkConfigDio.dart';
export 'package:fastor_app_ui_widget/resource/toolsFastor/network/dio/NetworkConfigDio.dart';

import 'package:fastor_app_ui_widget/resource/template/textfield/stateless/TextFieldFastor.dart';
export 'package:fastor_app_ui_widget/resource/template/textfield/stateless/TextFieldFastor.dart';

import 'resource/resources/boarder/BorderRadiusTools.dart';
export 'resource/resources/boarder/BorderRadiusTools.dart';
import 'resource/toolsFastor/state/FastorStateManagement.dart';
export 'resource/toolsFastor/state/FastorStateManagement.dart';


import 'resource/template/chart/multiline/ChartMultiLineFastor.dart';
export 'resource/template/chart/multiline/ChartMultiLineFastor.dart';

import 'resource/template/checkbox/CheckboxFastor.dart';
export 'resource/template/checkbox/CheckboxFastor.dart';
import 'resource/template/column/ColumnFastor.dart';
export 'resource/template/column/ColumnFastor.dart';

import 'resource/template/date/range/DateRangePickerResult.dart';
export 'resource/template/date/range/DateRangePickerResult.dart';

import 'resource/template/date/range/DateRangeTextFieldFastor.dart';
export 'resource/template/date/range/DateRangeTextFieldFastor.dart';
import 'resource/template/image/ImageCircleView.dart';
import 'package:fastor_app_ui_widget/resource/template/scrollview/ScrollSpeed.dart';

export 'package:fastor_app_ui_widget/resource/template/scrollview/ScrollSpeed.dart';

//------------------------------------------------------------------------------ export

export 'package:fastor_app_ui_widget/resource/resources/boarder/BoarderHelper.dart';
export 'package:fastor_app_ui_widget/resource/resources/ds/DesignSystemColor.dart';
// export 'package:fastor_app_ui_widget/resource/color/ResourceColor.dart';
export 'package:fastor_app_ui_widget/resource/resources/ds/DesignSystemDimen.dart';
export 'package:fastor_app_ui_widget/resource/resources/ds/DesignSystemFont.dart';
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
export 'package:fastor_app_ui_widget/resource/template/progressView/ProgressCircle.dart';
export 'package:fastor_app_ui_widget/resource/template/radio/RadioTemplate.dart';
export 'package:fastor_app_ui_widget/resource/template/row/RowTemplate.dart';
export 'package:fastor_app_ui_widget/resource/template/scrollview/ScrollViewPage.dart';

export 'package:fastor_app_ui_widget/resource/template/stack/StackTemplate.dart';
export 'package:fastor_app_ui_widget/resource/template/switch/SwitchTemplate.dart';
export 'package:fastor_app_ui_widget/resource/template/table/TableView.dart';
export 'package:fastor_app_ui_widget/resource/template/text/TextTemplate.dart';
export 'package:fastor_app_ui_widget/resource/template/textfield/template/TextFieldTemplate.dart';
export 'package:fastor_app_ui_widget/resource/toolsFastor/device/DeviceTools.dart';
export 'package:fastor_app_ui_widget/resource/toolsFastor/values/ToolsValidation.dart';
export 'package:fastor_app_ui_widget/resource/toolsFastor/values/UniqueIdTools.dart';
import 'package:fastor_app_ui_widget/resource/uiFastor/language/LanguageTools.dart';
export 'package:fastor_app_ui_widget/resource/uiFastor/language/LanguageTools.dart';
export 'package:fastor_app_ui_widget/resource/uiFastor/statusBar/StatusBarConstant.dart';
export 'package:hexcolor/hexcolor.dart';

export 'package:fastor_app_ui_widget/resource/resources/ds/LevelDS.dart';
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

import 'package:fastor_app_ui_widget/resource/toolsFastor/fix_bugs_web/html_fake.dart' hide Navigator;

import 'resource/template/progressView/ProgressSpinFastor.dart';
export 'resource/template/progressView/ProgressSpinFastor.dart';

import 'resource/template/progressView/ProgressCircleFastor.dart';
export 'resource/template/progressView/ProgressCircleFastor.dart';

import 'resource/template/row/RowScrollFastor.dart';
export 'resource/template/row/RowScrollFastor.dart';

export 'package:fastor_app_ui_widget/resource/toolsFastor/fix_bugs_web/html_fake.dart' hide Navigator;

import 'package:fastor_app_ui_widget/resource/toolsFastor/network/NetworkHeaderTools.dart';

import 'package:fastor_app_ui_widget/resource/toolsFastor/network/http/NetworkManagerHttp.dart';
import 'package:fastor_app_ui_widget/resource/toolsFastor/network/NetworkRequestFile.dart';
import 'package:fastor_app_ui_widget/resource/toolsFastor/network/NetworkTypeDio.dart';
import 'package:fastor_app_ui_widget/resource/toolsFastor/network/ValidateResponse.dart';

import 'resource/template/scrollview/ScrollFastor.dart';
export 'resource/template/scrollview/ScrollFastor.dart';
import 'resource/template/switch/SwitchFastor.dart';
export 'resource/template/switch/SwitchFastor.dart';

import 'resource/template/textfield/email_or_phone/TextFieldEmailOrPhoneFastor.dart';
export 'resource/template/textfield/email_or_phone/TextFieldEmailOrPhoneFastor.dart';



import 'resource/template/textfield/validator/ValidatorType.dart';
export 'resource/template/textfield/validator/ValidatorType.dart';
import 'resource/template/toolbar/simple/ToolbarSimpleFastor.dart';
import 'resource/toolsFastor/initialize_app/Fastor.dart';
export 'resource/toolsFastor/initialize_app/Fastor.dart';
import 'resource/toolsFastor/lang/LangFastor.dart';
import 'resource/toolsFastor/navigate/NavigationTools.dart';
export 'resource/toolsFastor/navigate/NavigationTools.dart';
export 'resource/template/toolbar/simple/ToolbarSimpleFastor.dart';

import 'resource/toolsFastor/cache/Save.dart';
export 'resource/toolsFastor/cache/Save.dart';

export 'package:fastor_app_ui_widget/resource/toolsFastor/network/NetworkHeaderTools.dart';


export 'package:fastor_app_ui_widget/resource/toolsFastor/network/http/NetworkManagerHttp.dart';
export 'package:fastor_app_ui_widget/resource/toolsFastor/network/NetworkRequestFile.dart';
export 'package:fastor_app_ui_widget/resource/toolsFastor/network/NetworkTypeDio.dart';
export 'package:fastor_app_ui_widget/resource/toolsFastor/network/ValidateResponse.dart';

//dio
// import 'package:fastor_app_ui_widget/resource/toolsFastor/network/dio/DioService.dart' hide post_dio ;
import 'package:fastor_app_ui_widget/resource/toolsFastor/network/dio/NetworkManagerDio.dart'  hide DioService ;

import 'resource/toolsFastor/values/ToolsString.dart';
export 'resource/toolsFastor/values/ToolsString.dart';

export 'package:fastor_app_ui_widget/resource/toolsFastor/network/dio/NetworkManagerDio.dart' hide DioService ;

///fastor_app_ui_widget app all class
class fastor_app_ui_widget extends fastor {



  ///network
  late NetworkManagerDio dio;
  late NetworkManagerHttp http;
  late NetworkTypeHttp networkTypeHttp;
  late NetworkHeaderTools networkTools;
  late NetworkRequestFile requestFile;
  late NetworkTypeDio networkType;
  late NetworkConfigDio configDio;
  late ValidateResponse validateResponse;
  late ApiTools toolsAPI;
  late InternetTools internetTools;

  ///widget
  late ButtonTemplate b;
  late CardViewTemplate card;
  late CheckboxTemplate ch;
  late CheckboxFastor chFastor;
  late GestureDetectorTemplate gs;
  late ColumnTemplate col;
  late ColumnFastor colFastor;
  late ContainerTemplate cont;
  late OTPTextFieldFastor otpTextFieldFastor;
  late TextFieldEmailOrPhoneFastor textFieldEmailOrPhoneFastor;
  late TextFieldEmailListener textFieldEmailListener;
  late DateRangeTextFieldFastor dateRangeTextFieldFastor;
  late DateTextFieldFastor dateTextFieldFastor;
  late DateRangePickerResult dateRangePickerResult;

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
  late ScrollFastor scrollFastor;
  late PlaceholderTemplate pls;
  late RadioTemplate rd;
  late RowTemplate rw;
  late RowScrollFastor rs;
  late SpinnerTemplate sp;
  late SpinnerTemplateState spSate;
  late SpinnerView spView;
  late SpinnerViewState spStateView;
  late DropdownFastor dropdownFastor;
  late StackTemplate st;
  late SwitchTemplate sw;
  late SwitchFastor switchFastor;
  late TableView tb;
  late TableState tbState;

  ///calender
  late CalendarTemplate calendar;
  late CalenderFastor calenderFastor;
  late CalenderTypeFastor calenderTypeFastor;
  late TextFastor textFastor;
  late ButtonFastor buttonFastor;
  late PageFastor pageFastor;
  late ImageFastor imageFastor;
  late FastorMaterialApp materialApp;
  late AppBarFastor appBar;
  late ChartMultiLineFastor chartMultiLineFastor;

  late MobileCountryFastor mobileCountryFastor;
  late MobileCountryListener mobileCountryListener;


  ///progress view
  late ProgressSpinkit prgSpin;
  late ProgressCircleState prgState;
  late ProgressCircle prg;
  late ProgressSpinFastor progressSpinFastor;
  late ProgressCircleFastor progressCircleFastor;

  ///text and TextField
  late TextTemplate tx;
  late TextFieldTemplate tf;
  late TextFieldFastor tfStateLess;
  // late TextFieldBackendErrorFastor tfError;
  late ValidatorTemplate validatorTemplate;
  // late ValidatorType validatorType;

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
  late LangFastor langFastor;
  late Log myLog;
  late IFrameElement iFrameElement;
  late CssStyleDeclaration cssStyleDeclaration;
  late Save saveFastor;
  late ToolsString toolsString;
  late ToolsWait toolsWait;
  late ToolsPhone toolsPhone;
  late ZoneTools zoneTools;

  ///tools ui
  late StatusBarConstant statusBar;
  late ListenerChangeDeviceSize listenerChangeDeviceSize;
  late CropTemplate cropTemplate;
  late FastorScrollTheme scrollTheme;
  late NavigationTools navigationTools;

  //toolbar
  late ToolbarSimpleFastor toolbarSimpleFastor;

  ///state managmetn
  late FastorStateManagement stateManagement;

  //constant
  late NotchBarConstant notch;

  // plugin main
  late Fastor fastorMain;
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


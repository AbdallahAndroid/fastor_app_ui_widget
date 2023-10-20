## 1.2.73

* Fix "TableViewFastor" not rebuild with new data of "listRow"

## 1.2.72

* Validate "TextFieldFastor" parameter "decoration" is instance of class "InputDecoration"

## 1.2.71

* update readme

## 1.2.0

* make initialize fastor plugin from main() method by writing "  await Fastor.initializeApp( );  "

## 1.0.268

* in "TextFieldFastor" convert "decoration" parameter to type "InputDecoration"
* in "TextFieldFastor" build "decorationBackground" parameter to type "decoration" to set in the container
* In "TextFieldFastor" make both parameter have same meaning "isShowBoarder"  or "showOutlineInput"

## 1.0.267

* allow to use  "NetworkDiocallback_dio? callback" the response json from class "NetworkManagerDio"
  while using  "NetworkManagerDio().any()" or any method type like "NetworkManagerDio().get()"

## 1.0.266

* file upload progress using attribute "onReceiveProgress" in class "NetworkManagerDio"

## 1.0.263

* file upload progress using attribute "onSendProgress" in class "NetworkManagerDio"

## 1.0.262

* in "DropdownFastor" can change textstyle of item menu by using "textStyleItemDropdown"

## 1.0.260

* buttonFastor add feature progress
  bool? showProgress;
  double? sizeProgress;
  Color? colorProgress;

## 1.0.258

* add at "DropDownFastor"  feature "previousPosition" take int position of choose one item selected programmatically, used at show previous selected item at edit form.
* add at "SpinnerView"  feature "previousPosition" take int position of choose one item selected programmatically, used at show previous selected item at edit form.

## 1.0.256

* add listener "onRemoveSelected" at "DropdownFastor"

## 1.0.255

* add class "ClipboardFastor" to save/get from clipboard
* update readme of "DeviceTools" class

## 1.0.254

*  add "hint_color"  at "TextFieldEmailOrPhoneFastor" widget

## 1.0.253

*  add "TextDirection"  at "TextFieldEmailOrPhoneFastor" widget

## 1.0.252

* Build class "TableFastor"

## 1.0.251

* Build class "ScaffoldFastor"

## 1.0.250

* Add class "SaveFastor"

## 1.0.249

* hint and text in "CalenderFastor"

## 1.0.248

* add new method "ValidateResponse.isValidJson()"

## 1.0.247

* change name of "TableState" to "TableViewState" for class  "TableViewFastor"

## 1.0.246

* add "colorItemTextSelected" at widget "DropdownFastor"

## 1.0.245

* fix dropdown if hidden when not names[] 
* add some feature of style of "DropdownFastor"

## 1.0.239

* add "DateTime" in callback of "CalenderFastor"

## 1.0.238

* fix "ScrollFastor" and "ScrollViewPage" in last flutter sdk 3.13.1 , by removing "isAlwaysShown" at scrollview material

## 1.0.237

* build new class "LangFastor" for handle arabic translate and arabic direction left/right 

## 1.0.236

* build new widget "TextFieldEmailOrPhoneFastor"

## 1.0.234

* in class "MobileCountryFastor" add feature "hint"
* in class "MobileCountryFastor" add feature "suffixIcon"
* in class "MobileCountryFastor" add feature "isHideCountryCode"
* in class "TextFieldFastor" when "isRemoveUnderLine" is true, remove from both focus and normal decoration.

## 1.0.233

* make "OTPTextFieldFastor" focus to previous field when user remove character.

## 1.0.232

* add "fontFamily" in class "TextFieldFastor"
* build new widget "OTPTextFieldFastor"

## 1.0.231

* add class "ZoneTools" return current country code.

## 1.0.230

* set the countryCode of current country to widget "MobileCountryFastor"

## 1.0.229

* add new widget "CalenderFastor" 

## 1.0.228

* add new widget "MobileCountryFastor" use plugin "country_code_picker" with some customization in phone

## 1.0.227

* add method "ToolsPhone.fixEgyptAndSaudiNumber()" fix egyption people ways of enter mobile number.
* add method "ToolsPhone.fixEgyptAndSaudiNumber()" fix saudi people ways of enter mobile number.

## 1.0.226

* add method "ToolsValidation.checkTextIsPhoneNumberCharsOnlyWithoutAbc()"

## 1.0.225

* add some feature in style of "DropdownFastor"

## 1.0.223

* add method "ValidateResponse.isStatusBadRequest()" when status equal 400
* add method "ValidateResponse.isStatusCredentialWrong()" when status equal 403

## 1.0.221 

* add class "ToolsWait" to make any action after waiting some time. Juse method "ToolsWait.waitToDo()"

## 1.0.219

* add method "ValidateResponse.isStatusFrom200To210()"
* add method "ValidateResponse.isSuccessStatusCode()" take parameter type Dio Response

## 1.0.216

* add suffix icon to TextFieldFastor
* error underline boarder for "isRemoveBoarder" equal true
* add in class "ValidatorTemplate" method "isEmailOrPhone()"

## 1.0.214

* add class "DateTextFieldFastor"
* add class "DateRangeTextFieldFastor"
* add listener "DateRangePickerResult" for range picker date.

## 1.0.211

* add class "DropdownFastor"

## 1.0.209

* animation - fade in "NavigationTools" class

## 1.0.208

* remove log from widget "GridViewFastor"

## 1.0.207

* add network type "patch" in class "NetworkManagerDio"

## 1.0.206

* add class "NetworkConfigDio" for constructor "NetworkManagerDio"

## 1.0.205

* default iconwidget in spinnerview is alighment to right.

## 1.0.204

* Spinnerview make it take error decoration "  Decoration? errorOutlineDropdownDropdown;"

## 1.0.203

+ spinnerview add error parse.

## 1.0.201

* add class "ProgressCircleFastor()"
* add class "ProgressSpinFastor()"

## 1.0.199

* add class "ScrollFastor"
* use ThemeData() default.

## 1.0.198

* class "Fastor" for call "Fastor.initializeApp()"

## 1.0.197

* class "SwitchFastor()"

## 1.0.195

* class "SpinnerView()" add feature: decoration
* class "SpinnerView()" add feature: colors
* 
## 1.0.194

* fix not supported "flutter_clean_calendar" plugin while using "CalenderTemplate" widget.

## 1.0.193

* fix  "ChartMultiLineFastor"

## 1.0.192

* remove support plugin "easy_localization" at plugin fastor

## 1.0.191

* add widget "ChartMultiLineFastor"

## 1.0.190

* Fix bug of Network Uploading File.
* class "TextFieldBackendErrorFastor" for handle error come from backend

## 1.0.188

* class "ToolsString" add methods "removeLastChar()" and method "isContainSingleCharacter()"
* class "ToolbarSimpleFastor" features change color of icon and title.

## 1.0.180

* class "InternetTools" for check internet connection.
* class "FastorTextField" remove "error_text" just use "ValidatorCustom" message.

## 1.0.178

* class "NetworkManagerDio" fix error "XMLHttpRequest" found at web platform.

## 1.0.176

* class "NetworkManagerDio" handle error.
* class "NetworkManagerDio" make method "callBack" return "Future<Response>"
* Class "NetworkHeaderTools" check for valid token/username/password before generate header

## 1.0.172

* Make "ValidatorTemplate" take optional parameter "error_text"
* class "NetworkManagerDio" make method "callBack"

## 1.0.168

* Use "ValidatorType" in Form "TextFieldFastor"
* Error Style For "TextFieldFastor"
* Readme Fro How To Use "Cubit/BLoc" with "TextFieldFastor"
* TextFieldFastor handle error backend, by call from parameter constructor:
  * String? errorBackendKeyJson;
  * Map<String, dynamic>? errorBackendJson;

## 1.0.164

* class "NetworkManagerDio" handle status "404" or any status not 200, by using class "DioError"
* class "NetworkManagerDio" create method "any()" take any type of network type
* class "NetworkManagerDio" choose one method  name "get()/put()/delete()/post()/file()" 

## 1.0.158

+ add class "NavigationTools" for push() or pushAndRemove() or pushWithResumeLifecycle()

## 1.0.156

* add class "Save" for save in cache

## 1.0.155

+ Edit class "NetworkManagerHttp" methods "getFutureResponse()"

## 1.0.154

+ Add 'color_inactive' in 'CheckboxFastor'
+ Add 'color_active' in 'CheckboxFastor' 
 
## 1.0.152

+ Add CheckboxFastor

## 1.0.151

* README EDIT

## 1.0.150

* Language Readme
* NetworkManage Readme

## 1.0.148

+ Add Type "TextFieldFastor"

## 1.0.145

* Edit Readme ColumnFastor

## 1.0.144

* ColumnFastor, make alignment default is null like the Widget Column

## 1.0.142

* Add Feature "NetworkManager" by using class "NetworkManagerDio" and class "NetworkManagerHttp"

## 1.0.141

+ BUILD "ColumnFastor"

## 1.0.139

+ BUILD "RowScrollFastor"

## 1.0.136

* edit readme for image fastor

## 1.0.134

* edit readme for all page

## 1.0.133
 
* edit readme for button

## 1.0.132

* Default button color to black/gray

## 1.0.131

* Update "Readme"

## 1.0.130

* Fix "ScrollViewPage.dart" in webplatform for parameter "thumbVisibility"

## 1.0.129

* Add Extra "PointerDeviceKind" for touching.

## 1.0.128

* Update "Readme"

## 1.0.127

* fix bug "platformViewRegistry" not support in Mobile Platform, while support on Website
  this is Fake Code to can run apk on emulator Mobile

## 1.0.126

* Fix bigs at class "html_fake.dart"

## 1.0.125

* Fix (import 'dart:html') not found when run project for Mobile Platform Android/ios.
  Create the  "html_fake.dart" to can use to switch between platform Mobile or website.

## 1.0.124

* Add "thumbVisibility" in "PageFastor" to show/hide the scrollbar.
* Hide the glow of scroll when go to top/bottom parent of screen.

## 1.0.123

* Add feature "isStopScroll" in "PageFastor" this prevent motion of scrolling by touch

## 1.0.120

* Fix class "LanguageTools.dart" when set arabic in cache.

## 1.0.119

* Readme guild, how to install package in project.

## 1.0.118

* fix default height of "ButtonFastor" by using DSDimen.button_height

## 1.0.117

* fix "ButtonFastor" be optional set textFontSize
* set default corner for "AppBarFastor"

## 1.0.115

* build "AppBarFastor"

## 1.0.114

* export "FastorMaterialApp"

## 1.0.113

* build "FastorScrollTheme" to fix shadow of scrollview
* build "FastorMaterialApp" must to be instead of MaterialApp to fix "FastorPage"

## 1.0.112

* fix issue keyboard pad when open, call many times  build()
* fix "ButtonFastor"  must set font text size
* export "NotchBarConstant"
* new widget "AppBarFastor"
* remove plugin "EasyLocalization" from "LanguageTools.dart"

## 1.0.111

## 1.0.110

* remove "flutter_inappwebview" from fastor package

## 1.0.109

* remove "MainTemplate" from fastor package

## 1.0.108

* remove "flutter_inappwebview" from fastor package

## 1.0.107

* class "ImageFastor" fix bug of aspectRation not fit to "contain" typedar

## 1.0.106

* export class "GridViewFastor"

## 1.0.105

* fix reverse vertical in scrollChildView with arabic language

## 1.0.104

* convert class "PageTemplate" to StateLessWidget by create class "PageFastor"
* fix bugs

## 0.0.98

* convert class "TextTemplate" to StateLessWidget by create class "TextFastor"
* convert class "ButtonTemplate" to StateLessWidget by create class "ButtonFastor"
* convert class "ImageViewTemplate" to StateLessWidget by create class "ImageFastor"

## 0.0.97

* Tutorial: PageTemplate

## 0.0.88

* "CalenderTemplate" fix wrap content height, and hide event listbuilder view

## 0.0.87

* "CalenderTemplate" fix when not mounted

## 0.0.86

* "CalendarTemplate" create method to update event id

## 0.0.85

* fix height of "CalendarTemplate"

## 0.0.84

* remove space and card shape from "CalenderTemplate"

## 0.0.83

* export class "CalenderTemplate"

## 0.0.82

* new class "CalendarTemplate" for select single date
* Add to "DSColor" Calendar colors Theme

## 0.0.81

* add padding bottom NotchBar for height iphone

## 0.0.80

* fix bugs "FastorStateManagement"

## 0.0.79

* add parameter "resizeToAvoidBottomInset" at class "PageTemplate"

## 0.0.78

* fix bugs in "PrefixIcon" at class "TextFieldTemplate"

## 0.0.77

* fix bugs in "PrefixIcon" at class "TextFieldTemplate"

## 0.0.76

* add "Widget? prefix" to class "TextFieldTemplate" to can set any widget icons or images

## 0.0.75

* add "bool? isShowBoarder" to class "TextFieldTemplate"

## 0.0.74

* add "BorderRadius? radiusBorder" to class "BoarderHelper"

## 0.0.73

* fix "MainAxisAlignment.end" not working in class "ColumnTemplate"

## 0.0.72

* fix "isRemoveUnderline" in "TextFieldTemplate" class

## 0.0.71

* fix bugs

## 0.0.70

* add "SystemUiOverlayStyle" in "PageTemplate" class by use parameter "homeButtonsBackgroundColor"

## 0.0.69

* add extra method at class "ToolsValidation"

## 0.0.68

* add "clearAll()"  at class "FastorStateManagement"

## 0.0.67

* fix "getCurrentState()"  at class "FastorStateManagement"

## 0.0.66

* add method "isAppForeground()" at class "FastorStateManagement"

## 0.0.65

* class "PageTemplate" add attribute "widgetBackground"

## 0.0.64

*  class "BoarderHelper" in method "cardViewPhysical" add attribute "colorBackground"

## 0.0.63

* create class "FastorStateManagement" to manage the state
* edit class "DeviceTools" to add optional "color"

## 0.0.62

* export class "BorderRadiusTools" to helper in generate "Radius"

## 0.0.61

* add attribue "radiusBorder" at class "BoarderHelper" method "cardViewPhysical"

## 0.0.60

* fix class "BoarderHelper"

## 0.0.59

* fix scroll in browser at mobile, to more smooth

## 0.0.58

* fix scroll in browser at mobile, to more smooth

## 0.0.57

* fix scroll in browser at mobile, to more smooth

## 0.0.56

* fix scroll in browser at mobile, to more smooth

## 0.0.55

* attribute new "scrollController" at class "PageTemplate"

## 0.0.54

* attribute "scaffoldKey = GlobalKey()" at class "PageTemplate"

## 0.0.53

* create "ImageViewTemplate" class, to working as StatelessWidget

## 0.0.52

* fix v 0.0.51

## 0.0.51

* add attribute "boxFit_background" in "ImageView" to set shape (cover / fill),
  where cover make auto crop.

## 0.0.50

* add attribute "selectedTextAllow" in "TextTemplate" for web can select text by mouse

## 0.0.49

* add attribute "minLines" in "TextTemplate"

## 0.0.48

* add attribute "maxLines" in "TextTemplate"

## 0.0.47

* class "TextTemplate" remove Logs

## 0.0.46

* class "PageTemplate" try "Scaffold"
* Class "DeviceTools" fix percentage

## 0.0.45

* class "ListViewTemplate" remove "minWidth" due to cause problem in alignment not working in center

## 0.0.44

* fix "SingleChildScrollViewTemplate" not to be match parent width in "hList"

## 0.0.43

* fix "Background" to be tile "fit:  BoxFit.fill" at class "ImageView"

## 0.0.42

* fix "Dark Level for Dimensions" in "TextTemplate"

## 0.0.41

* fix "Dimen" in "TextTemplate"

## 0.0.40

* set "DeviceTools" extra feature, set by percentage, set by fifth

## 0.0.39

* set "decorationColor" same color text in "TextTemplate"

## 0.0.38

* fix "shared_preferences"

## 0.0.37

* fix "hive"


## 0.0.36

* remove lib  "shared_preferences" and use "hive" instead

## 0.0.35

* update version "shared_preferences: ^2.0.15"

## 0.0.34

* fix class "SpinnerView"

## 0.0.33

* fix class "scrollAllPage"

## 0.0.32

* add controller to class "scrollAllPage"

## 0.0.31

* fix : "PageTemplate"

## 0.0.30

* fix : "PageTemplate"

## 0.0.29

* class "color change of toolbar"

## 0.0.28

* class "ImageView" fix ValueChanged<ImageViewState> not working

## 0.0.27

* class "ImageView" set image url by state variable

## 0.0.26

* export class "ImageCircleView"

## 0.0.25

* add new colors in "DSColor" for "menu"

## 0.0.24

* add new class for progress "ProgressSpinkit"

## 0.0.23

* add new types of "FormFieldValidator" is : min, max, equal

## 0.0.22

*  add "focus" and max" at class "TextFiledTemplate"

## 0.0.21

*  add class "CropTemplate"

## 0.0.20

* fix class "DirectionLanguage" remove "!"

## 0.0.19

* fix class "DirectionLanguage"

## 0.0.18

* add new feature in class "LanguageTools.dart", add method "setArabicWhenDeviceLangaugeIsArabic()"

## 0.0.17

* fix class "ImageTemplate" make set image background, type "fit:  BoxFit.cover"

## 0.0.16

* fix class "UniqueTools" return double not integer

## 0.0.15

* DSColor add Table
* fix DSDimen padding button

## 0.0.14

* DSDimen add padding button

## 0.0.13

* fix class "DirectionLanguage"

## 0.0.12

* export class "ListenerChangeDeviceSize"

## 0.0.11

* export class "ValidatorTemplate"

## 0.0.10

* arabic direction fix bug:  scroll page when arabic, make reverse down to top


## 0.0.9

* add dependence "shared_preferences"
* "LanguageTools" class make it in singletone  check the cache by using  dependence  "shared_preferences"

## 0.0.8

* edit class "PageTemplate.dart" add new feature "statusBarColor"
* export class "LogDebug.dart"
* export class "LevelDS.dart"

## 0.0.7

* edit class "StatusBarConstant.dart" to allow to edit color
* export class "DSColor.dart" to allow to edit design system
* export class "DSDimen.dart" to allow to edit design system
* export class "DSFont.dart" to allow to edit design system
* export class "HexColor"
* edit guide get start:  replace main file

## 0.0.6

* license for website "fastor-app.com"

## 0.0.5

* Guide "Get Start"

## 0.0.4

* class "runAppFastor.dart" to call form "main.dart"

## 0.0.3

* class "MainTemplate.dart", make all classes export at "Fastor.dart" class

## 0.0.2
MainTemplate
* fix class "BoarderHelper.dart" warning

## 0.0.1

* TODO: Describe initial release.

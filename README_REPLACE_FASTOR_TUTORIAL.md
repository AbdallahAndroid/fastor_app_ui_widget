# Replace Plugin Fastor With files code COPY/PAST Tutorial


----

----
 
## Download Files :
* first way to download same version of code of project from pub.dev by choose version code, 
  you will found icon to download
    https://pub.dev/packages/fastor_app_ui_widget/versions
* second way to replace to last updated helper files. this method you need to download from github
  by choose branch name "copy_past_no_fastor"
  https://github.com/AbdallahAndroid/fastor_app_ui_widget/tree/copy_past_no_fastor

* in this tutorial i am need to replace to latest update code

----

----

## Import paths of file replace all

* open Android studio >> right click on "lib" folder then choose "find and replace all"
* find :
```
import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
```

* replace by your project name with import line, in my example project name is "werd"
```
import 'package:werd/core/utils/log/Log.dart';
import 'package:werd/core/utils/device/DeviceTools.dart';
import 'package:werd/core/lang/LangApp.dart'; 

import 'package:werd/core/network/NetworkHeaderTools.dart';
import 'package:werd/core/network/dio/NetworkManagerDio.dart';
import 'package:werd/core/network/NetworkTypeDio.dart';
import 'package:werd/core/network/ValidateResponse.dart';

import 'package:werd/customWidget/column/ColumnApp.dart';
import 'package:werd/customWidget/page/ScaffoldApp.dart';
import 'package:werd/customWidget/text/text_custom/TextCustomBold.dart';
import 'package:werd/customWidget/text/text_custom/TextCustomLight.dart';
import 'package:werd/customWidget/text/text_custom/TextCustomMedium.dart';
import 'package:werd/customWidget/text/text_custom/TextCustomRegular.dart';
import 'package:werd/customWidget/text/text_custom/TextCustomSemiBold.dart';
import 'package:werd/customWidget/button/ButtonApp.dart';
import 'package:werd/core/utils/boarder/BoarderHelper.dart';
import 'package:werd/customWidget/select/DropdownApp.dart';
import 'package:werd/customWidget/emptyView/EmptyView.dart';
import 'package:werd/core/utils/values/ToolsValidation.dart';

import 'package:werd/customWidget/paginate_number/PaginateBarApp.dart';
import 'package:werd/customWidget/row/RowScrollApp.dart';
import 'package:werd/customWidget/switch/SwitchApp.dart';
import 'package:werd/customWidget/table/TableApp.dart';
import 'package:werd/customWidget/image/ImageApp.dart';
import 'package:werd/customWidget/progressView/ProgressSpinkit.dart';
import 'package:werd/customWidget/text/TextApp.dart';
import 'package:werd/customWidget/textfield/regular/TextFieldApp.dart';
import 'package:werd/customWidget/textfield/validator/ValidatorApp.dart';
import 'package:werd/core/lang/PositionedApp.dart';
import 'package:werd/customWidget/listview/ListViewApp.dart';
import 'package:werd/core/utils/boarder/BorderRadiusTools.dart';
import 'package:werd/customWidget/cardview/CardViewApp.dart';
import 'package:werd/customWidget/progressView/ProgressCircleApp.dart';

```

* if your project make extension of DesignPatern, set this import also :
```
import 'package:werd/core/resource/ds/DesignSystemDimen.dart';
import 'package:werd/core/resource/ds/DesignSystemColor.dart';
```

----

----

## Replace Class Name
* RowTemplate.wrapChildren("   >>  "RowScrollApp( children:"
* RowTemplate.scroll(  >> RowScrollApp( children:
* ImageViewTemplate  >> ImageApp
*  CardViewTemplate.t >> CardViewApp.t
* ButtonTemplate.t( >> ButtonApp(
* ApiTools >> ApiParserApp
* "drawer: DrawerWerdWidget("  >> "drawer: Drawer( child: DrawerWerdWidget("
* ListViewTemplate.t >> ListViewApp.t
* TextTemplate.t >> TextCustomRegular
* LanguageTools.isEnglish(context) >> LangApp.isEnglish
  LanguageTools. >> LangApp.
* TextFieldTemplate.t  >> TextFieldApp
* ValidatorTemplate. >> ValidatorApp.
* CardViewApp.t >> CardViewApp
* ImageView( >> ImageApp(
* StatusBarConstant. >> StatusBarSizeHelper.
* NotchBarConstant.  >> NotchBarSizeHelper.
* RowTemplate. >> RowUtils.
----

----

## replace page:

* "PageFastor" >> ScaffoldApp
* replace "PageTemplate" >> ScaffoldApp
* PageTemplate.t >> ScaffoldApp
* PageApp( this , >> ScaffoldApp( 

```
    return ScaffoldApp( 
        statusBarColorIOSDevice: ColorProject.primaryOffWhite, 
        body: Directionality( child: pageResponsiveWebOrMobile(), textDirection: LangApp.getTextDirection(),),
        appBarCustom: ToolbarSimpleWerd(  contextPage!,  pageTitle,   ),
        appBarCustomHeight: ToolbarSimpleWerd.height,
    );
```

----

----

## Level of Design system 

* Fonts Size :
```
  static var text_level_parent = designSystem(18); ///TextCustomBold
  static var text_level_1 = designSystem(15);  ///TextCustomSemiBold
  static var text_level_2 = designSystem(13); ///TextCustomMedium
  static var text_level_3 = designSystem(11);  ///TextCustomRegular
  static var text_level_4 = designSystem(8); ///TextCustomLight
```


----

----

## Replace ToolbarSimpleApp

* create widget ToolbarSimpleApp to be build your customer project app, here in my example "ToolbarSimpleWerd"
``` 

class ToolbarSimpleApp extends StatelessWidget {
  
  BuildContext context;
  String pageTitle;
  Color? iconColorBack;
  
  ToolbarSimpleApp( this.context, this.pageTitle, {
    this.iconColorBack,  
  });
  
  @override
  Widget build(BuildContext context) {
    return ToolbarSimpleWerd( context , pageTitle, );
  }
}

```

----

----

## How to replace Progress In PageFastor 

* old way
``` 
   PageFastor( 
   
          onChangeProgressState: (s){
            if (mounted == false ){
              return;
            }

            progressState = s;
      }
```

### Steps to replace 
* replace by :
  1. comment this code 
  2. convert data type "progressState" to be boolean

* shape progressState.show()  to be :
   you can make search and replace:  
1.named  prg for dismiss
```
if(prg!= null )prg!.dismiss();
``` 
``` 
      setState(() {  prg = false;  });
```
2.named  progressState for dismiss
```
if(progressState != null ) progressState!.dismiss();
``` 
``` 
      setState(() { progressState = false;  });
```

3.named  prg for show
```
if(prg!= null )prg!.show();
``` 
``` 
      setState(() {  prg = true;  });
```
4.named  progressState for dismiss
```
if(progressState != null ) progressState!.show();
``` 
``` 
      setState(() { progressState = true;  });
```

 

* set the boolean "progressState" to  "PaginateBarApp"  if it found in the screen:
``` 

  Widget getPaginateBar(){
    return PaginateBarApp(
      
      progress: progress,
 
    );
  }
```

----

----

# Replace Progress state in ImageApp :

* old way 
``` 
   var im =  ImageApp(
        onChangeState: (value) {
           photo_state = value;
         // Log.i( "photo_image() - photo_state "   + photo_state!.toString( ));
        }, 
       
    );
```
* To be showProgress: photo_state,
``` 
   var im =  ImageApp(
 
        showProgress: photo_state, 
        // onChangeState: (value) {
        //   photo_state = value;
        // // Log.i( "photo_image() - photo_state "   + photo_state!.toString( ));
        // }, 
 
    );
```

* replace var to boolean data type :

```
ImageViewState? photo_state;            >>   bool photo_state = false ;
```

----

----

## Replace SpinnerTemplate >> SpinnerView
 
```
SpinnerView(
        iconSize: DimensionResource.spinnerIconSize,
```

----

----

## Design System Introduction
* this set the font size of widget 
``` 

extension ExtenstionFastorDimen on DesignSystemFastor {

  Future initDimen() async {

    //button
    DSDimen.ds_button_large_corner = 15;
    DSDimen.ds_button_small_corner = 40;

    //corner
    DSDimen.ds_size_corner_level_1 = 15;

    //text size
    DSDimen.text_level_parent = 25; //toolbar text size
    DSDimen.text_level_1 = 19;
    DSDimen.text_level_2 = 15;
    DSDimen.text_level_3 = 13;
    DSDimen.text_level_4 = 7;
  }
}
```
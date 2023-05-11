# Features

* Reduce 28% of chars in writing code & lines breaks.
* Get ride of RenderFlex overflowed by pixels.
* Basics ui widget with extra feature not found at normal widget. Example widget:
    * PageFastor, TextFastor, ImageFastor, RowFastor, ColumnFastor, TextFieldFastor ..etc
* Helping make coding faster by use Utils. Example Classes: 
  * NetworkManager, LanguageTools, ... etc.
 

## Get Start
1- import dependence in yaml file:
```
fastor_app_ui_widget:
```

2- at any class must import
```
import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
```

## Reference 

### documentation

[https://pub.dev/documentation/fastor_app_ui_widget/latest/index.html](https://pub.dev/documentation/fastor_app_ui_widget/latest/index.html)

### Tutorial Source Code

[https://github.com/AbdallahAndroid/fastor_app](https://github.com/AbdallahAndroid/fastor_app)

### Tutorial Youtube

[https://www.youtube.com/playlist?list=PLStw2JQi0_9pHWMU83AWIYQyApfNnsr0T](https://www.youtube.com/playlist?list=PLStw2JQi0_9pHWMU83AWIYQyApfNnsr0T)

# Tutorial Content

## Content: Widget

<table>  
  <tr>  
    <td>  
      <a     href="https://github.com/AbdallahAndroid/fastor_app/blob/master/tutorial/page/README_page.md"  >Page Shapes  
      </a>   
    </td>  
    <td>  
      <a href="https://github.com/AbdallahAndroid/fastor_app/tree/master/tutorial/textview">TextView  
      </a>   
    </td>  
    <td>  
      <a href="https://github.com/AbdallahAndroid/fastor_app/tree/master/tutorial/button">Button </a>   
    </td>  
    <td>  
      <a href="https://github.com/AbdallahAndroid/fastor_app/tree/master/tutorial/image">ImageView  
      </a>   
    </td>  
  </tr>  

  <tr>  
    <td>  
      <img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/page/thump.png" height="300"/>  
    </td>  
    <td>  
     <img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/textview/thump.png" height="300"/>  
    </td>  
    <td>  
     <img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/button/thump.png" height="300"/>  
    </td>  
    <td>  
     <img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/image/landscape.png" height="300"/>  
    </td>  
  </tr>  

  <tr>  
    <td>  
      <a href="https://github.com/AbdallahAndroid/fastor_app/tree/master/tutorial/row">Row</a>   
    </td>  
    <td>  
      <a href="https://github.com/AbdallahAndroid/fastor_app/tree/master/tutorial/column">Column</a>   
    </td>  
    <td>  
      <a href="https://github.com/AbdallahAndroid/fastor_app/tree/master/tutorial/textfield">TextField</a>   
    </td>  
  </tr>  

 <tr> 
    <td>
        <img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/row/scroll.png" height="300"/>  
    </td> 
     <td>
        <img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/column/thump.png" height="300"/>  
    </td> 
     <td>
        <img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/textfield/thump.png" height="300"/>  
    </td> 
</tr>
</table>

<!-- 
 
CheckBox
[RadioButton]()

[Switch]()

[Calender]()

[Spinner]()

[ListView]()

[Table]() -->

## Content: Classes Helper

[NetworkManager](https://pub.dev/packages/fastor_app_ui_widget#networkmanager)

[Language](https://pub.dev/packages/fastor_app_ui_widget#languagetools)

---

---

## Tutorial : PageFastor

### Scroll Screen

* Get ride of RenderFlex overflowed by pixels.

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/page/scroll.png" height="300"/>

```
@override
Widget build(BuildContext context) {
return PageFastor(this,
content: getContent() );
}
```

### Toolbar Custom Shape

Create any shape of Toolbar you want in Custom shape then put it at page template by using parameter "toolbar"

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/page/toolbar_fastor.png" height="300"/>

```
  @override
  Widget build(BuildContext context) {
    return PageFastor(this,
        toolbar: ToolbarSimpleFastor( context, "Page Shapes"),
        toolbar_height : 70,
        content: getContent() );
  }
```

* The Default height of toolbar is 70
* When the toolbar you draw different than 70 you can set height of toolbar by using "toolbar_height"

### Background Feature

#### Asset

set Image png to background, to make all content scrolling while the background image still hold at background

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/page/background_image.png" height="300"/>

#### Asset with Opacity

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/page/background_opacity.png" height="300"/>

```
  @override
  Widget build(BuildContext context) {
    return PageFastor(this,
        toolbar: ToolbarSimpleFastor( context, "Page Shapes"),
        toolbar_height : 70,

        //background
        assetBackground: const AssetImage("assets/images/background.png"),
        assetBackgroundOpacity: 0.3,

        content: getContent() );
  }
```

#### Custom Widget

set Custom Widget hold at background, to make all content scrolling while the background widget still holding while scrolling

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/page/background_custom.png" height="300"/>

```
  @override
  Widget build(BuildContext context) {
    return PageFastor(this,
        toolbar: ToolbarSimpleFastor( context, "Page Shapes"),
        toolbar_height : 70,

        //background
         widgetBackground: CustomWidgetBackground(),
        
        content: getContent() );
  }
```

### Navigation Bottom

### Custom Shape Navigation

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/page/navigation.png" height="300"/>

set Custom Widget hold at bottom of screen to navigate between multi screens

```
  @override
  Widget build(BuildContext context) {
    return PageFastor(this,

        //toolbar
        toolbar: ToolbarSimpleFastor( context, "Page Shapes"),
        toolbar_height : 70,

        //navigation bottom
        navigationBottom: NavigationFastor( context, 0),
        navigationBottom_height: 70,
        homeButtonsBackgroundColor: HexColor(  "#1593bc"),   //color background for home buttons

        content: getContent() );
  }
```

### Change color

#### Color of Home Buttons Android Device

By using parameter "homeButtonsBackgroundColor" you can write hexcode color

<p align="left">
<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/page/color_home_1.png" height="300"/>
<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/page/color_home_2.png" height="300"/>
</p>

```
  @override
  Widget build(BuildContext context) {
    return PageFastor(this,
 
        homeButtonsBackgroundColor: HexColor(  "#1593bc"),   //color background for home buttons

        content: getContent() );
  }
```


#### Color of Status Bar

By using parameter "statusBarColorCustome" you can write hexcode color

<p align="left">
<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/page/color_statusbar_1.png" height="300"/>
<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/page/color_statusbar_2.png" height="300"/>
</p>

```
  @override
  Widget build(BuildContext context) {
    return PageFastor(this,
 
        statusBarColorCustome: HexColor(  "#595629"),

        content: getContent() );
  }
```
 
---
<hr  style="border-top: 3px solid; ">

## Tutorial : TextFastor

### Why use Fastor widget ?

* Reduce 28% of chars in writing code
* Reduce 28% of lines breaks

### Feature Fastor
* Margin without use Container
* Padding without use Container
* Decoration background without use Container
* Text Align without use Style
* Text Decoration without use Style
* Font size without use Style
* Font family without use Style
* On tap without use GestureDetector

### Table Result : Percentage of code writing reduction

Using Fastor widget reduce writing code by 28% chars when you compare with normal flutter widget

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/textview/text_compare.png"
width="1300" height="175"/>

See source code compare between Fastor and Normal at this page

### Get Start
#### Full Example

```
    TextFastor(
        "Text Fastor Simple" ,
        textAlign: TextAlign.center,
        textDecoration: TextDecoration.underline,
        color:  Colors.blue,
        fontSize: 25,
        fontFamily: FontProject.marina,
      margin: EdgeInsets.all( 25 ),
      padding: EdgeInsets.all( 10),
      decoration: BoarderHelper.cardView(
        colorLine: Colors.red,
        colorBackground: Colors.yellow,
        radiusSize: 15
      ),
      // backgroundColor: Colors.green,
      maxLines: 2,
      onPressed: (){
          Log.i( "click on fastor widget");
      },
    );
```

### Compare Text() Normal Vs TextFastor()

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/textview/text_screen.png" height="300"/>


```

  Widget getContent() {
    return Column( children: [
     textview_normal(),
      textview_fastor()
    ],);
  }

  Widget textview_normal() {
    return GestureDetector( child:  Container(
      child: Text(
      "Text Normal" ,
      textAlign: TextAlign.center,
      maxLines: 2,
      style: TextStyle(
          decoration: TextDecoration.underline,
          decorationColor: Colors.blue,
          color: Colors.blue,
          fontSize: 25,
          fontFamily: FontProject.marina
      ),
    ),
      margin: EdgeInsets.all( 25 ),
      padding: EdgeInsets.all( 10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.red ) ,
          borderRadius: BorderRadius.all(
              Radius.circular( 15 )
          ) ,
          color: Colors.yellow     //background color
      ),
      // color: Colors.green,
    ),
    onTap: (){
      Log.i( "click on Normal");
    },
    );
  }


  Widget textview_fastor() {
    return TextFastor(
        "Text Fastor" ,
        textAlign: TextAlign.center,
        textDecoration: TextDecoration.underline,
        color:  Colors.blue,
        fontSize: 25,
        fontFamily: FontProject.marina,
      margin: EdgeInsets.all( 25 ),
      padding: EdgeInsets.all( 10),
      decoration: BoarderHelper.cardView(
        colorLine: Colors.red,
        colorBackground: Colors.yellow,
        radiusSize: 15
      ),
      // backgroundColor: Colors.green,
      maxLines: 2,
      onPressed: (){
          Log.i( "click on fastor widget");
      },
    );
  }
```

---
<hr  style="border-top: 3px solid; ">


## Tutorial : ButtonFastor

### Feature Fastor
* Margin without use Container
* Padding without use Container
* Decoration background without use Container
* Text Align without use Style
* Text Decoration without use Style
* Font size without use Style
* Font family without use Style
* On tap without use GestureDetector

### Get Start

See source code compare between Fastor and Normal at this page

#### Full Example

```
    ButtonFastor(
      "Button Fastor",
      () {
        print("click on btn type fastor");
      },
      margin: EdgeInsets.symmetric( vertical: 40),
      textColor: Colors.blue,
      background: Colors.black,
      fontFamily: FontProject.marina,
      textFontSize: 15,
      borderLine: Colors.blue,
      borderRadius: 15,
    );
  }
```

### Compare Text() Normal Vs TextFastor()

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/button/thump.png" height="300"/>

```
EdgeInsets.symmetric( vertical: 30),
      child: ElevatedButton(
          onPressed: () {
            print("click on btn type normal");
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder (
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(width: 1,color: Colors.blue)
          )),
          child: Text(
            "Button Normal",
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
                color: Colors.blue,
                fontSize: 15,
                fontFamily: FontProject.marina
            ),
          )
      ),
      // color: Colors.green,
    );
```

---
<hr  style="border-top: 3px solid; ">


## Tutorial : ImageFastor

### Feature Fastor
* Background color/image without use Container
* Padding without use Container
* Aspect Ratio Image
* Radius Corner for Image
* On tap without use GestureDetector

### Set Image type url + Corner Radius + Background color + opacity + onPressed + margin


<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/image/landscape.png" height="300"/>

```
      ImageFastor(
        context:  context,
        width: 278,
        height: 181,
        margin: EdgeInsets.all( 10),
        radius_all: 25,
        boxFit_background: BoxFit.cover,
        urlBackground: square_url_image_example,
        colorBackground: Colors.amber,
        opacity: 0.7,
        onPressed: (){
          print("click on image");
        },
      );
    }
``` 

### Set Image type assets + Corner Radius

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/image/assets.png" height="300"/>

```
      return ImageFastor(
        context:  context,
        width: 300,
        height: 600,
        radius_all: 25,
        assetAspectRatio:  AssetImage("assets/images/background.png"),
      );
```

### Set Image auto-responsive between website screen desktop, website screen mobile and mobile real device
same code working in all platform with save the aspect ratio size of image with all screen size of any device.

#### Screen Size : Website Desktop
<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/image/responsive_web.png" height="300"/>

#### Screen Size : Website Browser Mobile Chrome
<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/image/responsive_browser_mobile_screen.png" height="300"/>

#### Screen Size : Android Mobile
<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/image/responsive_mobile.png" height="300"/>

```
      ImageFastor(
        context:  context,
        width: 300,
        height: 300,
        radius_all: 25,
        assetAspectRatio:  AssetImage("assets/images/logo_example.png"),
        responsive_auto: true,
      );
```

---
<hr  style="border-top: 3px solid; ">

## Tutorial : RowFastor

### Feature Fastor
* "RowScrollFastor" Scroll Horizontal for get ride of RenderFlex overflowed by pixels


### RowScrollFastor

Using Fastor widget Scroll Horizontal for get ride of RenderFlex overflowed by pixels

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/row/scroll.png"
height="300"/>

See source code compare between Fastor and Normal at this page

```
   RowScrollFastor(  children: getChildren()  );
```


---

---

## Tutorial : ColumnFastor

### Feature Fastor
* Have Decoration
* Have Space : Margin, Padding
* Have Alignment
* Can Set Fixed size width/height


### ColumnFastor

Using Fastor widget Scroll Horizontal for get ride of RenderFlex overflowed by pixels

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/column/thump.png"
height="300"/>

See source code compare between Fastor and Normal at this page

```
    ColumnFastor(
        children: getChildren(),
        margin: EdgeInsets.only(top: 20, bottom: 20, left: 60, right: 60),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.yellow //background color
        ),
    );
```

---

---

## Tutorial : TextFieldFastor

### Feature Fastor
+  Call from constructor of class

```
    // validate
    this.validator,
    this.autovalidateMode,
    this.error_text = "Missed",

    //text and hint
    this.hint_text,
    this.text_color,
    this.fontSize,
    this.hint_color,

    //boarder and underline
    this.isRemoveUnderline = false,
    this.isShowBoarder,

    //background
    this.background_color,
    this.decoration,              //at the Container

    //spaces
    this.padding,
    this.margin,

    //controller
    this.controller,
    this.onChanged,

    //input content type
    this.keyboardType,
    this.obscureText = false,

    //size and max/min
    this.width,
    this.maxLength,
    this.maxLines,
    this.minLines,

    //other
    this.textAlign  ,
    this.focusNode,
    this.prefixIcon
```

### Get Start

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/textfield/thump.png"
height="300"/>

#### Simple Example
* Create Variable at class
```
  var email_txt = "";
  var email_valid = AutovalidateMode.disabled;
```

* Create Widget
```
    return TextFieldFastor(
        autovalidateMode: email_valid,
        margin: EdgeInsets.only( top: 10 ),
        padding: EdgeInsets.all( 5),
        background_color: Colors.white,
        validator: ValidatorTemplate.email( ),
        keyboardType: TextInputType.emailAddress,
        onChanged: (s){
          email_txt = s;
          Log.i( "tf_email() - change s: $s ");
        }
    );
```

* Validate Form after click of button
```
          if(validateEmailAfterClick())  {
            ///TO-DO : After success success field
          }
```

```
  bool validateEmailAfterClick() {
    var result = true; //default good
    //email
    if ( ToolsValidation.isEmail( email_txt ) == false  ){
      Log.i( "missed email");
      result  = false;
      setState(() {
        email_valid = AutovalidateMode.always;
      });
    }
    return result;
  }
```

#### Full Example

```

//----------------------------------------------------- variable validate textField

  var email_txt = "";
  var email_valid = AutovalidateMode.disabled;

  //---------------------------------------------------------------- textfield

  Widget tf_email() {
    return TextFieldFastor(
        autovalidateMode: email_valid,
        margin: EdgeInsets.only( top: 10 ),
        padding: EdgeInsets.all( 5),
        background_color: Colors.white,
        validator: ValidatorTemplate.email( ),
        keyboardType: TextInputType.emailAddress,
        onChanged: (s){
          email_txt = s;
          Log.i( "tf_email() - change s: $s ");
        }
    );
  }

  //---------------------------------------------------------- button validate

  Widget bt_send_otp() {
    var bt =  ButtonFastor( "SEND",
        background: Colors.black,
        textColor: Colors.white,
        width: 200,
        margin: EdgeInsets.only(top: 40), () {
          if(validateEmailAfterClick())  {
            ///TO-DO : After success success field
          }
    });

    return Container( child:  bt,
      alignment: Alignment.center,
      width: double.infinity,
    );
  }


  bool validateEmailAfterClick() {
    var result = true; //default good
    //email
    if ( ToolsValidation.isEmail( email_txt ) == false  ){
      Log.i( "missed email");
      result  = false;
      setState(() {
        email_valid = AutovalidateMode.always;
      });
    }
    return result;
  }

```

---

---
 
# Helper Classes

## NetworkManager

---

### Simple Example
* There is many steps to call API, you need to prepare: Body, Url, Header, token.
* Here is guide

#### 1- Generate Body

```
    Map<String, dynamic> body = Map();
    body[ "payment_method"] =  "cash";
    body[ "price"] = "123";
```


#### 2- Generate Bearer Token in Header
```
    var token = await UserSingleTone.instance().getToken();
    Map<String, String> header = NetworkHeaderTools.bearerToken( token );
```

### 3- Call Class "NetworkManagerDio.dart"
We will return the response in format JSON
```
    NetworkManagerDio(url, headers:  header, body: body, callback: (status, msg, json){
         
            parseJson(json );

        });
    }

```

### Callback Parameter

what is the callback for
``` 
 callback: (status, msg, json){
```

This is value of
``` 
bool status, String msg, Map<String, dynamic> json
```

---


### Full Example

#### typedef

```
typedef CityListCallBack = Function(bool status, String msg , ResponseCityList response );

```

##### class CityListAPI

```

class CityListAPI   {


  int? page ;
  late CityListCallBack callBackCity;

  //data
  ResponseCityList response =  ResponseCityList();
 

  Future  getData(  CityListCallBack callBack) async {
    this.callBackCity = callBack;

    await _startAPIGetAll();
  }


  Future _startAPIGetAll() async  {
  
    String url = BackendConstant.baseUrl_v1 + "/city/?paginator=10000000&page=1"   ;
 
    //header
    var token = await UserSingleTone.instance().getToken();
    Map<String, String> header = NetworkHeaderTools.bearerToken( token );

    NetworkManagerDio(url, headers:  header,  callback: (status, msg, json){

      if( status ) {
        parseJson(json );
      } else  {
        callBackCity( false , msg , response );
      }

    });
  }

  //------------------------------------------------------------------- parse

  void parseJson(Map<String, dynamic> mapJson ) {

    try {

      response = ResponseCityList.fromJson( mapJson);

      //check
      if ( ValidateResponse.isFailed( response.code) ) {
        callBackCity( false, "Failed to download", response ) ;
        return;
      }

      //check have data
      if ( response.data == null  ) {
        callBackCity( false,"Failed to download data"  , response) ;
        return;
      }

      //callback success
      callBackCity( true,"Success", response   );

    } catch (e ){
      Log.i( "exe: " + e.toString() );
      callBackCity( false, e.toString(), response ) ;
    }
  }

}
```

##### Class Response :

* i am used website for generate POJO using [javiercbk](https://javiercbk.github.io/json_to_dart/)

```

class ResponseCityList {
  String? status;
  int? code;
  DataCity? data;

  ResponseCityList({this.status, this.code, this.data});

  ResponseCityList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    data = json['data'] != null ? new DataCity.fromJson(json['data']) : null;
  }

  @override
  String toString() {
    return 'ResponseListCity{status: $status, code: $code, data: $data}';
  }
}

class DataCity {

  List<MCity>? data;
  int? currentPage;
  int? total;

  @override
  String toString() {
    return 'DataCity{data: $data, currentPage: $currentPage, totalBar: $total}';
  }


  DataCity.fromJson(Map<String, dynamic> json) {

    if (json['data'] != null) {
      data = <MCity>[];
      json['data'].forEach((v) {
        data!.add(new MCity().fromJson(v));
       // Log.i( "DataCity - fromJson - data: " + data.toString() );
      });
    }
    currentPage = json['current_page'];
    total = json['total'];
  }


}

```

---

### Validate Response Json
* use class "ValidateResponse.dart"

* method return boolean when value is 1
``` 
ValidateResponse.isSuccess()
```

* method used to change status, example change status of product from "favorite" to "unfavorite" and vise versa

``` 
var viseVersa = ValidateResponse.changeStatus()
```

---

###  NetworkType

#### Enum of Network type
``` 
enum NetworkType{
get,
post,
put,
delete,
file
}
```

---

#### Upload File
* What is class "xFile" it's famous used by plugin "cross_file".
* Generate XFile used by [image picker](https://pub.dev/packages/image_picker)

##### class "NetworkRequestFile"

this class used to set the path of file of "xFile" and set the key/value of file


##### Example upload file type "xFile"
```

  Future _startAPI() async  {
  
    //body request
    Map<String, dynamic> body = Map();
    body[ "payment_method"] =  "cash";
    body[ "price"] = "123";
    
    //set type requestFile
    NetworkRequestFile?  requestFile = NetworkRequestFile.fromXFileAndBody( xFile!, body );
 
    //header
    var token = await UserSingleTone.instance().getToken();
    Map<String, String> header = NetworkHeaderTools.bearerToken( token );

    NetworkManagerDio(urlApiLink,
        type: NetworkType.file ,
        requestFile: requestFile,
        headers:  header,
        callback: (status, msg, json){

            parseJson(json );

        });
```

---

### Types Of Webservice Network Dependence
* dio : use class "NetworkManagerDio.dart"
* http : use class "NetworkManagerHttp.dart"

---

---

## LanguageTools

### Arabic right-to-left "RTL" Layout Direction
How To User Class "LanguageTools.dart" to auto change direction from (  English => Arabic )
```

  @override
  Widget build(BuildContext context) {
    FastorStateManagement.instance().getCurrentContext();
    return PageFastor(this, content: getDirection());
  }
  
  Widget getDirection() {
    return   Directionality(
      textDirection: LanguageTools.getTextDirection(context),
      child:   Builder(
        builder: (BuildContext context) {
          return   MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0,
            ),
            child: getContent(),
          );
        },
      ),
    );
  }


```

---

---

# At The End

## About Developer

```

• 7 Years of experience build +20 App.
• Mobile Developer: Flutter & Native Android IOS.
• Skills: Dart, Java, Kotlin, Swift UIKit, SwiftUI
• OCA, Oracle Certified Associate.


```
### Follow my Project on Instagram :
[Instagram](https://instagram.com/abdallahabtkar)

## How to contribute

Want to contribute to the project? We will be proud to highlight you as one of our collaborators. Here are some points where you can contribute and make Fastor (and Flutter) even better.

Write articles or make videos teaching how to use Fastor (they will be inserted in the Readme and in the future in our Wiki).
Offering PRs for code/tests.
Including new functions.
Any contribution is welcome!

### Contact for contribute:
<a href = "mailto:abdallah.android.app@gmail.com?subject=Contribute Request&body=Contribute For Fastor-UI-Widget&body">Send Email</a>


## License BSD 3
```
Copyright (c) 2022, Abdallah Mahmoud Ahmed Shehata
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice,
  this list of conditions and the following disclaimer.
* Redistributions in binary form must reproduce the above copyright
  notice, this list of conditions and the following disclaimer in the
  documentation and/or other materials provided with the distribution.
* Neither the name of fastor-app.com nor the names of its contributors
  may be used to endorse or promote products derived from this software
  without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
```

 
---
<hr  style="border-top: 3px solid; ">

[//]: # (Congiratulation You Are Complete)

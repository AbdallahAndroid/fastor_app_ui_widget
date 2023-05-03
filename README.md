# Features

* Reduce 28% of chars in writing code & lines breaks.
* Git ride of RenderFlex overflowed by pixels.
* Important ui widget with extra feature not found at normal widget. Example widget: Page, TextView, ImageView, ... etc
* Helping make coding faster by use Utils: NetworkFastor, DeviceTools, BoarderHelper... etc.
 

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
      <a href="https://github.com/AbdallahAndroid/fastor_app/tree/master/tutorial/column">Column</a>   
    <td>  
      <a href="https://github.com/AbdallahAndroid/fastor_app/tree/master/tutorial/textfield">TextField</a>   
    </td>  
    <td>  
      <a href="https://github.com/AbdallahAndroid/fastor_app/tree/master/tutorial/checkbox">CheckBox</a>   
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
    <td>
        <img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/checkbox/thump.png" height="300"/>  
    </td>
</tr>
</table>
 


[Row](https://github.com/AbdallahAndroid/fastor_app/tree/master/tutorial/row)

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/row/scroll.png" height="300"/>

[Column]()

[TextField]()

[CheckBox]()

[RadioButton]()

[Switch]()

[Calender]()

[Spinner]()

[ListView]()

[Table]()

---
<hr  style="border-top: 3px solid; ">

## Tutorial : Page Shapes

### Get Start
#### Full Example
1. Create New Widget extends "StatefulWidget" .
2. inside build() make return "PageTemplate.t()" .

```
import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:flutter/material.dart';

class TutorialCreateFastorPage extends StatefulWidget {
  @override
  TutorialCreateFastorState createState() => TutorialCreateFastorState();
}

class TutorialCreateFastorState extends State<TutorialCreateFastorPage> {
  
  @override
  Widget build(BuildContext context) {
    return PageTemplate.t( this,
        content: getContent() );
  }
  
  Widget getContent() {
    return  TextTemplate.t( "Empty page" );
  }
  
}
```

### Empty Screen

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/page/empty.png" height="300"/>

```
@override
Widget build(BuildContext context) {
return PageTemplate.t( this,
content: getContent() );
}
```

### Toolbar Custom Shape

Create any shape of Toolbar you want in Custom shape then put it at page template by using parameter "toolbar"

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/page/toolbar_fastor.png" height="300"/>

```
  @override
  Widget build(BuildContext context) {
    return PageTemplate.t( this,
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
    return PageTemplate.t( this,
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
    return PageTemplate.t( this,
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
    return PageTemplate.t( this,

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
    return PageTemplate.t( this,
 
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
    return PageTemplate.t( this,
 
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
<hr  style="border-top: 3px solid; ">

## Language

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
<hr  style="border-top: 3px solid; ">

# At The End

## About Developer

```

• 7 Years of experience build +20 App.
• Mobile Developer: Flutter & Native Android IOS.
• Skills: Dart, Java, Kotlin, Swift UIKit, SwiftUI
• OCA, Oracle Certified Associate.
- Follow my Project on Instagram :

```

[Instagram](https://instagram.com/abdallahandroid)

## How to contribute

Want to contribute to the project? We will be proud to highlight you as one of our collaborators. Here are some points where you can contribute and make Fastor (and Flutter) even better.

Write articles or make videos teaching how to use Fastor (they will be inserted in the Readme and in the future in our Wiki).
Offering PRs for code/tests.
Including new functions.
Any contribution is welcome!

Contact for contribute:
abdallah.android.app@gmail.com

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
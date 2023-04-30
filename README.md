# Features

* Helping make coding faster.
* Rapid, scalable development and clean design.
* Increase reliable.
* Enables developer to build, organize, deliver, and modify different content of generic items.

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

[Page Shapes](https://github.com/AbdallahAndroid/fastor_app/blob/master/tutorial/page/README_page.md)

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/page/thump.png" height="300"/>

[TextView](https://github.com/AbdallahAndroid/fastor_app/tree/master/tutorial/textview)

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/textview/thump.png" height="300"/>

[Button](https://github.com/AbdallahAndroid/fastor_app/tree/master/tutorial/button)

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/button/thump.png" height="300"/>

[ImageView]()

[Row]()

[Column]()

[TextField]()

[CheckBox]()

[RadioButton]()

[Switch]()

[Calender]()

[Spinner]()

[ListView]()

[Table]()

## Tutorial : Page Shapes

### Get Start Full Example
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

## Empty Screen

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/page/empty.png" height="300"/>

```
@override
Widget build(BuildContext context) {
return PageTemplate.t( this,
content: getContent() );
}
```

## Toolbar Custom Shape

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

## Background Feature

### Asset

set Image png to background, to make all content scrolling while the background image still hold at background

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/tutorial/page/background_image.png" height="300"/>

### Asset with Opacity

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

### Custom Widget

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

## Navigation Bottom

## Custom Shape Navigation

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

## Change color

### Color of Home Buttons Android Device

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


### Color of Status Bar

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
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

[Tutorial](https://github.com/AbdallahAndroid/fastor_app/blob/master/tutorial/page/README_page.md)
<iframe src="https://github.com/AbdallahAndroid/fastor_app/blob/master/tutorial/page/README_page.md"
height="500" width="1500"
style="border:2px solid red;"></iframe>

<div>
  <iframe id="inlineFrameExample"
      title="Inline Frame Example"
      width="300"
      height="200"
      src="https://github.com/AbdallahAndroid/fastor_app/blob/master/tutorial/page/README_page.md">
  </iframe>
</div>


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
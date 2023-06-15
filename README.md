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

3- under MyApp() class write 
```
class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
     Fastor.initializeApp(context);     //init Fastor Plugin here
 }
```

## Reference 

### documentation

[https://pub.dev/documentation/fastor_app_ui_widget/latest/index.html](https://pub.dev/documentation/fastor_app_ui_widget/latest/index.html)

### tutorial source code

[https://github.com/AbdallahAndroid/fastor_app](https://github.com/AbdallahAndroid/fastor_app)

[//]: # (### Tutorial Youtube)

[//]: # ()
[//]: # ([https://www.youtube.com/playlist?list=PLStw2JQi0_9pHWMU83AWIYQyApfNnsr0T]&#40;https://www.youtube.com/playlist?list=PLStw2JQi0_9pHWMU83AWIYQyApfNnsr0T&#41;)

# Tutorial Content

## Content: Widget

<table>  
  <tr>  
    <td>  
      <a     href="https://pub.dev/packages/fastor_app_ui_widget#tutorial--pagefastor"  >Page Shapes  
      </a>   
    </td>  
    <td>  
      <a href="https://pub.dev/packages/fastor_app_ui_widget#tutorial--textfastor">TextView  
      </a>   
    </td>  
    <td>  
      <a href="https://pub.dev/packages/fastor_app_ui_widget#tutorial--buttonfastor">Button</a>   
    </td>  
    <td>  
      <a href="https://pub.dev/packages/fastor_app_ui_widget#tutorial--imagefastor">ImageView  
      </a>   
    </td>  
  </tr>  

  <tr>  
    <td>  
      <img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/lib/tutorial/page/thump.png" height="300"/>  
    </td>  
    <td>  
     <img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/lib/tutorial/textview/thump.png" height="300"/>  
    </td>  
    <td>  
     <img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/lib/tutorial/button/thump.png" height="300"/>  
    </td>  
    <td>  
     <img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/lib/tutorial/image/landscape.png" height="300"/>  
    </td>  
  </tr>  

  <tr>  
    <td>  
      <a href="https://pub.dev/packages/fastor_app_ui_widget#tutorial--rowfastor">Row</a>   
    </td>  
    <td>  
      <a href="https://pub.dev/packages/fastor_app_ui_widget#tutorial--columnfastor">Column</a>   
    </td>  
    <td>  
      <a href="https://pub.dev/packages/fastor_app_ui_widget#tutorial--textfieldfastor">TextField</a>   
    </td>  
    <td>  
      <a href="https://pub.dev/packages/fastor_app_ui_widget#tutorial--checkboxfastor">CheckboxFastor</a>   
    </td>  
  </tr>  

 <tr> 
    <td>
        <img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/lib/tutorial/row/scroll.png" height="300"/>  
    </td> 
     <td>
        <img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/lib/tutorial/column/thump.png" height="300"/>  
    </td> 
     <td>
        <img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/lib/tutorial/textfield/thump.png" height="300"/>  
    </td> 
     <td>
        <img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/lib/tutorial/checkbox/thump.png" height="300"/>  
    </td> 

</tr>
</table>

## Content: Other Fastor UI Widget

[SwitchFastor](https://pub.dev/packages/fastor_app_ui_widget#switchfastor)

[ScrollFastor](https://pub.dev/packages/fastor_app_ui_widget#scrollfastor)

## Content: Classes Helper

[NetworkManager](https://pub.dev/packages/fastor_app_ui_widget#networkmanager)

[Language](https://pub.dev/packages/fastor_app_ui_widget#languagetools)

[NavigationTools](https://pub.dev/packages/fastor_app_ui_widget#navigationtools)

[NavigationTools](https://pub.dev/packages/fastor_app_ui_widget#navigationtools)

[InternetTools](https://pub.dev/packages/fastor_app_ui_widget#internettools)

---

---

## Tutorial : PageFastor

### Scroll Screen

* Get ride of RenderFlex overflowed by pixels.

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/lib/tutorial/page/scroll.png" height="300"/>

* Simple Example Create "PageFastor"
```
@override
Widget build(BuildContext context) {
return PageFastor(this,
content: getContent() );
}
```

* Example For Content Long Data 
```
  Widget getContent() {
    return Column( children: getLongDataForTestScroll() ,);
  }

  List<Widget> getLongDataForTestScroll() {
    List<Widget> data = [];
    for (int i = 1; i <= 70; i++) {
      var w = TextFastor(
        "Get ride of RenderFlex, data number $i",
        fontSize: 15,
        width: 300,
        color: Colors.yellow,
        margin: EdgeInsets.all(5),
      );
      data.add(w);
    }
    return data;
  }
```


### Toolbar Custom Shape

Create any shape of Toolbar you want in Custom shape then put it at page template by using parameter "toolbar"

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/lib/tutorial/page/toolbar_fastor.png" height="300"/>

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

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/lib/tutorial/page/background_image.png" height="300"/>

#### Asset with Opacity

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/lib/tutorial/page/background_opacity.png" height="300"/>

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

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/lib/tutorial/page/background_custom.png" height="300"/>

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

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/lib/tutorial/page/navigation.png" height="300"/>

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
<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/lib/tutorial/page/color_home_1.png" height="300"/>
<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/lib/tutorial/page/color_home_2.png" height="300"/>
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
<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/lib/tutorial/page/color_statusbar_1.png" height="300"/>
<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/lib/tutorial/page/color_statusbar_2.png" height="300"/>
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

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/lib/tutorial/textview/text_compare.png"
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

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/lib/tutorial/textview/text_screen.png" height="300"/>


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

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/lib/tutorial/button/thump.png" height="300"/>

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


<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/lib/tutorial/image/landscape.png" height="300"/>

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

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/lib/tutorial/image/assets.png" height="300"/>

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
<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/lib/tutorial/image/responsive_web.png" height="300"/>

#### Screen Size : Website Browser Mobile Chrome
<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/lib/tutorial/image/responsive_browser_mobile_screen.png" height="300"/>

#### Screen Size : Android Mobile
<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/lib/tutorial/image/responsive_mobile.png" height="300"/>

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

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/lib/tutorial/row/scroll.png"
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

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/lib/tutorial/column/thump.png"
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

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/lib/tutorial/textfield/thump.png"
height="300"/>

#### Tutorial : Without Use Any State Management 
* use "setState()"
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

#### Tutorial : Use State Management Type "Cubit" like using "BLoc"

* Using "Cubit" it similar as Using "BLoc"

* Create Cubit
```

class AuthCubit extends Cubit<AuthState> {
  final LogInUseCase logInUseCase;

  AuthCubit( ) : super(AuthInitialState()) {}

  static AuthCubit get(context) => BlocProvider.of(context);

  AuthResponse authResponse = AuthResponse();

  Future login(String email_txt, String pass_txt) async {
    //....
  }
  
  void resetError() {
    emit( AuthInitialState() );
  }
 
}
```

* Create Cubit State
```
abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState  { 
//.....
}

class AuthErrorState extends AuthState
{
 //.....
}

```


* Declare Variable at class
```

  AuthState? stateCurrent;
  
  var emailValid = AutovalidateMode.disabled;
  var emailController = TextEditingController();

  var passValid = AutovalidateMode.disabled;
  var passController = TextEditingController();
```

* This Way You Can Set Error Message To UI
```

  void setErrorToInputFields() {
    //email
    if (ToolsValidation.isEmail(emailController.text) == false) {
      Log.i("missed email");
      emailValid = AutovalidateMode.always;
    }
    //pass
    if (ToolsValidation.isPasswordValid(passController.text) == false) {
      Log.i("missed pass");
      passValid = AutovalidateMode.always;
    }
  }

```

* Listener Cubit State
```
 
  Widget getContent() {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        stateCurrent = state;

        if (state is AuthSuccessState) {
          RouterPage.home(context);
        }
      },
      builder: (context, state) {


        if (state is AuthErrorState) {
          setErrorToInputFields();
          printMessageError();
        }

        return  Column(children: [
              tfEmail(),
              tfPass(),
        ]);
    );
  }
 
```
 
* Create Widget TextFieldFastor
```

  Widget tfEmail() {
    return TextFieldFastor(
        hint_text: "Email",
        controller: emailController,
        autovalidateMode: emailValid,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(5),
        background_color: Colors.white,
        validator: ValidatorTemplate.email(),
        keyboardType: TextInputType.emailAddress,
        onChanged: (s) {
          // Log.i("tfEmail() - change s: $s ");

          bool isNotInit = stateCurrent! is AuthInitialState;
          if (isNotInit) {
            AuthCubit.get(context).resetError();
          }
        });
  }

  Widget tfPass() {
    return TextFieldFastor(
        hint_text: "Password",
        controller: passController,
        autovalidateMode: passValid,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(5),
        background_color: Colors.white,
        validator: ValidatorTemplate.pass(),
        keyboardType: TextInputType.number,
        onChanged: (s) {
          // Log.i("tf_pass() - change s: $s ");
        });
  }

```

### Class Utils For TextField
* class ValidatorTemplate : This have methods utils used at parameter "validator"

### Class "TextFieldBackendErrorFastor" :

* This Class used for handle error from backend for every input fields.
* Example error array backend response :
```
{
    "errors": {
        "email": [
            "The email provided is incorrect."
        ]
    }
}
```

#### Handle Error Array

* We need in UI to handle every error array and to show to message error under every textfields

* Example :
```
return TextFieldFastor(
        hint_text: "Email",
        controller: emailController,
        autovalidateMode: emailValid,
        validatorCustom: ValidatorTemplate.email(),
        errorBackendJson: errorState?.errors,
        errorBackendKeyJson:  "email",
        // errorBackendKeyJson2:  "role",
        margin: EdgeInsets.only(top: 10),
        padding:  EdgeInsets.all(5),
        background_color: Colors.white,
        keyboardType: TextInputType.emailAddress,
        onChanged: (s) {
        // Log.i("tfEmail() - change s: $s ");

        bool isNotInit = stateCurrent! is AuthInitialState;
        if (isNotInit) {
        AuthCubit.get(context).resetError();
        }
        });

```

---

---

## Tutorial : CheckboxFastor

### Feature Fastor
+ set color from constructor for active/inactive: color_inactive, color_active
+ Set Text Style : color, font size, weight.
+ Remove default padding found when use normal checkbox widget.

### Get Start

<img src="https://raw.githubusercontent.com/AbdallahAndroid/fastor_app/master/lib/tutorial/checkbox/thump.png"
height="300"/>

#### Simple Example
* Create Variable at class
```
  bool isAgree = false;
```

* Create Widget

```
    return CheckboxFastor( context: context, value: isAgree,
        margin: EdgeInsets.only(top: 10),
        text: "Are you agree to terms and condition.",
        text_color: Colors.brown,
        text_dimen: 20,
        color_inactive : Colors.brown,
        color_active: Colors.green,
        onChanged:  (updatedValue) {
          setState(() {
            isAgree = updatedValue!;
          });
        }
    );
```
 
---

---
 
## SwitchFastor

* Feature Padding, Margin.
* Feature send "TextStyle" in parameter constructor.
* Feature Color action active and dis-active in parameter constructor.


### Example Using with "Cubit" StateManagment

* ui :
```
  Widget _switchVipButton(){
    return SwitchFastor(defaultValue: cubit!.createReservation.isVip,
        onChange: (updateStatus){
      Log.i( "_switchVipButton() updateStatus: $updateStatus");
      cubit!.switchVipStatus(updateStatus);
    });
  }
```


* Save the last updated status of change in variable
- when calling 
```agsl
cubit!.createReservation.isVip
```

it just boolean varaible to carry data of switch status
```
  bool isVip = false;
```

* create new state for class Cubit state
```
class ReservationCreateVipStatusChangeState extends ReservationState {}
```

* call the change of switch value by calling "State Cubit" 
```
  void switchVipStatus(bool updateStatus) {
    createReservation.isVip = updateStatus;

    emit(ReservationCreateVipStatusChangeState());
  }

```

---

---

# ScrollFastor

### Example 
```


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  createUI() 
    );
  }
 
  Widget createUI() {

    var scrollPage =  ScrollFastor(   child:  contentFormColumn() );

    var cont =  Container(
      padding: EdgeInsets.only(top: ToolbarCustom.heigh),
      margin:  EdgeInsets.only(   left: 16, right: 16, bottom: 16),
      child: scrollPage ,
    );
 
    return Stack(
      children: [
        cont,

        ToolbarCustom(pageContext: context, title:  "Add Reservation"),
 
      ],
    );
  }

  Widget contentFormColumn(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
 
        Text("input field 1"),
        Text("input field 2"),
        Text("input field 3"),
        Text("input field 4"),
        Text("input field 5"),
        Text("input field 6"),
        Text("input field 7"),
      ],
    );
  }

```

---

---

# Helper Classes

## NetworkManager

---

### Feature 

* Fix Error "XMLHttpRequest" found in platform Web.
* Feature "CallBack()" return value like interface.
* Feature NetworkType.file : to upload file in all platform( Android/IPhone/Web).
* Class "NetworkHeaderTools" to generate "bearerToken()" and "basicAuth_usernameAndPassword()" easily.

### Simple Example
* There is many steps to call API, you need to prepare: Body, Url, Header, token.
* Here is guide

#### 1- Generate Body

```
    Map<String, dynamic> bodyParameter = Map();
    bodyParameter[ "payment_method"] =  "cash";
    bodyParameter[ "price"] = "123";
```


### 2- Call Class "NetworkManagerDio.dart"
We will return the response in format JSON
```
      Response response = await NetworkManagerDio().post( url , body: bodyParameter   );
      if (response.statusCode == 200) {
        var result = CityResponse.fromJson( response.data);
          return result;
      } 

```

 

###  NetworkType

```
NetworkManagerDio().get();
NetworkManagerDio().post();
NetworkManagerDio().put();
NetworkManagerDio().delete();
NetworkManagerDio().file();
```
#### Enum of Network type
``` 
enum NetworkTypeDio{
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

    NetworkManagerDio().file(urlApiLink,
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

## NavigationTools

+ add class "NavigationTools" for push() or pushAndRemove() or pushWithResumeLifecycle()

```

class NavigationTools {


  //---------------------------------------------------------------------- tools general

  static void push(BuildContext context, Widget page ) {
    var materialPageRoute = MaterialPageRoute(builder: (context) => page);
    Navigator.push(context ,  materialPageRoute  );
  }

  /**
   * this make librasry "need_resume" working with push to next page
   */
  static void pushResume(BuildContext context, Widget page, ResumableState resume ) {
    var materialPageRoute = MaterialPageRoute(builder: (context) => page);
    resume.push( context, materialPageRoute );
  }


  /**
   *  clearPrevious pages
   */
  static void pushAndRemoveUntil(BuildContext context, Widget page ) {
    var materialPageRoute = MaterialPageRoute(builder: (ctx) => page);
    Navigator.pushAndRemoveUntil(context, materialPageRoute, (e) => false);
  }


}
```


---

---

## InternetTools

+ add class "InternetTools" for check for internet connection.

```
 bool status = await InternetTools.isConnected();
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

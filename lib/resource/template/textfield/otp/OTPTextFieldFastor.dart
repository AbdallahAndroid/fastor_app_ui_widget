import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:fastor_app_ui_widget/resource/template/textfield/TextFieldTemplateBase.dart';
import 'package:flutter/material.dart';
import 'package:need_resume/need_resume.dart';
import 'TextFieldsOtp.dart';

class OTPTextFieldFastor extends StatefulWidget {

  int countNumber;

  //listener
  ValueChanged<String> onChangeCode;
  ValueChanged<bool> onComplete;

  //size
  double? widthOTP  ;
  double? heightByPadding  ;
  double? margin ;

  //color
  Color? colorText;
  Color? colorHint;
  String? fontFamily;
  double? fontSize;
  Decoration? decoration; //at the Container

  OTPTextFieldFastor( {
    required this.countNumber,
    required ValueChanged<String> this.onChangeCode,
    required ValueChanged<bool> this.onComplete,
    this.widthOTP,
    this.heightByPadding,
    this.margin,
    this.colorText,
    // this.colorHint,
    this.fontFamily,
    this.fontSize,
    this.decoration
  }) {
    widthOTP ??= 40;
    heightByPadding ??= 9;
    margin ??= 5;

    colorHint = colorText;
  }

  @override
  OTPFastorState createState() {
    return OTPFastorState( );
  }

}

class  OTPFastorState extends State<OTPTextFieldFastor> {


  //fields data
  var tf1_txt = "";
  var tf1_valid = AutovalidateMode.disabled;
  FocusNode tf1_node  = FocusNode();

  var tf2_txt = "";
  var tf2_valid = AutovalidateMode.disabled;
  FocusNode tf2_node  = FocusNode();

  var tf3_txt = "";
  var tf3_valid = AutovalidateMode.disabled;
  FocusNode tf3_node  = FocusNode();

  var tf4_txt = "";
  var tf4_valid = AutovalidateMode.disabled;
  FocusNode tf4_node  = FocusNode();

  var tf5_txt = "";
  var tf5_valid = AutovalidateMode.disabled;
  FocusNode tf5_node  = FocusNode();

  var tf6_txt = "";
  var tf6_valid = AutovalidateMode.disabled;
  FocusNode tf6_node  = FocusNode();

  //--------------------------------------------------------------------- build

  @override
  Widget build(BuildContext context) {
    // return Stack( children: [
    //   EmptyView.empty( DeviceTools.getWidth(context), 50 ),
    //
    //   Positioned(child: rowField(), left: getExtraSpaceAtLeft() )
    // ],);
    return rowField();
  }


  Widget rowField(){
    var row  =  RowTemplate.scroll( context,   [
      tf_1(),
      tf_2(),
      tf_3(),
      tf_4(),
      tf_5(),
      tf_6()
    ]
    );

    return row;
  }

  double getExtraSpaceAtLeft(){
    var total = DeviceTools.getWidth(context);
    var allExtraLeftAndRight =  total - sizeOfOTPSixFields();
    var left = allExtraLeftAndRight/2.0;
    // Log.i( "getExtraSpaceAtLeft() " + left.toString() );

    var frameParent = 10; //margin at frame
    return left - frameParent;
  }


  double sizeOfOTPSixFields() {
    // var marginOutSide = 20;
    var tf = widget.widthOTP! * 6;

    var result =  tf + widget.margin! * 5;
    //Log.i( "sizeOfOTPSixFields() " + result.toString() );
    return result;
  }

  //------------------------------------------------------------------------ updateCallBack

  Future updateCallBack() async {
    String pin = tf1_txt + tf2_txt + tf3_txt + tf4_txt + tf5_txt + tf6_txt;

    //change
    widget.onChangeCode(pin);

    //complete
    bool isComplete = pin.length == widget.countNumber;
    if( isComplete ) {
      //  Log.i( "updateCallBack() - pin: " + pin );
      widget.onComplete(true);
    }
  }
}

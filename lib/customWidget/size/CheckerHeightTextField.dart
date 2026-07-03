

import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:flutter/material.dart';

/**
 *
 How to use this class
    1- in build view of "TextField" call method "startCheckerHeightTextField() "

    void startCheckerHeightTextField() {
    checkerHeightTextField =  CheckerHeightTextField(
    txt: "",
    tf_frame_width: getWidthOfFrameTextField(),
    maxLine :4 ,
    margin : 14,
    callBackHeight: ( newHeight ) {

    //save to state                            //step 2 - update height of frame of container carry textfield
    chatMessageState.setState( (){

    InputMessageView.height_Frame = newHeight  ;
    });

    }
    );
    }


 */
class CheckerHeightTextField {

  String txt;
  double tf_frame_width;
  double? padding;
  double? margin;
  double? dimenFont;
  int? maxLine;
  double? minHeight;
  ValueChanged<double> callBackHeight;

  //result
  int linesExpected = 1;
  double heightFrameExpected = 40;

  double previousHeight = 40;

  CheckerHeightTextField({
    required this.txt,
    required this.tf_frame_width,
    required this.callBackHeight,
    this.padding,
    this.margin,
    this.dimenFont,
    this.maxLine,
    this.minHeight
  }){

    //set default
    dimenFont ??= 16;

    padding ??= 8;
  }


  Future updateText(String nexText )  async {
    //set value
    txt = nexText;

    //calculate again
    linesExpected = await  _linesCalculate() ;
    heightFrameExpected = await _heightOfFrameCalclate();

    //fix min height
    if( minHeight != null  && heightFrameExpected < minHeight! ) {
      heightFrameExpected = minHeight!;
    }

    //call back
    await callBackAfterValidateThereIsNewValue();

    //update previous
    previousHeight = heightFrameExpected;
  }


  Future callBackAfterValidateThereIsNewValue() async {

    //check there is no update to height
    if( previousHeight == heightFrameExpected ){
     // Log.i( "callBackValidate() - previousHeight == heightFrameExpected - stop!  ");
      return;
    }

    //now update
   Log.i( "callBackValidate() - result heightFrameExpected: " + heightFrameExpected.toString() );
    callBackHeight(heightFrameExpected);
  }


  Future<double> _heightOfFrameCalclate() async  {
    //calculate height
    double singleHeightPixelExpected = dimenFont! * 2;
    double heightFrameExpected = singleHeightPixelExpected * linesExpected;

    //add margin
    margin ??= 0;
    return heightFrameExpected + margin!;
  }


  Future <int> _linesCalculate() async {

    int lineExpected_roundToPlusOne = 1;


    //get data
    int lenChar = txt.length;
    double oneCharacterNeedPixel = 0.62 * dimenFont!;
    double needWidthFrame = oneCharacterNeedPixel * lenChar;
    double lineExpected_double = needWidthFrame/  tf_frame_width;

    //check fraction is 0.xxxx is not equal zero
    /**
        example:
        lineExpected_double is 2.5, means i need the result to be 3 lines not 2 lines

     */
    double fraction =  lineExpected_double -  lineExpected_double.truncate();
    if( fraction > 0 ) {
      lineExpected_roundToPlusOne = lineExpected_double.toInt() + 1;
    } else {
      lineExpected_roundToPlusOne =  lineExpected_double.toInt();
    }

    //log
    // Log.i( "_linesCalculate() - dimenFont: " + dimenFont.toString()  );
    // Log.i( "_linesCalculate() - lenChar: " + lenChar.toString()  );
    // Log.i( "_linesCalculate() - tf_frame_width: " + tf_frame_width.toString()  );
    // Log.i( "_linesCalculate() - oneCharacterNeedPixel: " + oneCharacterNeedPixel.toString()  );
    // Log.i( "_linesCalculate() - lineExpected_double: " + lineExpected_double.toString()  );
    // Log.i( "_linesCalculate() - lineExpected_roundToPlusOne: " + lineExpected_roundToPlusOne.toString()  );

    //check max line
    if( maxLine != null  ){
      if( maxLine! < lineExpected_roundToPlusOne ) return maxLine!;
    }

    //check min is one
    if( lineExpected_roundToPlusOne < 1 ) {
      return 1;
    }

    return lineExpected_roundToPlusOne;
  }



}
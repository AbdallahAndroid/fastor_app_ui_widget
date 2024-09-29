
import 'package:fastor_app_ui_widget/core/KeyboardTools.dart';
import 'package:fastor_app_ui_widget/core/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/lang/PositionedApp.dart';
import 'package:fastor_app_ui_widget/core/size/NotchBarSizeHelper.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/TextFieldOnCompleteController.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/regular/TextFieldApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {

  static double height = Figma.h( 70 ) ;

  BuildContext pageContext;
  String hint;
  ValueChanged<String>  onChanged;
  ValueChanged<String>  onCompleted;

  SearchAppBar( {
    required this.pageContext,
    required this.hint,
    required this.onChanged,
    required this.onCompleted
});

  @override
  State<SearchAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _CustomAppBarState extends State<SearchAppBar> {

  var searchController = TextEditingController();
  var onCompleteHandler = TextFieldOnCompleteController();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top:  NotchBarSizeHelper.getTop( widget.pageContext)),
      height:  SearchAppBar.height + NotchBarSizeHelper.getTop(context) ,
      width: DeviceTools.getWidth(context),
      child: containerAppbar()
    );
  }


  containerAppbar(){
    return Container(
      height: SearchAppBar.height,
      color: Colors.black,//ColorResource.appBarBackground,
      padding: EdgeInsets.symmetric(
          horizontal: 30, //DimensionResource.marginLeftRightScreen ,
          vertical: Figma.h(10 )
      ),
      child: textFieldCard(),
    );
  }


  textFieldCard(){
    return Container(
      decoration: BoarderHelper.cardView(
          radiusSize: 15,
          colorBackground: Colors.grey.withOpacity( 0.5),//ColorResource.textFieldBackground,
          colorLine: Colors.grey, //ColorResource.textFieldBoarderLineBeforeFocused
      ),
      child: iconAndInputField(),
    );
  }


  Widget iconAndInputField(){
    return Stack(children: [
      Container( child: textFieldSearch(), padding: EdgeInsets.symmetric(horizontal: Figma.w(16 )),),
      PositionedApp.langApp(child: iconSearch() , left: 0 )
    ],);
  }


  Widget textFieldSearch(){
    return TextFieldApp(
      // errorMessage: isStateTypeErrorSearchText() ?  (stateCubit as StoreSearchByTextErrorState).message : null ,
      showOutlineInput: false,
      fontSize: Figma.h(14 ),
      controller: searchController,
      // fontFamily: FontResource.regular,
      hint_text: widget.hint,
      isRemoveUnderline: true,
      // hint_color: ColorResource.textFieldHint,
      // text_color: ColorResource.textFieldText,
      textInputAction: TextInputAction.search,
      padding: EdgeInsets.only(
          top: Figma.h( 12 ),
          left: Figma.w( 20 ),
          right: Figma.w( 20 ),
          bottom: Figma.h( 11 )
      ),
      onChanged: (s){
        widget.onChanged( searchController.text);
        onChangeHappenedOrOnSubmitButtonClicked(searchController.text);
      },
    );
  }


  Widget iconSearch(){
    return GestureDetector(
      onTap: (){
        KeyboardTools.dismiss(context);
        // cubit!.clickOnSearchByTextStores(   );
        widget.onChanged( searchController.text);
        onChangeHappenedOrOnSubmitButtonClicked(searchController.text);
      },
      child:  Container(
        margin: EdgeInsets.only(bottom: 10),
        color: Colors.transparent,
        padding: EdgeInsets.all( 10 ),
        child: LangApp.rotateImageOrIcon(Icon(
          CupertinoIcons.search,
          color: Colors.black, //ColorResource.textFieldIcon,
          size: Figma.h(25),
        )) ,
      ),
    );
  }

  //---------------------------------------------

  onChangeHappenedOrOnSubmitButtonClicked(String s ) {
    onCompleteHandler.onChange(s,  callback: (textWritten) {
      widget.onCompleted(textWritten);
    });
  }



}
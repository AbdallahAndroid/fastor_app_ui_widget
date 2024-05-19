


import 'package:flutter/material.dart';




/// circle image view
class ImageCircleView extends StatefulWidget {

  late AssetImage image;
  late ValueChanged<ImageCircleViewState> changeSate;
  late double size ;


  ImageCircleView(  {
    required AssetImage image,
    required double size ,
    required ValueChanged<ImageCircleViewState> changeSate  }) {

    //set
      this.image = image;
      this.size = size;
      this.changeSate = changeSate;
  }


  @override
  // ignore: no_logic_in_create_state
  ImageCircleViewState createState() {
   var state = ImageCircleViewState( image, size);
   changeSate(state);
   return state;
  }

}

class ImageCircleViewState extends State<ImageCircleView> {

  //----------------------------------------------------------------------- variable

  double size ;
  var boarderLineWidth = 2;

  AssetImage imagePlaceHolder;
  Image? updateImage;

  ImageCircleViewState( this.imagePlaceHolder, this.size   );

  //----------------------------------------------------------------------- public

  void setImage(Image update ) {
   // Log.i( "setImage() update: " + update.image.toString() );
    setState(() {
      this.updateImage = update;
    });
  }

  //----------------------------------------------------------------------- build

  @override
  Widget build(BuildContext context) {
    return circleImage();
  }


  Widget circleImage() {

    var image = chooseChild();

    var ct = Container(
        child: image,
        alignment: Alignment.center,
        width: size,
        height: size,
        // padding: EdgeInsets.all(5 ), //boarder width
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: DSColor.image_circle,

        )

    );

    return ct;
    // return Expanded(child: ct);
  }


  Widget chooseChild(){
   // Log.i( "chooseChild() - updateImage: " + updateImage.toString( ));

    if( updateImage != null ) {
      // type place holder
      var avatar = CircleAvatar(
        foregroundImage: updateImage!.image,

        radius: (size/2) - boarderLineWidth,
      );

      return avatar;

    } else {
      // type place holder
      var avatar = CircleAvatar(
        backgroundImage:   imagePlaceHolder,
        radius: (size/2) - boarderLineWidth,
      );

      return avatar;
    }
  }

}
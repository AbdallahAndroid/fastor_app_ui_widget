import 'package:carousel_slider/carousel_slider.dart';
import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/log/Log.dart';
import 'package:fastor_app_ui_widget/customWidget/image/slider/ItemBoarder.dart';
import 'package:fastor_app_ui_widget/customWidget/image/slider/ItemDicatorWidget.dart';

import 'package:flutter/material.dart';
class SliderImageProduct extends StatefulWidget {

  List<String>? images;

  SliderImageProduct( this.images );


  @override
  SliderImageProductState createState()  => SliderImageProductState();

}

class SliderImageProductState extends State<SliderImageProduct> {


  //indicator
  CarouselController carouselController = new  CarouselController() ;
  int currentIndicatorIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      imageSlider(),
      Positioned(child: indicatorBar(), left: 0,  right: 0, bottom: Figma.h( 10), ),
    ],);
  }

  //------------------------------------------------------- indicatorBar

  Widget indicatorBar(){
    int len = widget?.images?.length??0;
    if( len  <= 1 ) return Container();

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  _childrenIndicatorPointsWidget()
    );
  }


  List<Widget> _childrenIndicatorPointsWidget(){
    List<Widget> ls = [];
    int i = 0;
    widget.images?.forEach((element) {
      ls.add( itemIndicator( i) );
      i++;
    });
    return ls;
  }

  Widget itemIndicator(int indexOfPoint){
    bool isSelected = currentIndicatorIndex == indexOfPoint;
    return ItemDicatorWidget( isSelected );
  }

  //------------------------------------------------------- image slider

  imageSlider() {
    return CarouselSlider(
      carouselController: carouselController,
      options: CarouselOptions(
        height: Figma.h(285), // DeviceTools.getHeight(context),
        // aspectRatio: 16/9,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: false,
        reverse: false,
        autoPlay: true,
        // autoPlayInterval: Duration(seconds: 5 ),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
        enlargeCenterPage: false,  //shape enlarge the center of page while looping between screens
        onPageChanged: ( int index, CarouselPageChangedReason reason ){
          Log.i("imageSlider() - onPageChanged - index: $index");
          setState(() {
            currentIndicatorIndex = index;
          });
        },
      ),

      items:  _childrenSlider() ,
    );
  }

  List<Widget> _childrenSlider(){
    List<Widget> ls = [];
    int index = 0;
    widget?.images?.forEach((element) {
      ls.add( itemBoardImage(element, index));
      index = 1 + index;
    });
    return ls;
  }


  Widget itemBoardImage(String? imageUrl, int index) {
    return ItemBoarder(
      imageUrl: imageUrl,
      index: index,
    );
  }


}
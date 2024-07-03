import 'package:flutter/material.dart';


class RatingBarApp extends StatelessWidget {

  final double rating;
  final int starCount;
  double? sizeIcon;

  RatingBarApp({
    required this.rating,
    this.sizeIcon,
    this.starCount = 5});


  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];
    for (int i = 0; i < starCount; i++) {
      Icon icon;
      if (i < rating.floor()) {
        icon = Icon(Icons.star, color: Colors.amber, size: sizeIcon);
      } else if (i < rating && rating - i >= 0.5) {
        icon = Icon(Icons.star_half, color: Colors.amber, size: sizeIcon,);
      } else {
        icon = Icon(Icons.star_border, color: Colors.amber, size: sizeIcon);
      }
      stars.add(icon);
    }

    var rowStars = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: stars,
    );

    return Container(
      width: sizeIcon! * starCount,
      alignment: Alignment.centerLeft,
      // color: Colors.grey,
      child:  rowStars,
    );
  }

}
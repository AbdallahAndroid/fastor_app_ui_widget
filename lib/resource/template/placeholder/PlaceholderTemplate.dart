
import 'package:flutter/material.dart';

class PlaceholderTemplate {

  static Widget emptyView( {double? width, double? height}){

    height ??= 0;
    width ??= 0;

    return Placeholder(strokeWidth: 0, color: Colors.transparent , fallbackHeight: height, fallbackWidth: width );
  }

}
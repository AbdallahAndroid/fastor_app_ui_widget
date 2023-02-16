import 'package:flutter/material.dart';

class ShadowContainer extends StatelessWidget {
  ShadowContainer({

    this.margin = const EdgeInsets.fromLTRB(0, 10, 0, 8),
    this.padding = const EdgeInsets.symmetric(horizontal: 8),
    this.circular = 4,
    this.shadowColor = const Color.fromARGB(
        128, 158, 158, 158), //Colors.grey.withOpacity(0.5),
    this.backgroundColor = Colors.white,
    this.spreadRadius = 1,
    this.blurRadius = 3,
    this.offset = const Offset(0, 1),
    required this.child,
  }) ;

  final Widget child;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final double circular;
  final Color shadowColor;
  final double spreadRadius;
  final double blurRadius;
  final Offset offset;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(circular),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            spreadRadius: spreadRadius,
            blurRadius: blurRadius,
            offset: offset,
          ),
        ],
      ),
      child: child,
    );
  }
}
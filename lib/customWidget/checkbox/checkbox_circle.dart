import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:flutter/material.dart';

/// A circular checkbox widget with customizable size, colors, and inner icon padding.
class CheckboxCircle extends StatelessWidget {
  bool value;
  ValueChanged<bool>? onChanged;
  double size;
  double borderWidth;
  double iconPadding;
  Color? activeColor;
  Color inactiveColor;
  Color? borderColor;
  Color checkColor;
  IconData icon;

  CheckboxCircle({
    Key? key,
    required this.value,
    this.onChanged,
    this.size = 28,
    this.borderWidth = 1.5,
    this.iconPadding = 4,
    this.activeColor,
    this.inactiveColor = Colors.transparent,
    this.borderColor,
    this.checkColor = AppColors.white,
    this.icon = Icons.check,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final resolvedActiveColor = activeColor ?? AppColors.primary;
    final resolvedBorderColor = borderColor ?? AppColors.primary;

    return GestureDetector(
      onTap: onChanged != null ? () => onChanged!(!value) : null,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: value ? resolvedActiveColor : inactiveColor,
          border: Border.all(
            color: resolvedBorderColor,
            width: borderWidth,
          ),
        ),
        padding: EdgeInsets.all(iconPadding),
        child: value
            ? FittedBox(
                child: Icon(
                  icon,
                  color: checkColor,
                ),
              )
            : null,
      ),
    );
  }
}

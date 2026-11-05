import 'package:country_code_picker/country_code_picker.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:flutter/material.dart';


/// Static Saudi Arabia flag, shown in place of the location pin (Figma).
///
/// Uses the flag image bundled with `country_code_picker`, so no new asset
/// has to be added to the app.
class CountryCodePackageFlagIcon extends StatelessWidget {

   String countryCode; // example "SA"

   double size;

  String _flagUri = ""; //

  CountryCodePackageFlagIcon({super.key, required this.countryCode, this.size = 14}) {
    _flagUri = CountryCode.fromCountryCode('SA').flagUri!;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.r),
      child: Image.asset(
        _flagUri,
        package: 'country_code_picker',
        width: size.w,
        height: size.h,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            SizedBox(width: size.w, height: size.h),
      ),
    );
  }
}

import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';


import 'package:timezone_to_country/timezone_to_country.dart';
import 'package:country_dial_code/country_dial_code.dart';

class ZoneTools {

  static Future<String> getCountryISOCode( ) async {
    String code = await TimeZoneToCountry.getLocalCountryCode();
    return code; // 'KR'
  }


  static Future<String> getZoneCountryDialCode(String defaultCountryDial) async {
    if( DeviceTools.isPlatformWeb() ) {
      return defaultCountryDial;
    }

    final isoName = await getCountryISOCode(); //example: "US"
    final countryDial = await CountryDialCode.fromCountryCode(isoName);
    return countryDial.dialCode;
  }



}

/**  -------- not return right value
 *
    static Future<String> getZoneCountryDialCode(String defaultWeb) async {
    if( DeviceTools.isPlatformWeb() ) {
    return defaultWeb;
    }

    await CountryCodes.init(); // Optionally, you may provide a `Locale` to get countrie's localizadName
    final CountryDetails details = CountryCodes.detailsForLocale();
    Log.i( "ZoneTools - getZoneCountryDialCode() - details: " + details.alpha2Code.toString() );
    return details.dialCode.toString(); // Displays the dial code, for example +1.
    }

    static String getCountryISOCode_1() {
    final WidgetsBinding? instance = WidgetsBinding.instance;
    if (instance != null) {
    final List<Locale> systemLocales = instance.window.locales;
    String? isoCountryCode = systemLocales.first.countryCode;
    if (isoCountryCode != null) {
    return isoCountryCode;
    } else {
    throw ("Unable to get Country ISO code");
    }
    } else {
    throw ("Unable to get Country ISO code");
    }
    }


    static String getCountryISOCode_2(BuildContext context){
    Locale myLocale = Localizations.localeOf(context);
    return myLocale.countryCode.toString();
    }
 */




import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class IntentTools {



  static Future call(String? phone ) async {
    if(phone != null ) {
      return ;
    }

    String link = "tel://$phone"  ;
    Uri uri = Uri.parse( link );
    var status = await launchUrl(uri );
    return status;
  }


  static Future mailTo(String? emailTo, String subject, String body ) async {
    if( emailTo == null ) {
      return;
    }

    //mailto:smith@example.org?subject=News&body=New%20plugin
    Log.i("mailTo() - eamilTo: $mailTo");
    final Uri emailUri = Uri(
        scheme: 'mailto', path: emailTo, query: "subject=$subject&body=$body");

    String removeSpace = emailUri
        .toString()
        .replaceAll("+", "%20")
        .replaceAll("%2520", "%20");

    await launch(removeSpace.toString());
  }

  static Future map(double latitude, double longitude) async {
    final String query = '$latitude,$longitude';
    final String url = 'geo:$query';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not open the map.';
    }
  }


  static Future<void> mapNavigation(double lat, double lng) async {
    final Uri googleMapUrl = Uri.parse('google.navigation:q=$lat,$lng&mode=d');

    if (await canLaunchUrl(googleMapUrl)) {
      await launchUrl(googleMapUrl);
    } else {
      final String query = '$lat,$lng';
      final String url = 'geo:$query';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not open the map.';
      }
    }
  }


  ///example https://maps.app.goo.gl/nb5VEMFTouFzMjU38
  static Future browser(BuildContext context, String link ) async {
    Log.i("browser() - link: $link");
    bool isValidHttp =   link.startsWith( "http" );
    if( isValidHttp == false  ) {
      // ToolsToast.top(context, "invalid link to can open browser".tra() );
      return;
    }

    final uri = Uri.parse(link);
    await launchUrl(uri);
  }




}
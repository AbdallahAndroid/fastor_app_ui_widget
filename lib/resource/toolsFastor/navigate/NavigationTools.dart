import 'package:flutter/material.dart';

import 'package:need_resume/need_resume.dart';




class NavigationTools {


  //---------------------------------------------------------------------- tools general

  static void push(BuildContext context, Widget page ) {
    var materialPageRoute = MaterialPageRoute(builder: (context) => page);
    Navigator.push(context ,  materialPageRoute  );
  }

  /**
   * this make librasry "need_resume" working with push to next page
   */
  static void pushResume(BuildContext context, Widget page, ResumableState resume ) {
    var materialPageRoute = MaterialPageRoute(builder: (context) => page);
    resume.push( context, materialPageRoute );
  }


  /**
   *  clearPrevious pages
   */
  static void pushAndRemoveUntil(BuildContext context, Widget page ) {
    var materialPageRoute = MaterialPageRoute(builder: (ctx) => page);
    Navigator.pushAndRemoveUntil(context, materialPageRoute, (e) => false);
  }


}
import 'package:flutter/material.dart';

import 'package:need_resume/need_resume.dart';




class NavigationTools {

  //---------------------------------------------------------------------- animation - fade

  static final _transitionsBuilderFade =  (context, animation, secondaryAnimation, child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  } ;

  static final _transitionDurationFade = Duration(milliseconds: 300);


  static void pushAnimateFade(BuildContext context, Widget page , ) {
    var materialPageRoute = PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder : _transitionsBuilderFade,
        transitionDuration : _transitionDurationFade
    );
    Navigator.push(context, materialPageRoute );
  }

  /**
   * this make librasry "need_resume" working with push to next page
   */
  static void pushResumeAnimateFade(BuildContext context, Widget page, ResumableState resume ) {
    var materialPageRoute = PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder : _transitionsBuilderFade,
        transitionDuration : _transitionDurationFade
    );
    resume.push(context, materialPageRoute );
    // resume.push( context, materialPageRoute );
  }


  /**
   *  clearPrevious pages
   */
  static void pushAndRemoveUntilAnimateFade(BuildContext context, Widget page ) {
    var materialPageRoute = PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder : _transitionsBuilderFade,
        transitionDuration : _transitionDurationFade
    );
    Navigator.pushAndRemoveUntil(context, materialPageRoute, (e) => false);
  }


  //---------------------------------------------------------------------- normal

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
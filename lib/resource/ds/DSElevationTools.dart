class DSMarginCalculator {

  /**
   * pages: the title "Feature" have list under it, the list have elevation.
   * i want to set margin bottom to title "Feature"
   *
   */
  static double getMarginAnotherHaveElevation(double spacelevel , double elevationLevel) {
    final result =  spacelevel - elevationLevel - elevationLevel;
    if( result < 0 ) {
      return 0;
    } else {
      return result;
    }
  }


  /**
   * case: the another view have corner only without elevation
   */
  static double getMarginAnotherHaveCornerOnly(double spacelevel , double cornerLevel) {
    final result =  spacelevel - cornerLevel;
    if( result < 0 ) {
      return 0;
    } else {
      return result;
    }
  }

}
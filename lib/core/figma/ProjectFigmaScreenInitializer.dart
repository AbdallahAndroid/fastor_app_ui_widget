
class ProjectFigmaScreenInitializer {

  static double batteryFigmaHeight = 14;
  static double figmaScreenWidth = 428; /// this width of figma when make arrow mouse object see lenght between arround objects
  static double figmaScreenHeight = 926 - ProjectFigmaScreenInitializer.batteryFigmaHeight; /// this height without status bar battery 772


  static void initAuthenticationScreenSize() {
    figmaScreenWidth = 428;
    figmaScreenHeight = 926;
  }


  static void initStoreScreenSize() {
    figmaScreenWidth = 380;
    figmaScreenHeight = 844;
  }



}
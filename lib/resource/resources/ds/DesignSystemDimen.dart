

/**
 * - copy this line to easy enter value:
    static var  = dimen();

 */
class DSDimen {


  /**
   * untill today not make any edition
   */
  static double designSystem(double d ) {
    return d;
  }

  //.............................................. toolbar

  static var toolbar_height = designSystem(70);
  static var toolbar_corner = designSystem(14);

  //.............................................. space between views

  static var space_parent = designSystem(30);
  static var space_level_1 = designSystem(24); //24
  static var space_level_2 = designSystem(20);
  static var space_level_3 = designSystem(14);
  static var space_level_3_div2 = designSystem(6);
  static var space_level_4 = designSystem(8);

  static var space_level_2_insideCorner = designSystem(16);

  static var space_level_2_paddingCornerVertical = designSystem(16);
  static var space_level_2_paddingCornerHorizontal = designSystem(8);

  //........................................................ text

  static var text_level_parent = designSystem(18);
  static var text_level_1 = designSystem(15);
  static var text_level_2 = designSystem(13);
  static var text_level_3 = designSystem(11);
  static var text_level_4 = designSystem(8);


  //.............................................. button

  static var button_height = designSystem(35);
  static var button_padding_vertical =text_level_4;
  static var button_padding_horizontal = text_level_3;

  //........................................................ textfield

  static var textfield_auto_padding = designSystem( 8);

  //........................................................ corner radius for layout

  static var ds_size_corner_level_1 = designSystem(50);
  static var ds_size_corner_level_2 = designSystem(10);
  static var ds_size_corner_level_3 = designSystem(5);
  static var ds_size_corner_level_4 = designSystem(1);

  //-------------------------------------------------------- elevation

  static var elevation_level_1 = designSystem(10);
  static var elevation_level_2 = designSystem(8);
  static var elevation_level_3 = designSystem(5);
  static var elevation_level_4 = designSystem(2);

//........................................................ corner radius for button

  static var ds_button_large_corner = designSystem(5);
  static var ds_button_small_corner = designSystem(1);

}
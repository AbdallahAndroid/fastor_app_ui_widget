import 'dart:typed_data';


import 'package:fastor_app_ui_widget/core/utils/figma/ProjectFigmaScreenInitializer.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class VideoThumpCacher {

  static Map< String , Uint8List> mapAllVideoUrlPreDownloaded = Map();

  static Future<Uint8List?> get({
    required String videoUrl,
    required double width,
    required double height,
  }) async {

    /// check already found
    if( mapAllVideoUrlPreDownloaded.containsKey( videoUrl ) ) {
      // Log.i("_generateThumbnail() - get from cache - videoUrl: $videoUrl ");
      return mapAllVideoUrlPreDownloaded[videoUrl];
    }

    /// download new url
    // Log.i("_generateThumbnail() - start");
    final uint8list = await VideoThumbnail.thumbnailData(
      video:  videoUrl,
      imageFormat: ImageFormat.PNG,
      maxWidth:  ProjectFigmaScreenInitializer.figmaScreenWidth.toInt(), //width.toInt(),
      // maxHeight: widget.height.toInt(), // add this to fetch all
      quality: 10,
    );
    // Log.i("_generateThumbnail() - end");
    if( uint8list!= null ) {
      mapAllVideoUrlPreDownloaded[videoUrl] = uint8list;
    }
    return uint8list;
  }

}
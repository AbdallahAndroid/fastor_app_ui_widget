/**
    final fileName = await VideoThumbnail.thumbnailFile(
    video: "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
    thumbnailPath: (await getTemporaryDirectory()).path,
    imageFormat: ImageFormat.WEBP,
    maxHeight: 64, // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
    quality: 75,
    );
 */

import 'dart:typed_data';

import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:flutter/material.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import 'video_thump_cacher.dart';

class VideoThumbWidget extends StatefulWidget {


  String videoUrl;
  double width;
  double height;
  BoxFit? fit;
  String? videoPlaceHolderImage;


  VideoThumbWidget({
    Key? key,
    required this.videoUrl,
    required this.width ,
    required this.height ,
    required this.videoPlaceHolderImage,
    this.fit  ,
  }) : super(key: key);

  @override
  State<VideoThumbWidget> createState() => _VideoThumbWidgetState();
}

class _VideoThumbWidgetState extends State<VideoThumbWidget> {


  Uint8List? _thumbnail;

  @override
  void initState() {
    super.initState();
    _generateThumbnail();
  }

  Future<void> _generateThumbnail() async {
    if(DeviceTools.isPlatformWeb() ) return;
    var uint8list = await VideoThumpCacher.get(
        videoUrl: widget.videoUrl,
        width: widget.width,
        height: widget.height
    );
    if (!mounted) return;
    setState(() {
      _thumbnail = uint8list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: widget.width,
      height: widget.height,
      alignment: Alignment.center,
      child: _thumbnail != null
          ? Image.memory(
        _thumbnail!,
        width: widget.width,
        height: widget.height,
        fit: widget.fit?? BoxFit.contain,
      ) : DeviceTools.isPlatformWeb() ? Container():   progressOrPlaceHolderShape(),
    );
  }

  progressOrPlaceHolderShape() {
    // return Container(
      // child: Stack(
      //   children: [
      //
      //     /// image
      //     ImagePlaceHolder(
      //       width: widget.width,
      //       height: widget.height,
      //       urlBackground: widget.videoPlaceHolderImage,
      //     ),
      //
      //     /// shadow
      //     Container(
      //       width: widget.width,
      //       height: widget.height,
      //       color: AppColor.videoBackgroundPlaceHolder.withOpacity(0.5 ),
      //     )
      //   ],
      // ),
    // ) ;
    return SizedBox();
    // return Center(child: CircularProgressIndicator(color: AppColor.white,));
  }
}

import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:cross_file/cross_file.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';

class ImageFileApp extends StatefulWidget {

  XFile? xFile;
  double width;
  double height;


  ImageFileApp({
    required this.xFile,
    required this.width,
    required this.height
  });


  @override
  ImageFileAppState createState() => ImageFileAppState();
}


class ImageFileAppState extends State<ImageFileApp> {

  Uint8List? _webImage; // for web

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback( (t) async {
      if( widget.xFile != null ) {
        final bytes = await widget.xFile?.readAsBytes();
        setState(() {
          _webImage = bytes;
        });
      }

    });
  }

  @override
  Widget build(BuildContext context) {

    /// empty
    if( widget.xFile == null ) {
      return SizedBox(
        width: widget.width,
        height: widget.height,
      );
    }

    /// web
    if(DeviceTools.isPlatformWeb() && _webImage != null ) {
      return Image.memory(_webImage! ,
        width: widget.width,
        height: widget.height,
        fit: BoxFit.cover,
      );
    } else if( DeviceTools.isPlatformWeb() ) {
      return SizedBox(
        width: widget.width,
        height: widget.height,
      );
    }

    return Image.file(
      File(widget.xFile!.path),
      width: widget.width,
      height: widget.height,
      fit: BoxFit.cover,
    );
  }
}
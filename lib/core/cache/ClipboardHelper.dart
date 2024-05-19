
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//------------------------------------------------------------------------ widget

class ClipboardText extends StatelessWidget {
  ClipboardText(this.data);

  final String data;

  @override
  Widget build(BuildContext context) {
    var tapWidget =  InkWell(
      child: Text(data),
      onTap: () async {
        await Clipboard.setData(ClipboardData(text: data));
      },
    );

    return Material(child: tapWidget );
  }
}

//------------------------------------------------------------------------ background

class ClipboardHelper {

  static Future save(String valueToSave ) async {

   // await Clipboard.setData(ClipboardData(text: valueToSave ));
    await FlutterClipboard.copy( valueToSave);
  }

  static Future<String> get() async{
    String v = await FlutterClipboard.paste().then((value) {
      //Log.i('ClipboardTools - get() - value: ' + value );
      return value;
    });
    return v;
  }

}
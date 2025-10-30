class SqlJsonHelper {
  /**
      // Handle nfc - could be JSON string or array
      if (json['nfc'] != null) {
      model.nfc = <NfcModel>[];
      if (json['nfc'] is String) {
      try {
      final decodedNfc = jsonDecode(json['nfc']) as List;
      for (final v in decodedNfc) {
      model.nfc.add(NfcModel.fromJson(v));
      }
      } catch (e) {
      // If decoding fails, keep empty list
      }
      } else {
      json['nfc'].forEach((v) {
      model.nfc.add(NfcModel.fromJson(v));
      });
      }
      }
   */

  // static String toJsonString(Map<String, dynamic> map) {
  //   return map.entries
  //       .map((entry) =>
  //           '"${entry.key}":${entry.value is String ? '"${entry.value}"' : entry.value}')
  //       .join(',');
  // }
  //
  //
  // static Map<String, dynamic> fromJsonString(String jsonString) {
  //   final Map<String, dynamic> result = {};
  //   final entries = jsonString.split(',');
  //   for (var entry in entries) {
  //     final keyValue = entry.split(':');
  //     if (keyValue.length == 2) {
  //       final key = keyValue[0].replaceAll('"', '').trim();
  //       final value = keyValue[1].trim();
  //       if (value.startsWith('"') && value.endsWith('"')) {
  //         result[key] = value.replaceAll('"', '');
  //       } else if (value == 'null') {
  //         result[key] = null;
  //       } else if (value == 'true' || value == 'false') {
  //         result[key] = value == 'true';
  //       } else if (value.contains('.')) {
  //         result[key] = double.tryParse(value) ?? value;
  //       } else {
  //         result[key] = int.tryParse(value) ?? value;
  //       }
  //     }
  //   }
  //   return result;
  // }
}

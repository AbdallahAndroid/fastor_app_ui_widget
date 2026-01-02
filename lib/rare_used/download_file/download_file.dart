//
// import 'dart:io';
//
// import 'package:aqar_super/core/lang/LangApp.dart';
// import 'package:aqar_super/core/utils/device/DeviceTools.dart';
// import 'package:aqar_super/core/utils/log/Log.dart';
// import 'package:aqar_super/core/values/ToolsValidation.dart';
// import 'package:aqar_super/customWidget/toast/ToolsToast.dart';
// import 'package:flutter/material.dart';
//
// import 'package:url_launcher/url_launcher.dart';
// import 'package:dio/dio.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:open_file/open_file.dart';
// import 'package:device_info_plus/device_info_plus.dart';
//
// class DownloadFileIntentTools {
//
//
//
//   /// Download file from URL and save it to device storage
//   /// Supports: Android, iOS, and Web platforms
//   /// File types: Images (PNG, JPG), PDFs, and other documents
//   static Future<void> downloadFile(BuildContext context, String? url) async {
//     if (url == null || url.isEmpty) {
//       ToolsToast.bottom(context, "Invalid URL".tr());
//       return;
//     }
//
//     try {
//       Log.i("DownloadFile.download() - url: $url");
//
//       // Get file name from URL
//       String fileName = url.split('/').last;
//
//       // For web platform, just open in browser
//       if (DeviceTools.isPlatformWeb()) {
//         final uri = Uri.parse(url);
//         await launchUrl(uri, mode: LaunchMode.externalApplication);
//         return;
//       }
//
//       // Request storage permission for Android
//       if (Platform.isAndroid) {
//         bool permissionGranted = await _requestAndroidPermission(context);
//         if (!permissionGranted) return;
//       }
//
//       // Request photo library permission for iOS
//       if (Platform.isIOS) {
//         bool permissionGranted = await _requestIOSPermission(context);
//         if (!permissionGranted) return;
//       }
//
//       // Get download directory based on platform
//       Directory? directory = await _getDownloadDirectory();
//
//       if (directory == null) {
//         ToolsToast.bottom(context, "Cannot access storage".tr());
//         return;
//       }
//
//       String savePath = '${directory.path}/$fileName';
//
//       // Show downloading toast
//       ToolsToast.bottom(context, "Downloading...".tr());
//
//       // Download file using Dio
//       await _downloadFileWithDio(url, savePath);
//
//       Log.i("DownloadFile.download() - saved to: $savePath");
//
//       // Show success message
//       ToolsToast.bottom(context, "File downloaded successfully".tr());
//
//       // Open file automatically
//       await _openFile(savePath);
//
//     } catch (e) {
//       Log.e("DownloadFile.download() - error: $e");
//       ToolsToast.bottom(context, "Download failed".tr());
//     }
//   }
//
//   /// Request storage permission for Android devices
//   static Future<bool> _requestAndroidPermission(BuildContext context) async {
//     try {
//       DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//       AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//
//       if (androidInfo.version.sdkInt >= 33) {
//         // Android 13+ (API 33+) - need photos/videos permission
//         var status = await Permission.photos.request();
//         if (!status.isGranted) {
//           ToolsToast.bottom(context, "Storage permission denied".tr());
//           return false;
//         }
//       } else {
//         // Below Android 13 - need storage permission
//         var status = await Permission.storage.request();
//         if (!status.isGranted) {
//           ToolsToast.bottom(context, "Storage permission denied".tr());
//           return false;
//         }
//       }
//       return true;
//     } catch (e) {
//       Log.e("DownloadFile._requestAndroidPermission() - error: $e");
//       return false;
//     }
//   }
//
//   /// Request photo library permission for iOS devices
//   static Future<bool> _requestIOSPermission(BuildContext context) async {
//     try {
//       var status = await Permission.photos.request();
//       if (!status.isGranted) {
//         ToolsToast.bottom(context, "Photo library permission denied".tr());
//         return false;
//       }
//       return true;
//     } catch (e) {
//       Log.e("DownloadFile._requestIOSPermission() - error: $e");
//       return false;
//     }
//   }
//
//   /// Get appropriate download directory based on platform
//   static Future<Directory?> _getDownloadDirectory() async {
//     try {
//       if (Platform.isAndroid) {
//         return await getExternalStorageDirectory();
//       } else if (Platform.isIOS) {
//         return await getApplicationDocumentsDirectory();
//       } else {
//         return await getDownloadsDirectory();
//       }
//     } catch (e) {
//       Log.e("DownloadFile._getDownloadDirectory() - error: $e");
//       return null;
//     }
//   }
//
//   /// Download file using Dio with progress tracking
//   static Future<void> _downloadFileWithDio(String url, String savePath) async {
//     Dio dio = Dio();
//     await dio.download(
//       url,
//       savePath,
//       onReceiveProgress: (received, total) {
//         if (total != -1) {
//           int progress = ((received / total) * 100).toInt();
//           Log.i("Download progress: $progress%");
//         }
//       },
//     );
//   }
//
//   /// Open downloaded file with default app
//   static Future<void> _openFile(String filePath) async {
//     try {
//       final result = await OpenFile.open(filePath);
//       if (result.type != ResultType.done) {
//         Log.e("DownloadFile._openFile() - Cannot open file: ${result.message}");
//       }
//     } catch (e) {
//       Log.e("DownloadFile._openFile() - error: $e");
//     }
//   }
//
//   /// Download file without automatically opening it
//   static Future<String?> downloadOnly(BuildContext context, String? url) async {
//     if (url == null || url.isEmpty) {
//       ToolsToast.bottom(context, "Invalid URL".tr());
//       return null;
//     }
//
//     try {
//       Log.i("DownloadFile.downloadOnly() - url: $url");
//
//       String fileName = url.split('/').last;
//
//       if (DeviceTools.isPlatformWeb()) {
//         ToolsToast.bottom(context, "Download only mode not supported on web".tr());
//         return null;
//       }
//
//       // Request permissions
//       if (Platform.isAndroid) {
//         bool permissionGranted = await _requestAndroidPermission(context);
//         if (!permissionGranted) return null;
//       }
//
//       if (Platform.isIOS) {
//         bool permissionGranted = await _requestIOSPermission(context);
//         if (!permissionGranted) return null;
//       }
//
//       Directory? directory = await _getDownloadDirectory();
//
//       if (directory == null) {
//         ToolsToast.bottom(context, "Cannot access storage".tr());
//         return null;
//       }
//
//       String savePath = '${directory.path}/$fileName';
//
//       ToolsToast.bottom(context, "Downloading...".tr());
//
//       await _downloadFileWithDio(url, savePath);
//
//       Log.i("DownloadFile.downloadOnly() - saved to: $savePath");
//
//       ToolsToast.bottom(context, "File downloaded successfully".tr());
//
//       return savePath;
//
//     } catch (e) {
//       Log.e("DownloadFile.downloadOnly() - error: $e");
//       ToolsToast.bottom(context, "Download failed".tr());
//       return null;
//     }
//   }
//
//   /// Check if file exists at the given path
//   static Future<bool> fileExists(String filePath) async {
//     try {
//       File file = File(filePath);
//       return await file.exists();
//     } catch (e) {
//       Log.e("DownloadFile.fileExists() - error: $e");
//       return false;
//     }
//   }
//
//   /// Delete file at the given path
//   static Future<bool> deleteFile(String filePath) async {
//     try {
//       File file = File(filePath);
//       if (await file.exists()) {
//         await file.delete();
//         Log.i("DownloadFile.deleteFile() - deleted: $filePath");
//         return true;
//       }
//       return false;
//     } catch (e) {
//       Log.e("DownloadFile.deleteFile() - error: $e");
//       return false;
//     }
//   }
//
//
//   ///------------------------------------------------------------------------------ old methods
//
//   /**
//    * working in oppo android phone succesfully for pdf/png
//    */
//   static Future downloadFileAndroidOnly(BuildContext context, String? url) async {
//     if (url == null || url.isEmpty) {
//       ToolsToast.bottom(context, "Invalid URL".tr());
//       return;
//     }
//
//     try {
//       Log.i("downloadFile() - url: $url");
//
//       // Get file name
//       String fileName = url.split('/').last;
//
//       // For web, just open in browser
//       if (DeviceTools.isPlatformWeb()) {
//         final uri = Uri.parse(url);
//         await launchUrl(uri, mode: LaunchMode.externalApplication);
//         return;
//       }
//
//       // Request storage permission for Android
//       if (Platform.isAndroid) {
//         DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//         AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//
//         if (androidInfo.version.sdkInt >= 33) {
//           // Android 13+ (API 33+) - need photos/videos permission
//           var status = await Permission.photos.request();
//           if (!status.isGranted) {
//             ToolsToast.bottom(context, "Storage permission denied".tr());
//             return;
//           }
//         } else {
//           // Below Android 13 - need storage permission
//           var status = await Permission.storage.request();
//           if (!status.isGranted) {
//             ToolsToast.bottom(context, "Storage permission denied".tr());
//             return;
//           }
//         }
//       }
//
//       // Get download directory
//       Directory? directory;
//       if (Platform.isAndroid) {
//         directory = await getExternalStorageDirectory();
//       } else if (Platform.isIOS) {
//         directory = await getApplicationDocumentsDirectory();
//       } else {
//         directory = await getDownloadsDirectory();
//       }
//
//       if (directory == null) {
//         ToolsToast.bottom(context, "Cannot access storage".tr());
//         return;
//       }
//
//       String savePath = '${directory.path}/$fileName';
//
//       // Show downloading toast
//       ToolsToast.bottom(context, "Downloading...".tr());
//
//       // Download file using Dio
//       Dio dio = Dio();
//       await dio.download(
//         url,
//         savePath,
//         onReceiveProgress: (received, total) {
//           if (total != -1) {
//             Log.i("Download progress: ${(received / total * 100).toStringAsFixed(0)}%");
//           }
//         },
//       );
//
//       Log.i("downloadFile() - saved to: $savePath");
//
//       // Show success message
//       ToolsToast.bottom(context, "File downloaded successfully".tr());
//
//       // Open file
//       final result = await OpenFile.open(savePath);
//       if (result.type != ResultType.done) {
//         Log.e("downloadFile() - Cannot open file: ${result.message}");
//       }
//
//     } catch (e) {
//       Log.e("downloadFile() - error: $e");
//       ToolsToast.bottom(context, "Download failed".tr());
//     }
//   }
//
//
//   static Future downloadFileInWebOnly(BuildContext context, String? url)async {
//     if (url != null && url.isNotEmpty) {
//       try {
//         final uri = Uri.parse(url);
//         if (await canLaunchUrl(uri)) {
//           await launchUrl(uri, mode: LaunchMode.externalApplication);
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text("Could not open file".tr())),
//           );
//         }
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Error opening file".tr())),
//         );
//       }
//     }
//   }
//
//
// }
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:fastor_app_ui_widget/core/offline/picture/permissions_offline_image.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class CachePictureService {
  final PermissionsOfflineImage _permissionsService;

  CachePictureService(this._permissionsService);

  /// Downloads and caches multiple images concurrently
  Future<List<String>> cachePicturesService({
    required List<String> urls,
  }) async {
    if (!await _permissionsService.checkStoragePermissions()) {
      log('❌ Storage permissions denied - cannot cache images');
      return [];
    }

    final Directory appDir = await getApplicationDocumentsDirectory();
    final Directory cacheDir = Directory(
      path.join(appDir.path, 'cached_images'),
    );

    if (!await cacheDir.exists()) {
      await cacheDir.create(recursive: true);
    }

    final List<Future<String?>> downloadFutures =
        urls.map((url) => _downloadAndCacheImage(url, cacheDir)).toList();

    final List<String?> results = await Future.wait(downloadFutures);
    return results.where((path) => path != null).cast<String>().toList();
  }

  /// Downloads and caches a single image
  Future<String?> _downloadAndCacheImage(String url, Directory cacheDir) async {
    try {
      String fileName = path.basename(Uri.parse(url).path);
      if (fileName.isEmpty) {
        fileName =
            'image_${DateTime.now().millisecondsSinceEpoch}_${url.hashCode.abs()}.jpg';
      }

      // Check if image with this name already exists
      final String fullPath = path.join(cacheDir.path, fileName);
      if (await File(fullPath).exists()) {
        log('✅ Image already cached: $fullPath , fileName: $fileName');
        return fullPath;
      }
      // log('⬇️ Downloading image: $url, saving as: $fullPath, fileName: $fileName');

      final response = await Dio().get(
        url,
        options: Options(responseType: ResponseType.bytes),
      );

      final Uint8List imageBytes = response.data as Uint8List;

      if (response.statusCode != 200 || imageBytes.isEmpty) {
        log('CachePictureService - ❌ Invalid image data for: $url');
        return null;
      }

      await File(fullPath).writeAsBytes(imageBytes);
      return fullPath;
    } catch (e) {
      /// when not found image 404 skip printing logs
      if (e is DioException && e.response?.statusCode == 404) {
        return null;
      }
      // log('CachePictureService - ❌ Error caching image from $url: $e');
      return null;
    }
  }

  /// Get the local file path for a cached image by extracting filename from URL
  Future<String?> getLocalPath(String url) async {
    try {
      final Directory appDir = await getApplicationDocumentsDirectory();
      final Directory cacheDir =
          Directory(path.join(appDir.path, 'cached_images'));
      final String fileName = path.basename(Uri.parse(url).path);
      return path.join(cacheDir.path, fileName);
    } catch (e) {
      log('CachePictureService - ❌ Error getting local path for URL: $url - $e');
      return null;
    }
  }
}

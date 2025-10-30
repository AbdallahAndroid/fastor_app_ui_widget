import 'dart:developer';
import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

class PermissionsOfflineImage {
  /// Check storage/photos permissions based on platform and Android API level
  Future<bool> checkStoragePermissions() async {
    try {
      if (Platform.isIOS) {
        // iOS apps can write to their own documents directory without permissions
        // Only need photos permission when accessing user's photo library
        return true;
      } else if (Platform.isAndroid) {
        // Try photos permission first (for newer versions)
        var photosStatus = await Permission.photos.status;
        if (!photosStatus.isGranted) {
          photosStatus = await Permission.photos.request();
        }

        if (photosStatus.isGranted) {
          return true;
        }

        // Fallback to storage permission for older Android versions
        var storageStatus = await Permission.storage.status;
        if (!storageStatus.isGranted) {
          storageStatus = await Permission.storage.request();
        }
        return storageStatus.isGranted;
      }

      log('❌ Unsupported platform: ${Platform.operatingSystem}');
      return false;
    } catch (e) {
      log('❌ Error checking permissions: $e');
      return false;
    }
  }

  /// Check photo library permissions for accessing user's photos
  Future<bool> checkPhotoLibraryPermissions() async {
    try {
      if (Platform.isIOS) {
        var status = await Permission.photos.status;
        if (!status.isGranted) {
          status = await Permission.photos.request();
        }
        return status.isGranted;
      } else if (Platform.isAndroid) {
        // Try photos permission first (for newer versions)
        var photosStatus = await Permission.photos.status;
        if (!photosStatus.isGranted) {
          photosStatus = await Permission.photos.request();
        }

        if (photosStatus.isGranted) {
          return true;
        }

        // Fallback to storage permission for older Android versions
        var storageStatus = await Permission.storage.status;
        if (!storageStatus.isGranted) {
          storageStatus = await Permission.storage.request();
        }
        return storageStatus.isGranted;
      }

      log('❌ Unsupported platform: ${Platform.operatingSystem}');
      return false;
    } catch (e) {
      log('❌ Error checking permissions: $e');
      return false;
    }
  }
}
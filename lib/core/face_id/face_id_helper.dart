import 'package:fastor_app_ui_widget/core/face_id/core/face_typedef.dart';
import 'package:fastor_app_ui_widget/core/face_id/presentation/popup_faceid.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/error_codes.dart';
import 'package:local_auth/local_auth.dart';

class FaceIdHelper {
  static LocalAuthentication auth = LocalAuthentication();

  ///---------------------------------------------------------------------- checker status

  /// Any biometrics like : fingerprint, faceId
  static Future<bool> isDeviceSupportBiometrics() async {
    try {
      Log.i("face - isDeviceSupportBiometrics() - start ");
      final LocalAuthentication auth = LocalAuthentication();
      Log.i("face - isDeviceSupportBiometrics() - auth: $auth ");
      final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
      Log.i(
          "face - isDeviceSupportBiometrics() - canAuthenticateWithBiometrics: $canAuthenticateWithBiometrics ");
      final bool canAuthenticate =
          canAuthenticateWithBiometrics || await auth.isDeviceSupported();
      Log.i(
          "face - isDeviceSupportBiometrics() - canAuthenticate: $canAuthenticate ");
      final List<BiometricType> availableBiometrics =
          await auth.getAvailableBiometrics();
      Log.i(
          "face - isDeviceSupportBiometrics() - canAuthenticate: $availableBiometrics ");
      if (availableBiometrics.isNotEmpty) {
        return canAuthenticate;
      }
      Log.i("face - isDeviceSupportBiometrics() - result: $canAuthenticate");
      return canAuthenticate;
    } catch (e) {
      Log.i("face - isDeviceSupportBiometrics() - e: $e");
      return false;
    }
  }

  static Future<bool> isDeiceSupportFaceId() async {
    if (await isDeviceSupportBiometrics() == false) return false;
    final LocalAuthentication auth = LocalAuthentication();
    final List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    var result = availableBiometrics.contains(BiometricType.face);
    Log.i("face - isDeiceSupportFaceId() - result: $result");
    return result;
  }

  Future<bool> isDeviceSupportFingerPrint() async {
    if (await isDeviceSupportBiometrics() == false) return false;
    final LocalAuthentication auth = LocalAuthentication();
    final List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    var result = availableBiometrics.contains(BiometricType.fingerprint);
    Log.i("face - isDeviceSupportFingerPrint() - result: $result");
    return result;
  }

  ///-------------------------------------------------------------------- dialog

  /**
      errors types
      /// I/flutter (30144): debug : 15:25:35:470 : face - openDialog() - PlatformException e: PlatformException(LockedOut, The operation was canceled because the API is locked out due to too many attempts. This occurs after 5 failed attempts, and lasts for 30 seconds., null, null)


   */
  static Future openAuthDialog(
      {required BuildContext context,
      required FaceAuthCallback onComplete,
      required bool isForceOpenRetryDialog,
      required FaceAuthFailedOnNoSupported onNotSupportedCallback,
      String? msgWhyNeedAuthenticate}) async {
    try {
      Log.i(
          "face - openDialog() - start  - isForceOpenRetryDialog: $isForceOpenRetryDialog");
      bool isNotSupport =
          await FaceIdHelper.isDeviceSupportBiometrics() == false;
      if (isNotSupport) {
        Log.i("face - openDialog() - onNotSupportedCallback");
        onNotSupportedCallback();
        return;
      }
      Log.i("face - openDialog() - yes support biometrics, start authenticate");

      final bool isAuthenticatedSuccess = await auth.authenticate(
          localizedReason:
              msgWhyNeedAuthenticate ?? "Two Factor Authentication".tr(),
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            biometricOnly: true,
          ));
      Log.i(
          "face - openDialog() - isAuthenticatedSuccess: $isAuthenticatedSuccess");
      if (isAuthenticatedSuccess) {
        onComplete(true, null, null);
      } else {
        if (isForceOpenRetryDialog) {
          await _retryAgainDialogMessage(
              context: context,
              isForceOpenRetryDialog: isForceOpenRetryDialog,
              msgError: "failed authentication".tr(),
              onNotSupportedCallback: onNotSupportedCallback,
              onComplete: onComplete);
        } else {
          onComplete(false, null, null);
        }
      }
    } on PlatformException catch (e) {
      Log.i("face - openDialog() - PlatformException e: $e");
      Log.i("face - openDialog() - PlatformException e.code: ${e.message}");
      Log.i("face - openDialog() - PlatformException e.code: ${e.code}");

      /// case not supported
      if (e.code == "Security credentials not available.") {
        onNotSupportedCallback();
        return;
      } else if (e.code == notAvailable) {
        onNotSupportedCallback();
        return;
      } else if (e.code == notEnrolled) {
        onNotSupportedCallback();
        return;
      }
      if (isForceOpenRetryDialog) {
        await _retryAgainDialogMessage(
            context: context,
            isForceOpenRetryDialog: isForceOpenRetryDialog,
            msgError: e.message ?? e.toString(),
            onNotSupportedCallback: onNotSupportedCallback,
            onComplete: onComplete);
      } else {
        onComplete(false, null, null);
      }
    } catch (e) {
      Log.i("face - openDialog()  e: $e");
      if (isForceOpenRetryDialog) {
        await _retryAgainDialogMessage(
            context: context,
            isForceOpenRetryDialog: isForceOpenRetryDialog,
            msgError: e.toString(),
            onNotSupportedCallback: onNotSupportedCallback,
            onComplete: onComplete);
      } else {
        onComplete(false, null, null);
      }
    }
  }

  static Future _retryAgainDialogMessage(
      {required BuildContext context,
      required String msgError,
      required bool isForceOpenRetryDialog,
      required FaceAuthFailedOnNoSupported onNotSupportedCallback,
      required FaceAuthCallback onComplete}) async {
    await PopupFaceId.refreshButton(
        buttonTitle: "Authenticate".tr(),
        iconData: Icons.fingerprint,
        context: context,
        msg: msgError,
        //"Biometrics Authentication Required".tr(),
        onTapRefresh: () async {
          await openAuthDialog(
              isForceOpenRetryDialog: isForceOpenRetryDialog,
              context: context,
              onComplete: onComplete,
              onNotSupportedCallback: onNotSupportedCallback);
        });
  }
}

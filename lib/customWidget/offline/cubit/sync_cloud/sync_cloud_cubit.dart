import 'dart:async';

import 'package:fastor_app_ui_widget/core/constant/env.dart';
import 'package:fastor_app_ui_widget/core/utils/globa/GlobalApp.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/customWidget/offline/presentation/network_wrapper_widget/network_wrapper_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sync_cloud_state.dart';

int maxHoursPopUpNoInternetAfterLongTimeOfflineModeNeededBySyncCloud = 1;

class SyncCloudCubit extends Cubit<SyncCloudState> {
  static int _counterTimerDebug = 0;

  static Timer? timer;

  /// use case
  // final SyncCloudOfflineOrdersUseCase _syncCloudOfflineOrdersUseCase;

  /// last time network
  static int lastTimeFoundInternetAndMakeSync = 0;

  // static bool isWaitingForInterent;

  SyncCloudCubit( )
      : super(SyncCloudInitialState());

  static SyncCloudCubit get(context) => BlocProvider.of(context);

  setupTimer() {
    if (timer?.isActive ?? false) return;
    Log.i("sync - setupTimer() - start");
    timer = Timer.periodic(
        isTestEnvironment ? Duration(seconds: 10) : Duration(minutes: 10),
        (t) async {

      // if (UserHelper.isOnlineMode()) return;
      _counterTimerDebug++;
      // Log.i(
      //     "sync - setupTimer() - run _counterTimerDebug: $_counterTimerDebug ***");

      /// lastTime network found
      if (isTimerFoundThereIsNoInternetConnectionAfterLongTime()) {
        emit(TimerSyncCloudTimeOutAfterLongTimeNoInternetFoundState());
      }

      /// sync when found internet
      if (NetworkWrapperController.isConnectedLastStatus) {
        await _syncFunctionDatabaseOffline();
      }
    });
  }

  ///----------------------------------------------------------------- sync cloud function

  _syncFunctionDatabaseOffline() async {
    var context = GlobalApp.getContexts();
    if (context == null) {
      Log.i("sync - _syncFunctionDatabaseOffline() - context == null - stop !");
      return;
    }

    /// same data download once open
    // await SyncCloudUploaderHelper
    //     .downloadAndReplaceProductsAndCategoryAndBuyers(context,
    //         isShowProgressAndClearDataWhileLoading: false);
    // await syncCloudOrdersOfflineCallRemote();
    // setLastTimeNetworkFoundAndMakeSync();
  }

  Future syncCloudOrdersOfflineCallRemote() async {
    // emit(SyncCloudUploadOfflineOrdersLoadingState());
    // await _syncCloudOfflineOrdersUseCase.confirm(onComplete: (counterRequest) {
    //   // Log.i(
    //   //     "sync - syncCloudOrdersOfflineCallRemote() - onComplete - counterRequest: $counterRequest");
    //   emit(SyncCloudUploadOfflineOrdersCompleteState());
    // });
  }

  ///----------------------------------------------------------------- helper methods

  static void setLastTimeNetworkFoundAndMakeSync() {
    if (NetworkWrapperController.isConnectedLastStatus) {
      lastTimeFoundInternetAndMakeSync = getCurrentTimestamp();
      // Log.i(
      //     "sync - setLastTimeNetworkFound() - lastTimeFoundInternet: $lastTimeFoundInternetAndMakeSync");
    }
  }

  static bool isTimerFoundThereIsNoInternetConnectionAfterLongTime() {
    /// case first time not sync yet
    if (lastTimeFoundInternetAndMakeSync == 0) {
      // Log.i(
      //     "sync - isTimerFoundThereIsNoInternetConnectionAfterLongTime() - first time skiped");
      return false;
    }

    /// choose time by env
    if (isTestEnvironment) {
      bool result =
          isMoreThanMinute(lastTimeFoundInternetAndMakeSync, minutes: 60);
      return result;
    } else {
      int hoursMax =
          maxHoursPopUpNoInternetAfterLongTimeOfflineModeNeededBySyncCloud;
      return isMoreThanHours(lastTimeFoundInternetAndMakeSync, hours: hoursMax);
    }
  }

  /// Returns current timestamp in seconds (Unix time)
  static int getCurrentTimestamp() {
    return DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000;
  }

  /// Check if more than [hours] have passed since [previousTimestamp]
  static bool isMoreThanHours(int previousTimestamp, {int hours = 9}) {
    int currentTimestamp = getCurrentTimestamp();
    int diffInSeconds = currentTimestamp - previousTimestamp;
    int diffInHours = diffInSeconds ~/ 3600;
    return diffInHours >= hours;
  }

  /// Check if more than [minutes] have passed since [previousTimestamp]
  static bool isMoreThanMinute(int previousTimestamp, {int minutes = 1}) {
    int currentTimestamp = getCurrentTimestamp();
    int diffInSeconds = currentTimestamp - previousTimestamp;
    int diffInMinutes = diffInSeconds ~/ 60;

    return diffInMinutes >= minutes;
  }
}

import 'dart:async';

import 'package:fastor_app_ui_widget/core/cache/UserHelper.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/customWidget/offline/presentation/network_wrapper_widget/network_wrapper_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

part 'offline_mode_state.dart';

// bool _isAlreadySetupBefore = false;
bool _isStopListenerEmit = false;

class OfflineModeCubit extends Cubit<OfflineModeState> {
  OfflineModeCubit() : super(OfflineModeInitialState());

  static OfflineModeCubit get(context) => BlocProvider.of(context);

  StreamSubscription<InternetStatus>? _internetSubscription;

  void toggleOfflineMode({required bool isIamOffline}) {
    UserHelper.setOfflineMode(isIamOffline);
    emit(SuccessChangeOfflineOnlineModeState());
  }

  setupStreamWhenInternetChanges() {
    _internetSubscription?.cancel();

    // Create new subscription
    _internetSubscription =
        InternetConnection().onStatusChange.listen((status) {
      bool isStopWhenReturnBackFromOnResume =
          _isStopListenerEmit && status == InternetStatus.disconnected;
      if (isStopWhenReturnBackFromOnResume) {
        Log.i(
            'OfflineModeCubit - setupStreamWhenInternetChanges() fix isStopWhenReturnBackFromOnResume - stop! ');
        // NetworkWrapperController.isConnectedLastStatus = true;
        // initLifeCycleOnceOnResumeFromBackground();
        // emit(FoundNetworkConnectionChangedState(isConnected: true));
        return;
      }

      _chooseWhatToEmitAfterChangeHappened(status);
    });
  }

  @override
  Future<void> close() {
    _internetSubscription?.cancel();
    return super.close();
  }

  setOnResumeFromBackground() async {
    var status = await InternetConnection().internetStatus;
    Log.i('OfflineModeCubit - setOnResumeFromBackground() -  status: $status');
    _chooseWhatToEmitAfterChangeHappened(status);
  }

  void setOnInactiveFromBackground() {
    Log.i(
        'OfflineModeCubit - setOnInactiveFromBackground() - listener prevent');
    _isStopListenerEmit = true;
  }

  void allowListener() {
    Log.i('OfflineModeCubit - allowListener()  allow');
    _isStopListenerEmit = false;
  }

  void _chooseWhatToEmitAfterChangeHappened(InternetStatus status) {
    allowListener();

    if (status == InternetStatus.disconnected) {
      NetworkWrapperController.isConnectedLastStatus = false;
      Log.i(
          'OfflineModeCubit - _chooseWhatToEmitAfterChangeHappened() - internet connection is down (X)');
      emit(FoundNetworkConnectionChangedState(isConnected: false));
    } else if (status == InternetStatus.connected) {
      NetworkWrapperController.isConnectedLastStatus = true;
      Log.i(
          'OfflineModeCubit - _chooseWhatToEmitAfterChangeHappened() -  internet connection is restored (Y)');
      emit(FoundNetworkConnectionChangedState(isConnected: true));
    }
  }
}

part of 'offline_mode_cubit.dart';

sealed class OfflineModeState {}

final class OfflineModeInitialState extends OfflineModeState {}

class SuccessChangeOfflineOnlineModeState extends OfflineModeState {}

class FoundNetworkConnectionChangedState extends OfflineModeState {
  final bool isConnected;

  FoundNetworkConnectionChangedState({required this.isConnected});

  @override
  String toString() {
    return 'FoundNetworkConnectionChangedState{isConnected: $isConnected}';
  }
}

part of 'sync_cloud_cubit.dart';

sealed class SyncCloudState {}

final class SyncCloudInitialState extends SyncCloudState {}

/// dialog sync required
class TimerSyncCloudTimeOutAfterLongTimeNoInternetFoundState
    extends SyncCloudState {}

/// uploading
class SyncCloudUploadOfflineOrdersLoadingState extends SyncCloudState {}

class SyncCloudUploadOfflineOrdersCompleteState extends SyncCloudState {}

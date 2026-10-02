import 'dart:async';

/// debounce design pattern:
///   the action runs only after the calls stop for [milliseconds]
///   >> every new call cancels the action still waiting, so many fast calls make the action one time only
class Debouncer {

  final int milliseconds;
  Timer? _timer;

  /// how to use:
  ///
  ///   1- create one instance only and keep it as a field (cubit / state), never create it inside the click,
  ///      because a new instance has no timer to cancel >> every click will call the action
  ///
  ///        final Debouncer debouncerSearch = Debouncer( milliseconds: 1000 );
  ///
  ///   2- on every click / text change call "run", the action fires only after the user stops for 1000 ms
  ///
  ///        onTap: () {
  ///          debouncerSearch.run( () {
  ///            downloadData();
  ///          });
  ///        }
  ///
  ///   3- cancel the action still waiting when the data is reset or the screen is closed
  ///
  ///        debouncerSearch.cancel();
  ///
  /// example in project: "RealestateCubit.debouncerFilterBarBuildType"
  ///   >> the user selects many build types one by one, the api is called one time after his last click
  Debouncer({ required this.milliseconds });

  /// restart the waiting, the previous action not fired yet is canceled
  void run( void Function() action ) {
    _timer?.cancel();
    _timer = Timer( Duration( milliseconds: milliseconds ), action );
  }

  /// true : an action is still waiting to run
  bool get isWaiting => _timer?.isActive ?? false;

  /// drop the action still waiting, it will never run
  void cancel() {
    _timer?.cancel();
    _timer = null;
  }

}

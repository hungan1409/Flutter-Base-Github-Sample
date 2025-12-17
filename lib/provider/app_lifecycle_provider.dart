import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appLifecycleProvider = NotifierProvider<AppLifecycleNotifier, AppLifecycleState>(
  AppLifecycleNotifier.new,
);

class AppLifecycleNotifier extends Notifier<AppLifecycleState> {
  @override
  AppLifecycleState build() {
    final observer = _AppLifecycleObserver((value) => state = value);

    WidgetsBinding.instance.addObserver(observer);
    ref.onDispose(() => WidgetsBinding.instance.removeObserver(observer));

    return AppLifecycleState.resumed;
  }
}

class _AppLifecycleObserver extends WidgetsBindingObserver {
  _AppLifecycleObserver(this._didChangeAppLifecycle);

  final ValueChanged<AppLifecycleState> _didChangeAppLifecycle;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _didChangeAppLifecycle(state);
    super.didChangeAppLifecycleState(state);
  }
}

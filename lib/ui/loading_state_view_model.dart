import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/legacy.dart';

final ChangeNotifierProvider<LoadingStateViewModel> loadingStateProvider = ChangeNotifierProvider(
  (ref) => LoadingStateViewModel(),
);

class LoadingStateViewModel extends ChangeNotifier {
  bool isLoading = false;

  Future<dynamic> whileLoading(Future<void> Function() future) {
    return Future.microtask(
      toLoading,
    ).then((_) => future()).whenComplete(toIdle);
  }

  void toLoading() {
    if (isLoading) return;
    isLoading = true;
    notifyListeners();
  }

  void toIdle() {
    if (!isLoading) return;
    isLoading = false;
    notifyListeners();
  }
}

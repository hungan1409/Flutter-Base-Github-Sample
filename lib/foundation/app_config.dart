import 'package:app/foundation/flavor.dart';
import 'package:flutter/foundation.dart';

class AppConfig {
  // Flavor
  static String flavorEnvironment = Flavor.development.name;

  static const appName = 'Github Sample';

  static const endpoint = '';

  static bool isShowLog() {
    return kDebugMode || flavorEnvironment == Flavor.development.name;
  }
}

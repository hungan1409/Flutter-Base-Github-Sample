import 'dart:async';

import 'package:app/app.dart';
import 'package:app/data/local/app_preferences.dart';
import 'package:app/foundation/app_config.dart';
import 'package:app/foundation/constants.dart';
import 'package:app/provider/shared_preference_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger_observer.dart';

Future<void> main() async {
  unawaited(
    runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();

        // debugPaintBaselinesEnabled = true;
        // debugPaintSizeEnabled = true;
        // debugPaintLayerBordersEnabled = true;

        if (kReleaseMode) {
          debugPrint = (message, {wrapWidth}) {};
        }

        // Get flavor
        AppConfig.flavorEnvironment =
            (await Constants.platformChannel.invokeMethod<String>(
              Constants.getFlavor,
            )) ??
            Flavor.development.name;
        debugPrint('STARTED WITH FLAVOR ${AppConfig.flavorEnvironment}');

        // Shared Preferences
        await AppPreferences.init();
        // Firebase
        await Firebase.initializeApp();

        // Crashlytics
        await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
          kDebugMode,
        );
        final Function originalOnError = FlutterError.onError!;
        FlutterError.onError = (errorDetails) async {
          await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
          originalOnError(errorDetails);
        };

        // Remote config
        await FirebaseRemoteConfig.instance.setConfigSettings(
          RemoteConfigSettings(
            fetchTimeout: const Duration(seconds: 10),
            minimumFetchInterval: Duration.zero,
          ),
        );
        RemoteConfigValue(null, ValueSource.valueStatic);

        // Init and get SharedPreferences instance
        final sharedPreferences = await SharedPreferences.getInstance();

        runApp(
          ProviderScope(
            overrides: [prefsProvider.overrideWithValue(sharedPreferences)],
            observers: [if (AppConfig.isShowLog()) TalkerRiverpodObserver()],
            child: const App(),
          ),
        );
      },
      (error, stackTrace) {
        FirebaseCrashlytics.instance.recordError(error, stackTrace);
      },
    ),
  );
}

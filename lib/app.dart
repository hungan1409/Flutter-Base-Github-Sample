import 'dart:async';

import 'package:app/fcm_settings.dart';
import 'package:app/foundation/app_config.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app/provider/data_provider.dart';
import 'package:app/route/app_router.dart';
import 'package:app/ui/language/language_view_model.dart';
import 'package:app/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:talker_flutter/talker_flutter.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final themeMode = ref.watch(appThemeModeProvider);
    final router = ref.watch(appRouterProvider);
    final languageViewModel = ref.watch(languageViewModelProvider);
    final talker = ref.watch(talkerProvider);
    // Get the FCM token
    unawaited(
      useMemoized(() async {
        // Firebase Cloud Message
        await fcmSettings(ref);
        unawaited(fetchFCMToken(ref));
      }, []),
    );

    return ScreenUtilInit(
      designSize: const Size(375, 734), // follow base design screen size
      minTextAdapt: true,
      child: MaterialApp.router(
        theme: theme.data,
        darkTheme: AppTheme.dark().data,
        themeMode: themeMode,
        locale: languageViewModel.currentLocale,
        localizationsDelegates: L10n.localizationsDelegates,
        supportedLocales: L10n.supportedLocales,
        routeInformationParser: router.defaultRouteParser(),
        routerDelegate: router.delegate(
          navigatorObservers: () => [
            if (AppConfig.isShowLog()) TalkerRouteObserver(talker),
          ],
        ),
      ),
    );
  }
}

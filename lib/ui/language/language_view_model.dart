import 'dart:io';

import 'package:app/foundation/constants.dart';
import 'package:app/foundation/keys.dart';
import 'package:app/provider/shared_preference_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';

final ChangeNotifierProvider<LanguageViewModel> languageViewModelProvider = ChangeNotifierProvider(
  (ref) => LanguageViewModel(ref),
);

class LanguageViewModel extends ChangeNotifier {
  LanguageViewModel(this._ref);

  final Ref _ref;

  // Change Locale
  late Locale _currentLocale = Locale(
    _prefs.getString(Keys.currentLocale) ?? getLanguageInFirstTime(),
  );

  Locale get currentLocale => _currentLocale;

  late final SharedPreferences _prefs = _ref.read(prefsProvider);

  void changeLocale(Locale locale) {
    _prefs.setString(Keys.currentLocale, locale.languageCode);
    _currentLocale = locale;
    notifyListeners();
  }

  String getLanguageInFirstTime() {
    final String currentLocale = Platform.localeName.substring(0, 2);
    if (Constants.supportedLanguages.containsKey(currentLocale)) {
      _prefs.setString(Keys.currentLocale, currentLocale);
      return currentLocale;
    } else {
      _prefs.setString(Keys.currentLocale, 'en');
      return 'en';
    }
  }
}

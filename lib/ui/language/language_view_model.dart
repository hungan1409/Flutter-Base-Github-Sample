import 'dart:io';

import 'package:app/foundation/constants.dart';
import 'package:app/foundation/keys.dart';
import 'package:app/provider/shared_preference_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final languageViewModelProvider = ChangeNotifierProvider((ref) => LanguageViewModel(ref));

class LanguageViewModel extends ChangeNotifier {
  LanguageViewModel(this._ref);

  final Ref _ref;

  // Change Locale
  late Locale _currentLocale = Locale(_prefs.getString(Keys.currentLocale) ?? getLanguageInFirstTime());

  Locale get currentLocale => _currentLocale;

  late final _prefs = _ref.read(prefsProvider);

  changeLocale(Locale locale) {
    _prefs.setString(Keys.currentLocale, locale.languageCode);
    _currentLocale = locale;
    notifyListeners();
  }

  String getLanguageInFirstTime() {
    String currentLocale = Platform.localeName.substring(0, 2);
    if (Constants.supportedLanguages.containsKey(currentLocale)) {
      _prefs.setString(Keys.currentLocale, currentLocale);
      return currentLocale;
    } else {
      _prefs.setString(Keys.currentLocale, "en");
      return "en";
    }
  }
}

import 'package:app/foundation/app_config.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum Flavor { development, production }

@immutable
class Constants {
  const Constants._({
    required this.endpoint,
    required this.apiKey,
  });

  factory Constants.of() {
    final flavor =
        EnumToString.fromString(Flavor.values, AppConfig.flavorEnvironment);

    switch (flavor) {
      case Flavor.development:
        return Constants._dev();
      case Flavor.production:
      default:
        return Constants._prd();
    }
  }

  factory Constants._dev() {
    return const Constants._(
      endpoint: 'https://api.base.com',
      apiKey: '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',
    );
  }

  factory Constants._prd() {
    return const Constants._(
      endpoint: 'https://api.base.com',
      apiKey: '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',
    );
  }

  static late final Constants instance = Constants.of();

  final String endpoint;
  final String apiKey;

  static final Map<String, String> supportedLanguages = {
    'en': 'English',
    'ja': "日本語"
  };

  static const getFlavor = "GET_FLAVOR";
  static const platformChannel =
      MethodChannel("com.flutter.base.sample/native_channel");

  static const iOSAppId = "915061235"; //temporary id
}

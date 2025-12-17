import 'dart:async';

import 'package:app/foundation/keys.dart';
import 'package:app/ui/component/dialog/force_update_dialog.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ForceUpdateUtils {
  ForceUpdateUtils._();

  /// Compares two version strings and returns:
  /// - positive if version1 > version2
  /// - negative if version1 < version2
  /// - 0 if they are equal
  static int compareVersions(String version1, String version2) {
    final parts1 = version1.split('.').map((e) => int.tryParse(e) ?? 0).toList();
    final parts2 = version2.split('.').map((e) => int.tryParse(e) ?? 0).toList();

    final maxLength = parts1.length > parts2.length ? parts1.length : parts2.length;

    for (int i = 0; i < maxLength; i++) {
      final v1 = i < parts1.length ? parts1[i] : 0;
      final v2 = i < parts2.length ? parts2[i] : 0;

      if (v1 > v2) return 1;
      if (v1 < v2) return -1;
    }

    return 0;
  }

  /// Checks if force update is required and shows dialog if needed
  static Future<void> checkForceUpdate(BuildContext context) async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      await FirebaseRemoteConfig.instance.fetchAndActivate();

      final forceUpdateVersion = FirebaseRemoteConfig.instance.getString(
        Keys.forceUpdateVersion,
      );
      final currentVersion = packageInfo.version.split('-')[0];

      debugPrint('Current app version: $currentVersion');
      debugPrint('Force update version: $forceUpdateVersion');

      if (forceUpdateVersion.isEmpty) return;

      final comparison = compareVersions(forceUpdateVersion, currentVersion);

      if (comparison > 0 && context.mounted) {
        debugPrint('Force update required!');
        showForceUpdateDialog(
          context: context,
          appPackage: packageInfo.packageName,
        );
      }
    } catch (e) {
      debugPrint('Error checking force update: $e');
    }
  }
}

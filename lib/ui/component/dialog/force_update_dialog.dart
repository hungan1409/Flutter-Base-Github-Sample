import 'dart:io';

import 'package:app/foundation/constants.dart';
import 'package:app/l10n/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void showForceUpdateDialog({
  required BuildContext context,
  required String appPackage,
}) {
  final l10n = L10n.of(context)!;
  showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return PopScope(
        canPop: false,
        child: CupertinoAlertDialog(
          title: Text(l10n.forceUpdateTitle),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[Text(l10n.forceUpdateContent)],
            ),
          ),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                _launchAppStore(appPackage);
              },
              child: Text(l10n.ok),
            ),
          ],
        ),
      );
    },
  );
}

void _launchAppStore(String appPackage) {
  String urlAppStore = '';
  if (Platform.isIOS) {
    urlAppStore = 'https://apps.apple.com/app/id${Constants.iOSAppId}';
  } else if (Platform.isAndroid) {
    urlAppStore = 'https://play.google.com/store/apps/details?id=$appPackage';
  }
  launchUrl(Uri.parse(urlAppStore));
}

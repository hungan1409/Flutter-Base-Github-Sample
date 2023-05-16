import 'package:app/data/handler/app_error.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

void handleError(BuildContext context, AppError appError, [VoidCallback? callback]) {
  final l10n = L10n.of(context)!;
  String message = parseError(context, appError);

  showDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text(message),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              // First close dialog
              Navigator.of(context, rootNavigator: true).pop();
              // Then call the callback function
              if (callback != null) {
                callback();
              }
            },
            child: Text(l10n.ok),
          )
        ],
      );
    },
  );
}

String parseError(BuildContext context, AppError appError) {
  // Get default message from server
  String errorMessage = appError.message;

  // Check specific case for use message from app
  switch (appError.type) {
    case AppErrorType.network:
      break;
    case AppErrorType.badRequest:
      break;
    case AppErrorType.unauthorized:
      break;
    case AppErrorType.cancel:
      break;
    case AppErrorType.timeout:
      break;
    case AppErrorType.server:
      break;
    case AppErrorType.unknown:
      break;
  }

  return errorMessage;
}

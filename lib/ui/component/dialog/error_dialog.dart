import 'package:app/data/handler/app_error.dart';
import 'package:app/l10n/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void handleError(
  BuildContext context,
  AppError appError, [
  VoidCallback? callback,
]) {
  final l10n = L10n.of(context)!;
  final String message = parseError(context, appError);

  showDialog<void>(
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
          ),
        ],
      );
    },
  );
}

String parseError(BuildContext context, AppError appError) {
  // Get default message from server
  final String errorMessage = appError.message;

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
    case AppErrorType.common:
      break;
    case AppErrorType.forceUpdate:
      break;
    case AppErrorType.maintenanceMode:
      break;
  }

  return errorMessage;
}

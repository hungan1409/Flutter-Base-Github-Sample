import 'package:app/data/app_error.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final errorProvider = ChangeNotifierProvider((ref) => ErrorHandler());

class ErrorHandler extends ChangeNotifier {
  AppError? _appError;

  get appError => _appError;

  void setError(AppError appError) {
    _appError = appError;
    notifyListeners();
  }

  void resetError() {
    _appError = null;
  }
}

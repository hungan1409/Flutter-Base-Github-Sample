import 'package:app/data/handler/app_error.dart';
import 'package:flutter/cupertino.dart';

class ErrorHandler extends ChangeNotifier {
  AppError? _appError;

  AppError? get appError => _appError;

  void setError(AppError appError) {
    _appError = appError;
    notifyListeners();
  }

  void resetError() {
    _appError = null;
  }
}

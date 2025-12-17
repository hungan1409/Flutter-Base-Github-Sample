import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

enum AppErrorType {
  network,
  badRequest,
  unauthorized,
  cancel,
  timeout,
  server,
  unknown,
  common,
  forceUpdate,
  maintenanceMode,
}

class AppError {
  late int statusCode;
  late String message;
  late AppErrorType type;
  late String methodAndUri;

  AppError(Exception? error) {
    if (error is DioException) {
      debugPrint(
        'AppError(DioError): '
        'type is ${error.type}, message is ${error.message}, code is ${error.response?.statusCode}',
      );
      methodAndUri = '[${error.requestOptions.method}] ${error.requestOptions.uri}';
      message = error.message ?? '';
      try {
        statusCode = error.response?.statusCode ?? 0;
      } catch (e) {
        statusCode = 0;
      }

      switch (error.type) {
        case DioExceptionType.connectionError:
          if (error.error is SocketException) {
            // SocketException: Failed host lookup: '***'
            // (OS Error: No address associated with hostname, errno = 7)
            type = AppErrorType.network;
            statusCode = (error.error! as SocketException).osError?.errorCode ?? 7;
          } else {
            type = AppErrorType.unknown;
          }
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
          type = AppErrorType.timeout;
        case DioExceptionType.sendTimeout:
          type = AppErrorType.network;
        case DioExceptionType.badResponse:
          // TODO(api): need define more http status;
          switch (error.response?.statusCode) {
            case HttpStatus.badRequest: // 400
              type = AppErrorType.badRequest;
            case HttpStatus.unauthorized: // 401
              type = AppErrorType.unauthorized;
            case HttpStatus.upgradeRequired: // 426
              type = AppErrorType.forceUpdate;
            case HttpStatus.serviceUnavailable: // 503
              type = AppErrorType.maintenanceMode;
            case HttpStatus.internalServerError: // 500
            case HttpStatus.badGateway: // 502
            case HttpStatus.gatewayTimeout: // 504
              type = AppErrorType.server;
            default:
              type = AppErrorType.unknown;
          }
        case DioExceptionType.cancel:
          type = AppErrorType.cancel;
        case DioExceptionType.badCertificate:
          type = AppErrorType.unknown;
        case DioExceptionType.unknown:
          type = AppErrorType.unknown;
      }
    } else {
      debugPrint('AppError(UnKnown): $error');
      type = AppErrorType.unknown;
      statusCode = 0;
      methodAndUri = '';
      message = 'AppError: $error';
    }
  }

  AppError.network() {
    type = AppErrorType.network;
    statusCode = 7;
    methodAndUri = '';
    message = 'Network error';
  }

  @override
  String toString() {
    return 'AppError instance type: $type, message: $message , statusCode: $statusCode, methodAndUri: $methodAndUri';
  }
}

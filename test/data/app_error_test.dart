import 'dart:io';

import 'package:app/data/handler/app_error.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('AppError Test', () async {
    expect(
      AppError(
        DioException(
          type: DioExceptionType.connectionTimeout,
          requestOptions: RequestOptions(),
        ),
      ).type,
      equals(AppErrorType.timeout),
    );

    expect(
      AppError(
        DioException(
          type: DioExceptionType.receiveTimeout,
          requestOptions: RequestOptions(),
        ),
      ).type,
      equals(AppErrorType.timeout),
    );

    expect(
      AppError(
        DioException(
          type: DioExceptionType.sendTimeout,
          requestOptions: RequestOptions(),
        ),
      ).type,
      equals(AppErrorType.network),
    );

    expect(
      AppError(
        DioException(
          type: DioExceptionType.badResponse,
          requestOptions: RequestOptions(),
          response: Response(requestOptions: RequestOptions(), statusCode: 400),
        ),
      ).type,
      equals(AppErrorType.badRequest),
    );

    expect(
      AppError(
        DioException(
          type: DioExceptionType.badResponse,
          requestOptions: RequestOptions(),
          response: Response(requestOptions: RequestOptions(), statusCode: 401),
        ),
      ).type,
      equals(AppErrorType.unauthorized),
    );

    expect(
      AppError(
        DioException(
          type: DioExceptionType.badResponse,
          requestOptions: RequestOptions(),
          response: Response(requestOptions: RequestOptions(), statusCode: 500),
        ),
      ).type,
      equals(AppErrorType.server),
    );

    expect(
      AppError(
        DioException(
          type: DioExceptionType.cancel,
          requestOptions: RequestOptions(),
        ),
      ).type,
      equals(AppErrorType.cancel),
    );

    expect(
      AppError(
        DioException(
          error: const SocketException('Failed host lookup'),
          requestOptions: RequestOptions(),
        ),
      ).type,
      equals(AppErrorType.network),
    );

    expect(
      AppError(
        DioException(
          requestOptions: RequestOptions(),
        ),
      ).type,
      equals(AppErrorType.unknown),
    );

    expect(AppError(const FileSystemException()).type, equals(AppErrorType.unknown));

    expect(AppError(null).type, equals(AppErrorType.unknown));
  });
}

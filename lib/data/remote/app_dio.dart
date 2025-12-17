import 'package:app/foundation/app_config.dart';
import 'package:app/foundation/constants.dart';
import 'package:app/provider/data_provider.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

final Provider<Dio> dioProvider = Provider((Ref ref) => AppDio.getInstance(ref));

class AppDio with DioMixin implements Dio {
  AppDio._(Ref ref, [BaseOptions? options]) {
    options = BaseOptions(
      baseUrl: Constants.of().endpoint,
      contentType: 'application/json',
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );

    this.options = options;
    interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers.addAll(await userAgentClientHintsHeader());
          // Add header api key of base for authorization
          // options.headers.addAll({"Authorization": "token ${Constants.of().apiKey}"});
          handler.next(options);
        },
      ),
    );

    if (AppConfig.isShowLog()) {
      final talker = ref.watch(talkerProvider);
      // Local Log
      interceptors.add(
        TalkerDioLogger(
          talker: talker,
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
            printResponseHeaders: true,
          ),
        ),
      );
    }

    httpClientAdapter = IOHttpClientAdapter();
  }

  static Dio getInstance(Ref ref) => AppDio._(ref);
}

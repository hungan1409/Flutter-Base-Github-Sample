// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_data_source.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _GithubDataSource implements GithubDataSource {
  _GithubDataSource(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<User> getUser({required id}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<User>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/users/${id}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = User.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<Repos>> getRepos(
      {required id, required page, perPage = 25}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'per_page': perPage
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(_setStreamType<List<Repos>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/users/${id}/repos',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Repos.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}

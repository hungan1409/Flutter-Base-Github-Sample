import 'package:app/data/model/repos.dart';
import 'package:app/data/model/user.dart';
import 'package:app/data/remote/app_dio.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'github_data_source.g.dart';

final Provider<GithubDataSource> githubDataSourceProvider = Provider((ref) => GithubDataSource(ref));

@RestApi()
abstract class GithubDataSource {
  factory GithubDataSource(Ref ref) => _GithubDataSource(ref.read(dioProvider));

  @GET('/users/{id}')
  Future<User> getUser({@Path('id') required String id});

  @GET('/users/{id}/repos')
  Future<List<Repos>> getRepos({
    @Path('id') required String id,
    @Query('page') required int page,
    @Query('per_page') int perPage = 25,
  });
}

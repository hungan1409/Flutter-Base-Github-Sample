import 'package:app/data/handler/error_handler.dart';
import 'package:app/data/handler/result.dart';
import 'package:app/data/model/repos.dart';
import 'package:app/data/model/user.dart';
import 'package:app/data/remote/github_data_source.dart';
import 'package:app/data/repository/github_repository.dart';
import 'package:app/provider/error_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GithubRepositoryImpl implements GithubRepository {
  GithubRepositoryImpl(this._ref);

  final Ref _ref;

  late final GithubDataSource _dataSource = _ref.read(githubDataSourceProvider);
  late final ErrorHandler _errorNotifier = _ref.read(errorProvider);

  @override
  Future<Result<User>> getUser(String userId) {
    return Result.guardFuture(
      () async => _dataSource.getUser(id: userId),
      _errorNotifier,
    );
  }

  @override
  Future<Result<List<Repos>>> getRepos(
    String userId,
    int page, [
    int perPage = 25,
  ]) {
    return Result.guardFuture(
      () async => _dataSource.getRepos(id: userId, page: page, perPage: perPage),
      _errorNotifier,
    );
  }
}

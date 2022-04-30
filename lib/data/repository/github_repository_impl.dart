import 'package:app/data/model/repos.dart';
import 'package:app/data/model/result.dart';
import 'package:app/data/model/user.dart';
import 'package:app/data/provider/error_provider.dart';
import 'package:app/data/remote/github_data_source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'github_repository.dart';

final githubRepositoryProvider =
    Provider((ref) => GithubRepositoryImpl(ref.read));

class GithubRepositoryImpl implements GithubRepository {
  GithubRepositoryImpl(this._reader);

  final Reader _reader;

  late final GithubDataSource _dataSource = _reader(githubDataSourceProvider);
  late final _errorNotifier = _reader(errorProvider);

  @override
  Future<Result<User>> getUser(String userId) {
    return Result.guardFuture(
        () async => await _dataSource.getUser(id: userId), _errorNotifier);
  }

  @override
  Future<Result<List<Repos>>> getRepos(String userId, int page,
      [int perPage = 25]) {
    return Result.guardFuture(
        () async => await _dataSource.getRepos(
            id: userId, page: page, perPage: perPage),
        _errorNotifier);
  }
}

import 'package:app/data/handler/result.dart';
import 'package:app/data/model/repos.dart';
import 'package:app/data/model/user.dart';

abstract class GithubRepository {
  Future<Result<User>> getUser(String id);

  Future<Result<List<Repos>>> getRepos(String id, int page, int perPage);
}

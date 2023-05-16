import 'package:app/data/handler/result.dart';
import 'package:app/data/model/repos.dart';
import 'package:app/data/model/user.dart';
import 'package:app/data/repository/github_repository.dart';
import 'package:app/provider/data_provider.dart';
import 'package:app/ui/loading_state_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeViewModelProvider = ChangeNotifierProvider((ref) => HomeViewModel(ref));

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this._ref);

  final Ref _ref;

  late final GithubRepository _repository = _ref.read(githubRepositoryProvider);
  late final _loadingProvider = _ref.read(loadingStateProvider);

  // For receive information of User
  Result<User>? _user;

  Result<User>? get user => _user;

  // For receive information of Repos
  List<Repos>? _repos;

  List<Repos>? get repos => _repos;

  // For load more
  int oldLength = 0;
  bool isLoadMoreError = false;
  bool isLoadMoreDone = false;
  bool isLoadingRepo = false;
  int currentPage = 1;
  String textSearch = "";

  // Get information of the user
  Future<void> fetchUser(String userId) {
    return _repository.getUser(userId).then((value) => _user = value).whenComplete(notifyListeners);
  }

  // Get list repos of the user
  Future<Result<List<Repos>>> fetchReposPage(String userId, int page, [int perPage = 25]) {
    return _repository.getRepos(userId, page, perPage).whenComplete(notifyListeners);
  }

  void saveInfoSearch(String text) {
    textSearch = text;
  }

  Future<void> refresh() async {
    currentPage = 1;
    isLoadingRepo = true;
    isLoadMoreError = false;
    isLoadMoreDone = false;
    _loadingProvider.toLoading();
    final repoResult = await fetchReposPage(textSearch, currentPage);

    repoResult.when(success: (data) {
      _repos = data;
      isLoadingRepo = false;
      isLoadMoreError = false;
      isLoadMoreDone = true;
      oldLength = _repos?.length ?? 0;
    }, failure: (e) {
      isLoadingRepo = false;
      isLoadMoreError = true;
    });
    _loadingProvider.toIdle();
    notifyListeners();
  }

  void loadMoreRepo() async {
    if (isLoadingRepo) {
      return;
    }

    isLoadingRepo = true;
    isLoadMoreError = false;
    isLoadMoreDone = false;

    final repoResult = await fetchReposPage(textSearch, currentPage + 1);

    repoResult.when(success: (data) {
      if (data.isNotEmpty) {
        _repos = [..._repos!, ...data];
        currentPage = currentPage + 1;
        isLoadingRepo = false;
        isLoadMoreError = false;
        isLoadMoreDone = false;
        oldLength = _repos?.length ?? 0;
      } else {
        isLoadingRepo = false;
        isLoadMoreDone = true;
      }
    }, failure: (e) {
      isLoadingRepo = false;
      isLoadMoreError = true;
    });
    notifyListeners();
  }
}

import 'package:app/data/handler/result.dart';
import 'package:app/data/model/repos.dart';
import 'package:app/data/model/user.dart';
import 'package:app/data/repository/github_repository.dart';
import 'package:app/provider/data_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';

final StateNotifierProvider<HomeViewModel, HomeUiState> homeViewModelProvider =
    StateNotifierProvider.autoDispose<HomeViewModel, HomeUiState>(
  (ref) => HomeViewModel(ref),
);

class HomeViewModel extends StateNotifier<HomeUiState> {
  HomeViewModel(this._ref) : super(const HomeUiStateInitial());

  final Ref _ref;

  late final GithubRepository _repository = _ref.read(githubRepositoryProvider);

  // Pagination state
  int _oldLength = 0;
  int _currentPage = 1;
  String _textSearch = '';

  int get oldLength => _oldLength;

  void saveInfoSearch(String text) {
    _textSearch = text;
  }

  Future<void> refresh() async {
    _currentPage = 1;
    state = const HomeUiStateLoading();

    try {
      // Fetch user and repos in parallel
      final results = await Future.wait([
        _repository.getUser(_textSearch),
        _repository.getRepos(_textSearch, _currentPage, 25),
      ]);

      final userResult = results[0] as Result<User>;
      final repoResult = results[1] as Result<List<Repos>>;

      repoResult.when(
        success: (data) {
          _oldLength = data.length;
          state = HomeUiStateLoaded(
            user: userResult,
            repos: data,
          );
        },
        failure: (e) {
          state = HomeUiStateError(e.toString());
        },
      );
    } catch (e) {
      state = HomeUiStateError(e.toString());
    }
  }

  Future<void> loadMoreRepo() async {
    final currentState = state;
    if (currentState is! HomeUiStateLoaded || currentState.isLoadingMore) {
      return;
    }

    state = currentState.copyWith(isLoadingMore: true);

    try {
      final repoResult = await _repository.getRepos(_textSearch, _currentPage + 1, 25);

      repoResult.when(
        success: (data) {
          if (data.isNotEmpty) {
            final newRepos = [...currentState.repos, ...data];
            _currentPage++;
            _oldLength = newRepos.length;
            state = currentState.copyWith(
              repos: newRepos,
              isLoadingMore: false,
              isLoadMoreDone: false,
            );
          } else {
            state = currentState.copyWith(
              isLoadingMore: false,
              isLoadMoreDone: true,
            );
          }
        },
        failure: (e) {
          state = currentState.copyWith(
            isLoadingMore: false,
            loadMoreError: e.toString(),
          );
        },
      );
    } catch (e) {
      state = currentState.copyWith(
        isLoadingMore: false,
        loadMoreError: e.toString(),
      );
    }
  }
}

/// Sealed class for Home UI states
sealed class HomeUiState {
  const HomeUiState();
}

/// Initial state - before any search
class HomeUiStateInitial extends HomeUiState {
  const HomeUiStateInitial();
}

/// Loading state - first time loading
class HomeUiStateLoading extends HomeUiState {
  const HomeUiStateLoading();
}

/// Loaded state - data loaded successfully
class HomeUiStateLoaded extends HomeUiState {
  const HomeUiStateLoaded({
    this.user,
    this.repos = const [],
    this.isLoadingMore = false,
    this.isLoadMoreDone = false,
    this.loadMoreError,
  });

  final Result<User>? user;
  final List<Repos> repos;
  final bool isLoadingMore;
  final bool isLoadMoreDone;
  final String? loadMoreError;

  HomeUiStateLoaded copyWith({
    Result<User>? user,
    List<Repos>? repos,
    bool? isLoadingMore,
    bool? isLoadMoreDone,
    String? loadMoreError,
  }) {
    return HomeUiStateLoaded(
      user: user ?? this.user,
      repos: repos ?? this.repos,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      isLoadMoreDone: isLoadMoreDone ?? this.isLoadMoreDone,
      loadMoreError: loadMoreError,
    );
  }
}

/// Error state - loading failed
class HomeUiStateError extends HomeUiState {
  const HomeUiStateError(this.message);

  final String message;
}

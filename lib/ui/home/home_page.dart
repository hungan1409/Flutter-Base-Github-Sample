import 'dart:async';

import 'package:app/data/handler/result.dart';
import 'package:app/data/model/repos.dart';
import 'package:app/data/model/user.dart';
import 'package:app/foundation/utils/force_update_utils.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app/route/app_router.dart';
import 'package:app/ui/animation/animate_in_effect.dart';
import 'package:app/ui/component/error/container_error_handling.dart';
import 'package:app/ui/home/github_repo_item.dart';
import 'package:app/ui/home/home_page_view_model.dart';
import 'package:app/ui/home/user_item.dart';
import 'package:app/ui/hook/use_l10n.dart';
import 'package:app/ui/hook/use_router.dart';
import 'package:app/ui/theme/app_colors.dart';
import 'package:app/ui/theme/app_text_theme.dart';
import 'package:app/ui/theme/layout_size.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    final l10n = useL10n();
    final appColors = context.appColors;
    final homeViewModel = ref.watch(homeViewModelProvider.notifier);
    final uiState = ref.watch(homeViewModelProvider);

    final searchTextController = useTextEditingController();
    final showClearButton = useState(false);

    final repoScrollController = useScrollController();

    // Use useEffect to add listener only once and properly dispose
    useEffect(() {
      void onScroll() {
        final currentState = uiState;
        if (currentState is HomeUiStateLoaded) {
          if (repoScrollController.position.pixels >
              repoScrollController.position.maxScrollExtent - 200) {
            if (homeViewModel.oldLength == currentState.repos.length) {
              unawaited(homeViewModel.loadMoreRepo());
            }
          }
        }
      }

      repoScrollController.addListener(onScroll);
      return () => repoScrollController.removeListener(onScroll);
    }, [repoScrollController, uiState]);

    useEffect(() {
      ForceUpdateUtils.checkForceUpdate(context);
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Assets.svgs.github.svg(),
        ),
        title: Text(
          l10n.githubExplorer,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              router.push(const SettingRoute());
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: ContainerErrorHandling(
        child: SafeArea(
          child: Column(
            children: [
              // Search Bar
              Padding(
                padding: const EdgeInsets.all(LayoutSize.sizePaddingMedium),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search_rounded),
                    suffixIcon: showClearButton.value
                        ? IconButton(
                            icon: const Icon(Icons.clear_rounded),
                            onPressed: () {
                              searchTextController.clear();
                              showClearButton.value = false;
                            },
                          )
                        : null,
                    filled: true,
                    fillColor: appColors.surfaceContainer.withAlpha(77),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(LayoutSize.borderRadius12),
                      borderSide: BorderSide(
                        color: appColors.primary,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(LayoutSize.borderRadius12),
                      borderSide: BorderSide.none,
                    ),
                    hintText: l10n.hintSearch,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: LayoutSize.sizePadding16,
                      vertical: LayoutSize.sizePadding14,
                    ),
                  ),
                  controller: searchTextController,
                  textInputAction: TextInputAction.search,
                  onChanged: (text) {
                    showClearButton.value = text.isNotEmpty;
                  },
                  onSubmitted: (text) async {
                    if (text.trim().isEmpty) return;
                    homeViewModel.saveInfoSearch(text.trim());
                    _loadRepos(homeViewModel, text.trim());
                    unawaited(
                      repoScrollController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      ),
                    );
                  },
                ),
              ),

              // Content - using switch pattern matching
              Expanded(
                child: switch (uiState) {
                  HomeUiStateInitial() => _buildEmptyState(context, l10n),
                  HomeUiStateLoading() => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  HomeUiStateLoaded(:final user, :final repos, :final isLoadMoreDone) =>
                    _buildLoadedContent(
                      context: context,
                      user: user,
                      repos: repos,
                      isLoadMoreDone: isLoadMoreDone,
                      homeViewModel: homeViewModel,
                      searchTextController: searchTextController,
                      repoScrollController: repoScrollController,
                      l10n: l10n,
                    ),
                  HomeUiStateError(:final message) => _buildErrorState(context, message, l10n),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadedContent({
    required BuildContext context,
    required Result<User>? user,
    required List<Repos> repos,
    required bool isLoadMoreDone,
    required HomeViewModel homeViewModel,
    required TextEditingController searchTextController,
    required ScrollController repoScrollController,
    required L10n l10n,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: LayoutSize.sizePaddingMedium),
      child: Column(
        children: [
          // User Card
          if (user != null)
            user.when(
              success: (data) => UserItem(user: data),
              failure: (e) => const SizedBox(),
            ),
          if (user != null) const SizedBox(height: LayoutSize.sizeBoxMedium),

          // Repos List
          Expanded(
            child: _buildReposList(
              context: context,
              repos: repos,
              isLoadMoreDone: isLoadMoreDone,
              homeViewModel: homeViewModel,
              searchTextController: searchTextController,
              repoScrollController: repoScrollController,
              l10n: l10n,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, L10n l10n) {
    final appColors = context.appColors;
    final appTextTheme = context.appTextTheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(LayoutSize.sizePadding32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_rounded,
              size: LayoutSize.iconSize80,
              color: appColors.primary.withAlpha(128),
            ),
            const SizedBox(height: LayoutSize.sizeBox24),
            Text(
              l10n.searchGithubUsers,
              style: appTextTheme.s24.bold(),
            ),
            const SizedBox(height: LayoutSize.sizeBox12),
            Text(
              l10n.searchGithubUsersHint,
              style: appTextTheme.s14.copyWith(
                color: appColors.onSurface.withAlpha(153),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String message, L10n l10n) {
    final appColors = context.appColors;
    final appTextTheme = context.appTextTheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(LayoutSize.sizePadding32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_rounded,
              size: LayoutSize.iconSize64,
              color: appColors.error,
            ),
            const SizedBox(height: LayoutSize.sizeBoxMedium),
            Text(
              l10n.errorOccurred,
              style: appTextTheme.s16.bold(),
            ),
            const SizedBox(height: LayoutSize.sizeBox12),
            Text(
              message,
              style: appTextTheme.s14.copyWith(
                color: appColors.onSurface.withAlpha(153),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReposList({
    required BuildContext context,
    required List<Repos> repos,
    required bool isLoadMoreDone,
    required HomeViewModel homeViewModel,
    required TextEditingController searchTextController,
    required ScrollController repoScrollController,
    required L10n l10n,
  }) {
    if (repos.isEmpty) {
      return _buildNoResultState(context, l10n);
    }

    return RefreshIndicator(
      onRefresh: () async => _loadRepos(
        homeViewModel,
        searchTextController.text,
      ),
      child: ListView.builder(
        controller: repoScrollController,
        itemCount: repos.length + 1,
        itemBuilder: (context, index) {
          if (index == repos.length) {
            return _buildLoadMoreIndicator(context, isLoadMoreDone, l10n);
          }
          return AnimateInEffect(
            child: GithubRepoItem(
              repositoryItem: repos[index],
            ),
          );
        },
      ),
    );
  }

  Widget _buildNoResultState(BuildContext context, L10n l10n) {
    final appColors = context.appColors;
    final appTextTheme = context.appTextTheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(LayoutSize.sizePadding32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.folder_open_rounded,
              size: LayoutSize.iconSize64,
              color: appColors.onSurface.withAlpha(77),
            ),
            const SizedBox(height: LayoutSize.sizeBoxMedium),
            Text(
              l10n.noResult,
              style: appTextTheme.s16.copyWith(
                color: appColors.onSurface.withAlpha(153),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadMoreIndicator(BuildContext context, bool isLoadMoreDone, L10n l10n) {
    if (isLoadMoreDone) {
      final appColors = context.appColors;
      final appTextTheme = context.appTextTheme;
      return Padding(
        padding: const EdgeInsets.all(LayoutSize.sizePadding16),
        child: Center(
          child: Text(
            l10n.allRepositoriesLoaded,
            style: appTextTheme.s12.copyWith(
              color: appColors.onSurface.withAlpha(128),
            ),
          ),
        ),
      );
    }

    return const Padding(
      padding: EdgeInsets.all(LayoutSize.sizePadding16),
      child: Center(
        child: SizedBox(
          width: LayoutSize.iconSize24,
          height: LayoutSize.iconSize24,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
    );
  }

  void _loadRepos(HomeViewModel homeViewModel, String username) {
    homeViewModel.refresh();
  }
}

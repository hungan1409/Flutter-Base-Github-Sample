import 'package:app/foundation/keys.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:app/route/app_router.dart';
import 'package:app/ui/animation/animate_in_effect.dart';
import 'package:app/ui/component/dialog/force_update_dialog.dart';
import 'package:app/ui/component/error/container_error_handling.dart';
import 'package:app/ui/home/github_repo_item.dart';
import 'package:app/ui/home/home_page_view_model.dart';
import 'package:app/ui/home/user_item.dart';
import 'package:app/ui/hook/use_l10n.dart';
import 'package:app/ui/hook/use_router.dart';
import 'package:app/ui/theme/layout_size.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

@RoutePage()
class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    final l10n = useL10n();
    final homeViewModel = ref.read(homeViewModelProvider);
    final user = ref.watch(homeViewModelProvider.select((value) => value.user));
    final repos = ref.watch(homeViewModelProvider.select((value) => value.repos));

    final searchTextController = useTextEditingController();

    // for load more
    final isLoadMoreDone = ref.watch(homeViewModelProvider.select((value) => value.isLoadMoreDone));

    final repoScrollController = useScrollController();
    repoScrollController.addListener(() async {
      if (repoScrollController.position.pixels >
          repoScrollController.position.maxScrollExtent - MediaQuery.of(context).size.height) {
        if (homeViewModel.oldLength == repos?.length) {
          // make sure ListView has newest data after previous loadMore
          homeViewModel.loadMoreRepo();
        }
      }
    });

    useEffect(
      () {
        _checkForceUpdate(context);
      },
      [],
    );

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Assets.svgs.github.svg(),
        ),
        title: const Text("Github Sample"),
        automaticallyImplyLeading: false,
        centerTitle: true,
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
          child: Padding(
            padding: const EdgeInsets.all(LayoutSize.sizePaddingMedium),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    hintText: l10n.hintSearch,
                  ),
                  controller: searchTextController,
                  onSubmitted: (text) async {
                    homeViewModel.saveInfoSearch(text);
                    _loadRepos(homeViewModel, text);
                    // scroll to offset 0 when search new user
                    repoScrollController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.ease);
                  },
                ),
                const SizedBox(height: LayoutSize.sizeBoxMedium),
                user == null
                    ? const SizedBox()
                    : user.when(success: (data) {
                        return UserItem(user: data);
                      }, failure: (e) {
                        return const SizedBox();
                      }),
                const SizedBox(height: LayoutSize.sizeBoxMedium),
                Expanded(
                    child: repos == null
                        ? const SizedBox()
                        : repos.isEmpty
                            ? Center(child: Text(l10n.noResult))
                            : RefreshIndicator(
                                onRefresh: () async => _loadRepos(homeViewModel, searchTextController.text),
                                child: ListView.builder(
                                    controller: repoScrollController,
                                    itemCount: repos.length + 1,
                                    itemBuilder: (context, index) {
                                      if (index == repos.length) {
                                        if (isLoadMoreDone) {
                                          return const SizedBox();
                                        }
                                        return const LinearProgressIndicator();
                                      } else {
                                        return AnimateInEffect(child: GithubRepoItem(repositoryItem: repos[index]));
                                      }
                                    })))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _loadRepos(HomeViewModel homeViewModel, String username) {
    homeViewModel.fetchUser(username);
    homeViewModel.refresh();
  }

  Future<void> _checkForceUpdate(BuildContext context) async {
    final packageInfo = await PackageInfo.fromPlatform();
    FirebaseRemoteConfig.instance.fetchAndActivate().then((value) async {
      String forceUpdateVersion = FirebaseRemoteConfig.instance.getString(Keys.forceUpdateVersion);
      String currentVersion = packageInfo.version.split("-")[0];
      debugPrint("Your current app version is $currentVersion");
      debugPrint("The force update app version is $forceUpdateVersion");

      final splitCurrentVersion = currentVersion.split(".");
      final splitForceUpdateVersion = forceUpdateVersion.split(".");

      //Compare version
      try {
        for (int i = 0; i < splitForceUpdateVersion.length; i++) {
          if (splitCurrentVersion.length > i) {
            if (int.parse(splitForceUpdateVersion[i]) > int.parse(splitCurrentVersion[i])) {
              debugPrint("Force update the application!");
              showForceUpdateDialog(context: context, appPackage: packageInfo.packageName);
              return;
            } else if (int.parse(splitForceUpdateVersion[i]) < int.parse(splitCurrentVersion[i])) {
              return;
            }
          } else {
            // in case fore update version have length bigger than current version. ex: 1.0.9.1 vs 1.0.9
            showForceUpdateDialog(context: context, appPackage: packageInfo.packageName);
          }
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    });
  }
}

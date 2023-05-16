import 'package:app/data/model/repos.dart';
import 'package:app/ui/detail/detail_page.dart';
import 'package:app/ui/home/home_page.dart';
import 'package:app/ui/language/language_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'app_router.gr.dart';

part 'provider.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page|Screen,Route',
)
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    //HomeScreen is generated as HomeRoute because
    //of the replaceInRouteName property
    AutoRoute(
      path: '/home',
      page: HomeRoute.page,
      initial: true,
    ),
    AutoRoute(
      path: '/detail',
      page: DetailRoute.page,
    ),
    AutoRoute(
      path: '/language',
      page: LanguageRoute.page,
    ),
  ];
}

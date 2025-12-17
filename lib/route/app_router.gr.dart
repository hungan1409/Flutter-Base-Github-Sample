// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [DetailPage]
class DetailRoute extends PageRouteInfo<DetailRouteArgs> {
  DetailRoute({Key? key, required Repos repos, List<PageRouteInfo>? children})
    : super(
        DetailRoute.name,
        args: DetailRouteArgs(key: key, repos: repos),
        initialChildren: children,
      );

  static const String name = 'DetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailRouteArgs>();
      return DetailPage(key: args.key, repos: args.repos);
    },
  );
}

class DetailRouteArgs {
  const DetailRouteArgs({this.key, required this.repos});

  final Key? key;

  final Repos repos;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, repos: $repos}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DetailRouteArgs) return false;
    return key == other.key && repos == other.repos;
  }

  @override
  int get hashCode => key.hashCode ^ repos.hashCode;
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [LanguagePage]
class LanguageRoute extends PageRouteInfo<void> {
  const LanguageRoute({List<PageRouteInfo>? children})
    : super(LanguageRoute.name, initialChildren: children);

  static const String name = 'LanguageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LanguagePage();
    },
  );
}

/// generated route for
/// [SettingPage]
class SettingRoute extends PageRouteInfo<void> {
  const SettingRoute({List<PageRouteInfo>? children})
    : super(SettingRoute.name, initialChildren: children);

  static const String name = 'SettingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingPage();
    },
  );
}

/// generated route for
/// [TalkerPage]
class TalkerRoute extends PageRouteInfo<void> {
  const TalkerRoute({List<PageRouteInfo>? children})
    : super(TalkerRoute.name, initialChildren: children);

  static const String name = 'TalkerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TalkerPage();
    },
  );
}

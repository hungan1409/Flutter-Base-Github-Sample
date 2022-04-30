// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<HomePage>(
          routeData: routeData, child: const HomePage());
    },
    DetailRoute.name: (routeData) {
      final args = routeData.argsAs<DetailRouteArgs>();
      return MaterialPageX<DetailPage>(
          routeData: routeData,
          child: DetailPage(key: args.key, repos: args.repos));
    },
    LanguageRoute.name: (routeData) {
      return MaterialPageX<LanguagePage>(
          routeData: routeData, child: const LanguagePage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: '/home', fullMatch: true),
        RouteConfig(HomeRoute.name, path: '/home'),
        RouteConfig(DetailRoute.name, path: '/detail'),
        RouteConfig(LanguageRoute.name, path: '/language')
      ];
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [DetailPage]
class DetailRoute extends PageRouteInfo<DetailRouteArgs> {
  DetailRoute({Key? key, required Repos repos})
      : super(DetailRoute.name,
            path: '/detail', args: DetailRouteArgs(key: key, repos: repos));

  static const String name = 'DetailRoute';
}

class DetailRouteArgs {
  const DetailRouteArgs({this.key, required this.repos});

  final Key? key;

  final Repos repos;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, repos: $repos}';
  }
}

/// generated route for
/// [LanguagePage]
class LanguageRoute extends PageRouteInfo<void> {
  const LanguageRoute() : super(LanguageRoute.name, path: '/language');

  static const String name = 'LanguageRoute';
}

part of 'routes_imports.dart';

@AutoRouterConfig(replaceInRouteName: 'Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomePageRoute.page, path: "/"),
        AutoRoute(page: WeatherPageRoute.page),
        AutoRoute(page: WeatherDetailPageRoute.page),
        AutoRoute(page: LoginPageRoute.page)
      ];
}

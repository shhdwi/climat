// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:climat/main.dart' as _i1;
import 'package:climat/src/views/auth/login_screen.dart' as _i2;
import 'package:climat/src/views/auth/splash_screen.dart' as _i3;
import 'package:climat/src/views/weather/climate_screen.dart' as _i4;
import 'package:climat/src/views/weather/search_screen.dart' as _i5;
import 'package:flutter/material.dart' as _i7;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomePageRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    LoginPageRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SplashScreen(),
      );
    },
    WeatherDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<WeatherDetailPageRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.WeatherDetailPage(
          key: args.key,
          cityCode: args.cityCode,
          city: args.city,
        ),
      );
    },
    WeatherPageRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.WeatherPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomePageRoute extends _i6.PageRouteInfo<void> {
  const HomePageRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LoginPage]
class LoginPageRoute extends _i6.PageRouteInfo<void> {
  const LoginPageRoute({List<_i6.PageRouteInfo>? children})
      : super(
          LoginPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginPageRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SplashScreen]
class SplashScreenRoute extends _i6.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.WeatherDetailPage]
class WeatherDetailPageRoute
    extends _i6.PageRouteInfo<WeatherDetailPageRouteArgs> {
  WeatherDetailPageRoute({
    _i7.Key? key,
    required String cityCode,
    required String city,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          WeatherDetailPageRoute.name,
          args: WeatherDetailPageRouteArgs(
            key: key,
            cityCode: cityCode,
            city: city,
          ),
          initialChildren: children,
        );

  static const String name = 'WeatherDetailPageRoute';

  static const _i6.PageInfo<WeatherDetailPageRouteArgs> page =
      _i6.PageInfo<WeatherDetailPageRouteArgs>(name);
}

class WeatherDetailPageRouteArgs {
  const WeatherDetailPageRouteArgs({
    this.key,
    required this.cityCode,
    required this.city,
  });

  final _i7.Key? key;

  final String cityCode;

  final String city;

  @override
  String toString() {
    return 'WeatherDetailPageRouteArgs{key: $key, cityCode: $cityCode, city: $city}';
  }
}

/// generated route for
/// [_i5.WeatherPage]
class WeatherPageRoute extends _i6.PageRouteInfo<void> {
  const WeatherPageRoute({List<_i6.PageRouteInfo>? children})
      : super(
          WeatherPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'WeatherPageRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

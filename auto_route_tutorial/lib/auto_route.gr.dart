// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:auto_route_tutorial/screens/home_screen.dart' as _i1;
import 'package:auto_route_tutorial/screens/on_boarding_screen.dart' as _i2;
import 'package:auto_route_tutorial/screens/payments_screen.dart' as _i3;

/// generated route for
/// [_i1.HomeScreen]
class HomeScreen extends _i4.PageRouteInfo<void> {
  const HomeScreen({List<_i4.PageRouteInfo>? children})
    : super(HomeScreen.name, initialChildren: children);

  static const String name = 'HomeScreen';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeScreen();
    },
  );
}

/// generated route for
/// [_i2.OnBoardingScreen]
class OnBoardingScreen extends _i4.PageRouteInfo<void> {
  const OnBoardingScreen({List<_i4.PageRouteInfo>? children})
    : super(OnBoardingScreen.name, initialChildren: children);

  static const String name = 'OnBoardingScreen';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.OnBoardingScreen();
    },
  );
}

/// generated route for
/// [_i3.PaymentsScreen]
class PaymentsScreen extends _i4.PageRouteInfo<void> {
  const PaymentsScreen({List<_i4.PageRouteInfo>? children})
    : super(PaymentsScreen.name, initialChildren: children);

  static const String name = 'PaymentsScreen';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.PaymentsScreen();
    },
  );
}

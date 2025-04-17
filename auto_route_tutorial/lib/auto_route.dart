import 'package:auto_route/auto_route.dart';
import 'package:auto_route_tutorial/auto_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Page,Route")
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeScreen.page, initial: true),
    AutoRoute(page: PaymentsScreen.page),
    AutoRoute(page: OnBoardingScreen.page),
  ];
}

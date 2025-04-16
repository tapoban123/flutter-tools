import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_tutorial/models/user_model.dart';
import 'package:go_router_tutorial/screens/dashboard_screen.dart';
import 'package:go_router_tutorial/screens/error_screen.dart';
import 'package:go_router_tutorial/screens/home_screen.dart';
import 'package:go_router_tutorial/screens/login_screen.dart';
import 'package:go_router_tutorial/screens/pricing_screen.dart';
import 'package:go_router_tutorial/screens/profile_screen.dart';

// Declaring app routes using GoRouter.
final GoRouter router = GoRouter(
  initialLocation: "/login",
  errorBuilder: (context, state) => const ErrorScreen(),
  routes: <RouteBase>[
    GoRoute(
      name: "/home",
      path: "/home",
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: "/login",
      name: "/login",
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: "/profile",
      name: "/profile",
      pageBuilder: (context, state) {
        // Passing values via extra.
        // Also, using PageRoute animations.
        final UserModel userData = state.extra as UserModel;
        return CustomTransitionPage(
          child: ProfileScreen(userData: userData),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
            final curvedAnimation =
                CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn);

            return SlideTransition(
              position: tween.animate(curvedAnimation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      name: "/pricing",
      path: "/pricing/:price",
      builder: (context, state) {
        // Passing values via path parameters.
        final double amount =
            double.parse(state.pathParameters["price"] ?? "0");
        return PricingScreen(amount: amount);
      },
    ),
    GoRoute(
      name: "/dashboard",
      path: "/dashboard/:income",
      builder: (context, state) {
        final double monthlyIncome =
            double.parse(state.pathParameters["income"] ?? "0");

        return DashboardScreen(monthlyIncome: monthlyIncome);
      },
    ),
  ],
);

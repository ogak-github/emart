import 'package:emart/core/shared/shared_provider.dart';
import 'package:emart/src/home/screen/product_detail.dart';
import 'package:emart/src/login/screen/login.dart';
import 'package:emart/src/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final navigatorKeyProvider =
    Provider<GlobalKey<NavigatorState>>((ref) => GlobalKey<NavigatorState>());

final routerProvider = Provider<GoRouter>((ref) {
  final navigatorKey = ref.watch(navigatorKeyProvider);
  final prefs = ref.watch(prefsClientProvider);
  final sprefs = ref.watch(prefsProvider).load();

  final routes = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: navigatorKey,
    initialLocation: Routes.home,
    routes: [
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: Routes.login,
        builder: ((context, state) => const Login()),
        redirect: (context, state) {
          if (prefs.isLogin == true) {
            return Routes.home;
          }
          return null;
        },
      ),
      GoRoute(
        path: "${Routes.product}/:id",
        pageBuilder: (context, state) {
          return MaterialPage(
              child: ProductDetail(id: state.params["id"] ?? ""));
        },
      ),
    ],
    redirect: (context, state) {
      return null;

      /*     if (prefs.isLogin != true && prefs.getAuthToken.isEmpty) {
        return Routes.login;
      } else if (state.location == '/') {
        // User is authenticated and accessing the root path, redirect to home
        return Routes.home;
      } else {
        return null;
      } */
    },
  );

  return routes;
});

class Routes {
  static const String home = '/';
  static const String login = '/login';
  static const String cart = '/cart';
  static const String product = '/product';
  static const String profile = '/profile';
}

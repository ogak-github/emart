import 'package:emart/core/database/shared_preferences/prefs_client.dart';
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

  final routes = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: navigatorKey,
    initialLocation: Routes.home,
    redirect: (context, state) async {
      if (state.path != Routes.login) {
        final user = await prefs.getAuthToken(PrefKey.authToken);
        if (user == null || user == "") {
          return Routes.login;
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: Routes.login,
        builder: ((context, state) => const Login()),
        redirect: (context, state) async {
          final token = await prefs.getAuthToken(PrefKey.authToken);
          if (token == null || token == "") {
            return null;
          }
          return Routes.home;
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

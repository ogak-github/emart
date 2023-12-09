import 'package:emart_v2/core/database/user_setting.dart';
import 'package:emart_v2/ui/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../ui/login/login_screen.dart';

class Routes {
  static const String home = '/';
  static const String login = '/login';
  static const String cart = '/cart';
  static const String product = '/product';
  static const String profile = '/profile';
}

final navigatorKeyProvider =
    Provider<GlobalKey<NavigatorState>>((ref) => GlobalKey<NavigatorState>());

final routerProvider = Provider<GoRouter>((ref) {
  final navigatorKey = ref.watch(navigatorKeyProvider);
  final db = ref.watch(userSettingProvider);

  final routes = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: navigatorKey,
    initialLocation: MainScreen.path,
    redirect: (context, state) async {
      if (state.path != LoginScreen.path) {
        final user = await db.getSetting("user_token");
        if (user == null || user == "") {
          return LoginScreen.path;
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        path: MainScreen.path,
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: MainScreen(),
          );
        },
      ),
      GoRoute(
        path: LoginScreen.path,
        builder: ((context, state) => const LoginScreen()),
        redirect: (context, state) async {
          final token = await db.getSetting("user_token");
          if (token == null || token == "") {
            return null;
          }
          return MainScreen.path;
        },
      ),
      /*  
    
      GoRoute(
        path: "${Routes.product}/:id",
        pageBuilder: (context, state) {
          return MaterialPage(
              child: ProductDetail(id: state.pathParameters["id"] ?? ""));
        },
      ), */
    ],
  );

  return routes;
});

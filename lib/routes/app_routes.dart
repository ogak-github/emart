import 'package:emart/main.dart';
import 'package:emart/routes/routes.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  final routes = GoRouter(
    initialLocation: Routes.home,
    routes: [
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const MyHomePage(
          title: "HomePage",
        ),
      ),
      GoRoute(path: Routes.cart),
      GoRoute(path: Routes.login),
      GoRoute(path: Routes.profile),
    ],
  );
}

import 'package:emart/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/shared/shared_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouterConfig = ref.watch(routerProvider);
    final prefs = ref.watch(prefsClientProvider);
    print("INI STATE ISLOGIN: ${prefs.isLogin}");
    print("INI TOKEN: ${prefs.getAuthToken}");
    return MaterialApp.router(
      routerConfig: goRouterConfig,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

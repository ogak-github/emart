import 'dart:math';

import 'package:emart_v2/theme/theme_manager.dart';
import 'package:emart_v2/theme/theme_variants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../routes/app_routes.dart';

void app() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeManager = ref.watch(themeManagerProvider);
    final goRouterConfig = ref.watch(routerProvider);
    return MaterialApp.router(
      routerConfig: goRouterConfig,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeManager,
      
    );
  }
}

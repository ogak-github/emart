import 'package:emart_v2/provider/auth_provider.dart';
import 'package:emart_v2/theme/theme_manager.dart';
import 'package:emart_v2/ui/home/list_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeManagerProvider);
    bool isDark = theme == ThemeMode.dark;

    return Scaffold(
      /* appBar: AppBar(
        title: const Text("Home Screen"),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(themeManagerProvider.notifier).toggleTheme(!isDark);
            },
            icon: isDark
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.dark_mode),
          ),
          IconButton(
            onPressed: () {
              ref.read(authStateProvider.notifier).logout();
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ), */
      body: Container(
        padding: const EdgeInsets.all(2),
        child: const ListProduct(),
      ),
    );
  }
}

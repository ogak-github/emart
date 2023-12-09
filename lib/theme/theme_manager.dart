import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeManager extends StateNotifier<ThemeMode> {
  ThemeManager() : super(ThemeMode.system) {
    themeInit();
  }

  ThemeMode themeInit() {
    if (state == ThemeMode.system) {
      bool isDark = Platform.isIOS || Platform.isAndroid
          ? MediaQueryData.fromView(
                      WidgetsBinding.instance.platformDispatcher.views.first)
                  .platformBrightness ==
              Brightness.dark
          : false;

      state = isDark ? ThemeMode.dark : ThemeMode.light;
    }
    return state;
  }

  toggleTheme(bool isDark) {
    if (state == ThemeMode.system) {
      bool isSystemDark = Platform.isIOS || Platform.isAndroid
          ? MediaQueryData.fromView(
                      WidgetsBinding.instance.platformDispatcher.views.first)
                  .platformBrightness ==
              Brightness.dark
          : false;

      state = isSystemDark ? ThemeMode.dark : ThemeMode.light;
    } else {
      state = isDark ? ThemeMode.dark : ThemeMode.light;
    }
  }
}

final themeManagerProvider = StateNotifierProvider<ThemeManager, ThemeMode>(
  (ref) => ThemeManager(),
);

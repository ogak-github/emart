import 'dart:async';
import 'dart:developer';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as p;
import 'package:riverpod_annotation/riverpod_annotation.dart';

final userSettingProvider = Provider((ref) => UserSetting());

class UserSetting {
  final Completer<Box> _userSetting = Completer();

  UserSetting() {
    pathDirectory().then((path) {
      Hive.init(path);
      Hive.openBox('user_setting').then((box) {
        _userSetting.complete(box);
      });
    });
  }

  Future<String> pathDirectory() async {
    final appDocumentDirectory = await p.getApplicationDocumentsDirectory();
    return appDocumentDirectory.path;
  }

  Future<T> getSetting<T>(String key) async {
    var box = await _userSetting.future;
    return box.get(key);
  }

  Future<void> setSetting<T>(String key, T value) async {
    try {
      var box = await _userSetting.future;
      box.put(key, value);
    } catch (e) {
      log('Error set new setting: $e');
      throw Exception('Failed to set new setting: $e');
    }
  }

  Future<void> removeSetting<T>(String key) async {
    try {
      var box = await _userSetting.future;
      await box.delete(key);
    } catch (e) {
      log('Error removing setting: $e');
      throw Exception('Failed to remove setting: $e');
    }
  }

  Future<AppTheme> getThemeSetting() async {
    var box = await _userSetting.future;
    var themeStr =
        box.get('app_theme', defaultValue: AppTheme.SYSTEM.toString());
    return AppTheme.values.firstWhere((thm) => themeStr == thm.toString());
  }

  Future<void> setThemeSetting(AppTheme theme) async {
    var box = await _userSetting.future;
    return box.put('app_theme', theme.toString());
  }
}

// ignore: constant_identifier_names
enum AppTheme { SYSTEM, LIGHT, DARK }

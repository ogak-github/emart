import 'dart:developer';

import 'package:emart_v2/core/database/user_setting.dart';
import 'package:emart_v2/core/interface/auth_datasource.dart';
import 'package:emart_v2/core/model/auth_response.dart';
import 'package:emart_v2/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../routes/app_routes.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthState extends _$AuthState implements Authdatasource {
  @override
  Future<AuthResponse?> build() async {
    return null;
  }

  @override
  Future<AuthResponse> login(username, password) async {
    final db = ref.read(userSettingProvider);
    state = const AsyncLoading();
    final repo = ref.watch(authRepositoryProvider);
    final result = await repo.login(username, password);
    state = AsyncValue.data(result);
    log(result.toJson().toString(), name: "STATUS CODE");
    if (result.code != 200) {
      _showErrorSnackbar(result.token);
    } else {
      await db.setSetting("user_token", result.token);
    }

    return result;
  }

  @override
  void logout() async {
    final db = ref.read(userSettingProvider);
    await db.removeSetting("user_token");

    ref.invalidate(routerProvider);
  }

  void _showErrorSnackbar(String errorMessage) {
    final snackBar = SnackBar(
      content: Text(errorMessage),
    );

    ScaffoldMessenger.of(ref.read(navigatorKeyProvider).currentContext!)
        .showSnackBar(snackBar);
  }
}

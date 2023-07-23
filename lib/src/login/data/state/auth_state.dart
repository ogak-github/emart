import 'package:emart/core/shared/shared_provider.dart';
import 'package:emart/src/login/data/model/auth_response.dart';
import 'package:emart/src/login/data/model/login.dart';
import 'package:emart/src/login/data/repository/auth_interface.dart';
import 'package:emart/src/login/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../routes/app_routes.dart';
part 'auth_state.g.dart';

@riverpod
class AuthState extends _$AuthState implements AuthInterface {
  @override
  Future<AuthResponse?> build() async {
    return null;
  }

  @override
  Future<AuthResponse> login(Login credentials) async {
    final prefsClient = ref.read(prefsClientProvider);
    state = const AsyncLoading();
    final repo = ref.watch(authRepositoryProvider);
    final result = await repo.login(credentials);
    state = AsyncValue.data(result);
    if (result.code != 200) {
      _showErrorSnackbar(result.token);
    }
    await prefsClient.saveAuthToken(result.token);
    await prefsClient.saveIsLogin(result.code == 200);
    print("Auth Repository => getToken: ${prefsClient.getAuthToken}");
    print("Auth Repository => isLogin : ${prefsClient.isLogin}");
    return result;
  }

  @override
  bool checkAuth() {
    final prefsClient = ref.read(prefsClientProvider);
    return prefsClient.isLogin;
  }

  @override
  void logout() async {
    final prefsClient = ref.read(prefsClientProvider);
    await prefsClient.removeAuthToken();
    await ref.read(prefsClientProvider).saveIsLogin(false);
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

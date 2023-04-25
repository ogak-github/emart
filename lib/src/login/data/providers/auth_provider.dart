import 'package:emart/core/shared/shared_provider.dart';
import 'package:emart/src/login/data/repository/auth_repository.dart';
import 'package:riverpod/riverpod.dart';

final authProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
    ref.read(dioClientProvider),
    ref.read(prefsClientProvider),
  );
});

//final authStateProvider = StateNotifierProvider((ref) {});

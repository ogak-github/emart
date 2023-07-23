import 'package:emart/src/login/data/model/login.dart';

import '../model/auth_response.dart';

abstract class AuthInterface {
  Future<AuthResponse> login(Login credentials);
  bool checkAuth();
  void logout();
}

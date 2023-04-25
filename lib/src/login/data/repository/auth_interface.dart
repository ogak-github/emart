import 'package:emart/src/login/data/model/login.dart';

abstract class AuthInterface {
  Future<dynamic> login(Login credentials);
  void logout();
}

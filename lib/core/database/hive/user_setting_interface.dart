import 'package:emart/core/database/hive/user_setting.dart';

abstract class UserSettingInterface {
  Future<void> saveSetting(UserSetting settings);
  Future<UserSetting> loadSetting();
}

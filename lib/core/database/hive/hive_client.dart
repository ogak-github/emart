import 'dart:developer';

import 'package:emart/core/database/hive/user_setting.dart';
import 'package:emart/core/database/hive/user_setting_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';

final hiveClientProvider = Provider<HiveClient>((ref) => HiveClient());

class HiveClient implements UserSettingInterface {
  HiveClient();

  Future<bool> initDatabase() async {
    try {
      if (!kIsWeb) {
        final appDocumentDirectory = await getApplicationDocumentsDirectory();
        await Hive.initFlutter(appDocumentDirectory.path);
      } else {
        await Hive.initFlutter();
      }

      //await registerAdapters();
      await hiveOpen();

      return true;
    } on HiveError catch (e) {
      log(e.toString());
      rethrow;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<bool> hiveOpen() async {
    /*  if (!Hive.isBoxOpen(_searchHistoryBox)) {
      await Hive.openBox<SearchHistory>(_searchHistoryBox);
    }
    if (!Hive.isBoxOpen(_bookmarkBox)) {
      await Hive.openBox<Bookmark>(_bookmarkBox);
    } */
    return true;
  }

  Future<bool> registerAdapters() async {
   /*  if (!Hive.isAdapterRegistered(CoordAdapter().typeId)) {
      Hive.registerAdapter<Coord>(CoordAdapter());
    }
    if (!Hive.isAdapterRegistered(BookmarkAdapter().typeId)) {
      Hive.registerAdapter<Bookmark>(BookmarkAdapter());
    }
    if (!Hive.isAdapterRegistered(SearchHistoryAdapter().typeId)) {
      Hive.registerAdapter<SearchHistory>(SearchHistoryAdapter());
    } */
    return true;
  }

  @override
  Future<UserSetting> loadSetting() {
    // TODO: implement loadSetting
    throw UnimplementedError();
  }

  @override
  Future<void> saveSetting(UserSetting settings) {
    // TODO: implement saveSetting
    throw UnimplementedError();
  }
}

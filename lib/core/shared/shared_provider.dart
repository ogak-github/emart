import 'package:dio/dio.dart';
import 'package:emart/core/database/shared_preferences/prefs.dart';
import 'package:emart/core/database/shared_preferences/prefs_client.dart';
import 'package:emart/core/dio/dio_client.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final dioInstanceProvider = Provider<Dio>((ref) {
  return Dio();
});

final dioClientProvider = Provider<DioClient>((ref) {
  final dio = ref.watch(dioInstanceProvider);
  return DioClient(dio);
});

final prefsProvider = Provider<Prefs>((ref) {
  return Prefs();
});

final prefsClientProvider = Provider<PrefsClient>((ref) {
  return PrefsClient(ref.read(prefsProvider));
});

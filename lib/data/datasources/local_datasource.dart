import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_phones_app/core/constant.dart';
import 'package:smart_phones_app/domain/entities/smart_phone.dart';

abstract class LocalDataSource {
  Future<List<SmartPhone>> getCacheSmartPhones();
  Future<void> cacheSmartPhones(List<SmartPhone> smartPhones);
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheSmartPhones(List<SmartPhone> smartPhones) {
    return sharedPreferences.setString(
        Constant.cacheSmartPhones, json.encode(smartPhones.toString()));
  }

  @override
  Future<List<SmartPhone>> getCacheSmartPhones() {
    final jsonString = sharedPreferences.getString(Constant.cacheSmartPhones);
    if (jsonString != null) {
      List<SmartPhone> smartPhones = [];
      var data = json.decode(jsonString);
      for (Map<String, dynamic> i in data) {
        smartPhones.add(SmartPhone.fromJson(i));
      }
      return Future.value(smartPhones);
    } else {
      throw UnimplementedError();
    }
  }
}

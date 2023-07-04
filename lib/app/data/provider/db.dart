import 'package:hive_flutter/hive_flutter.dart';

class DbProvider {
  static const String _settingBoxName = 'setting';
  final Box _settingBox = Hive.box(_settingBoxName);

  static Future<void> init() async {
    await Hive.initFlutter();
    await Future.wait([
      Hive.openBox(_settingBoxName),
    ]);
  }

  Future<void> setSetting(String key, dynamic value) async {
    await _settingBox.put(key, value);
  }

  T getSetting<T>(String key, {T? defaultValue}) {
    return _settingBox.get(key, defaultValue: defaultValue);
  }
}
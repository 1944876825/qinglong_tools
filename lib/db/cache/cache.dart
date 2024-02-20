// 缓存管理类
import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  SharedPreferences? prefs;
  Cache._() {
    init();
  }
  static Cache? _instance;
  Cache._pre(this.prefs);
  static Future<Cache> preInit() async {
    if (_instance == null) {
      var prefs = await SharedPreferences.getInstance();
      _instance = Cache._pre(prefs);
    }
    return _instance!;
  }

  static Cache getInstance() {
    _instance ??= Cache._();
    return _instance!;
  }

  void init() async {
    prefs ??= await SharedPreferences.getInstance();
  }

  setString(String key, String value) {
    prefs?.setString(key, value);
  }

  setDouble(String key, double value) {
    prefs?.setDouble(key, value);
  }

  setInt(String key, int value) {
    prefs?.setInt(key, value);
  }

  setBool(String key, bool value) {
    prefs?.setBool(key, value);
  }

  setStringList(String key, List<String> value) {
    prefs?.setStringList(key, value);
  }

  T? get<T>(String key) {
    return prefs?.get(key) as T?;
  }

  List<String>? getStringList(String key) {
    return prefs?.getStringList(key);
  }
}

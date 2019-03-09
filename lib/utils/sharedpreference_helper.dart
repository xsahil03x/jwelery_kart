import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

SharedPrefsHelper prefsHelper = new SharedPrefsHelper();

class SharedPrefsHelper {
  static final SharedPrefsHelper _instance = SharedPrefsHelper._internal();

  SharedPreferences _prefs;

  final String prefsIsLogin = "ISLOGIN";

  final String prefsUserPhone = "USERPHONE";

  set isLogin(value) => _prefs.setBool(prefsIsLogin, value);

  get isLogin => _prefs.getBool(prefsIsLogin) ?? false;

  set userPhone(value) => _prefs.setString(prefsUserPhone, value);

  get userPhone => _prefs.getString(prefsUserPhone);

  factory SharedPrefsHelper() {
    return _instance;
  }

  SharedPrefsHelper._internal();

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    return 0;
  }

  void checkIsInitialize() {
    assert(_prefs != null,
        "Call prefsHelper.initialize first before using Shared Prefs");
  }

  void clear() {
    _prefs.clear();
  }
}

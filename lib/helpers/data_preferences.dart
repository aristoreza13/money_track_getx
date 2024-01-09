// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class DataPreferences {
  static late SharedPreferences _preferences;

  static const FIRST_INIT = 'first_init';
  static const ALREADY_LOGIN = 'already_login';
  static const _keyEmail = 'email';
  static const _keyPhotoUrl = 'photoUrl';
  static const _keyDisplayName = 'displayName';
  static const _keyPassword = 'password';
  static const _keyBalance = 'balance';
  static const _keyIncome = 'income';
  static const _keyExpense = 'expense';

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
    await _preferences.setString(FIRST_INIT, "first_init");
    return _preferences;
  }

  static String? getInit() {
    final data = _preferences.getString(FIRST_INIT);

    if (data != null) return data;
    return null;
  }

  static Future clear() async {
    await _preferences.clear();
  }

  static Future setLoggedIn() async {
    await _preferences.setString(ALREADY_LOGIN, "already_login");
  }

  static String? getLoggedIn() {
    final data = _preferences.getString(ALREADY_LOGIN);

    if (data != null) return data;
    return null;
  }

  static Future setEmail(String email) async {
    await _preferences.setString(_keyEmail, email);
  }

  static String? getEmail() {
    final data = _preferences.getString(_keyEmail);

    if (data != null) return data;
    return null;
  }

  static Future setPhotoUrl(String photoUrl) async {
    await _preferences.setString(_keyPhotoUrl, photoUrl);
  }

  static String? getPhotoUrl() {
    final data = _preferences.getString(_keyPhotoUrl);

    if (data != null) return data;
    return null;
  }

  static Future setDisplayName(String displayName) async {
    await _preferences.setString(_keyDisplayName, displayName);
  }

  static String? getDisplayName() {
    final data = _preferences.getString(_keyDisplayName);

    if (data != null) return data;
    return null;
  }

  static Future setPassword(String password) async {
    await _preferences.setString(_keyPassword, password);
  }

  static String? getPassword() {
    final data = _preferences.getString(_keyPassword);

    if (data != null) return data;
    return null;
  }

  static Future setBalance(int balance) async {
    await _preferences.setInt(_keyBalance, balance);
  }

  static int? getBalance() {
    final data = _preferences.getInt(_keyBalance);

    if (data != null) return data;
    return null;
  }

  static Future setIncome(int income) async {
    await _preferences.setInt(_keyIncome, income);
  }

  static int? getIncome() {
    final data = _preferences.getInt(_keyIncome);

    if (data != null) return data;
    return null;
  }

  static Future setExpense(int expense) async {
    await _preferences.setInt(_keyExpense, expense);
  }

  static int? getExpense() {
    final data = _preferences.getInt(_keyExpense);

    if (data != null) return data;
    return null;
  }
}

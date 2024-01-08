// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class DataPreferences {
  static late SharedPreferences _preferences;

  static const FIRST_INIT = "first_init";
  static const _keyBalance = 'balance';
  static const _keyIncome = 'income';
  static const _keyExpense = 'expense';

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
    await _preferences.setString(FIRST_INIT, "first_init");
    return _preferences;
  }

  static Future getInit() async {
    final data = _preferences.getString(FIRST_INIT);

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

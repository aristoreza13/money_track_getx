import 'package:hive/hive.dart';
import 'package:money_track_getx/app/data/models/user_data.dart';

import '../app/data/models/transaction_item.dart';

class UserService {
  final String boxName = "userBox";

  Future<Box<UserData>> get _box async => await Hive.openBox<UserData>(boxName);

  Future<void> addUserData(UserData item) async {
    var box = await _box;
    await box.add(item);
  }

  Future<List<UserData>> getAllUsers() async {
    var box = await _box;
    var data = box.values.toList();
    return data;
  }

  Future<UserData> getUserData(String email) async {
    var box = await _box;
    var data = box.values.firstWhere((element) => element.email == email);
    return data;
  }

  // Future<void> deleteTransaction(int index) async {
  //   var box = await _box;
  //   await box.delete(index);
  // }

  // Future<void> deleteTransactionById(int index) async {
  //   var box = await _box;
  //   await box.deleteAt(index);
  // }

  Future<void> updateUser(int index, UserData userData) async {
    var box = await _box;
    await box.putAt(index, userData);
  }
}

import 'package:hive/hive.dart';
import 'package:money_track_getx/app/data/models/transaction_item.dart';

class TransactionService {
  final String boxName = "transactionBox";

  Future<Box<TransactionItem>> get _box async => await Hive.openBox<TransactionItem>(boxName);

  Future<void> addItem(TransactionItem item) async {
    var box = await _box;
    await box.add(item);
  }

  Future<List<TransactionItem>> getAllTransaction() async {
    var box = await _box;
    var data = box.values.toList();
    return data;
  }

  Future<void> deleteTransaction(int index) async {
    var box = await _box;
    await box.delete(index);
  }

  Future<void> deleteTransactionById(int index) async {
    var box = await _box;
    await box.deleteAt(index);
  }

  Future<void> updateIsCompleted(int index, TransactionItem item) async {
    var box = await _box;
    item.isCompleted = !item.isCompleted;
    await box.putAt(index, item);
  }
}

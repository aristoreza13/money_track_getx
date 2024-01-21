import 'package:hive_flutter/hive_flutter.dart';

part 'transaction_item.g.dart';

@HiveType(typeId: 2)
class TransactionItem {
  @HiveField(0)
  final String type;

  @HiveField(1)
  final String category;

  @HiveField(2)
  final int amount;

  @HiveField(3)
  final String date;

  @HiveField(5, defaultValue: false)
  bool isCompleted;

  TransactionItem(this.date, this.amount, this.isCompleted, this.type, this.category);
}

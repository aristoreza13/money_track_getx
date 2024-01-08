import 'package:hive_flutter/hive_flutter.dart';

part 'transaction_item.g.dart';

@HiveType(typeId: 1)
class TransactionItem {
  @HiveField(0)
  final String status;

  @HiveField(1)
  final String date;

  @HiveField(2)
  final String transactionType;

  @HiveField(3)
  final int amount;

  @HiveField(4)
  final String type;

  @HiveField(5, defaultValue: false)
  bool isCompleted;

  TransactionItem(
      this.status, this.date, this.amount, this.transactionType, this.isCompleted, this.type);
}

import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_track_getx/app/data/models/transaction_item.dart';

part 'user_data.g.dart';

@HiveType(typeId: 1)
class UserData {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String email;

  @HiveField(2)
  List<TransactionItem>? transactionItem = [];

  UserData(this.email, this.name, this.transactionItem);
}

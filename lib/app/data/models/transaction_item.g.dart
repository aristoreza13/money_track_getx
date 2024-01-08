// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionItemAdapter extends TypeAdapter<TransactionItem> {
  @override
  final int typeId = 1;

  @override
  TransactionItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionItem(
      fields[0] as String,
      fields[1] as String,
      fields[3] as int,
      fields[2] as String,
      fields[5] == null ? false : fields[5] as bool,
      fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionItem obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.transactionType)
      ..writeByte(3)
      ..write(obj.amount)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.isCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

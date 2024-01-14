import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../data/models/transaction_item.dart';

class StatsController extends GetxController {
  List<ChartData> chartData = [
    ChartData('David', 25),
    ChartData('Steve', 38),
    ChartData('Jack', 34),
    ChartData('Others', 52)
  ];

  List<ChartData> chartTest = [];
  List<TransactionItem> listTransactions = [];

  TooltipBehavior tooltipBehavior = TooltipBehavior(enable: true);

  openTransactionBox() async {
    // print(Hive.box<TransactionItem>('transactionBox').values.toList());
    listTransactions = Hive.box<TransactionItem>('transactionBox').values.toList();
    chartTest = listTransactions.map((e) => ChartData(e.category, e.amount.toDouble())).toList();
//  chartTest
  }

  @override
  void onInit() async {
    openTransactionBox();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}

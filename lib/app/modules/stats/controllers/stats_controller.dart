import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../data/models/transaction_item.dart';

class StatsController extends GetxController {
  List<ChartData> chartData = [
    ChartData('David', 25),
    ChartData('Steve', 38),
    ChartData('Jack', 34),
    ChartData('Others', 52),
  ];

  RxList<ChartData> chartTest = <ChartData>[
    ChartData("Income", 0),
    ChartData("Accomodation", 0),
    ChartData("Food n Beverages", 0),
    ChartData("Lifestyle", 0),
    ChartData("Medical", 0),
    ChartData("Daily Needs", 0),
  ].obs;
  RxList<TransactionItem> listTransactions = RxList.empty(growable: true);

  TooltipBehavior tooltipBehavior = TooltipBehavior(enable: true);

  openTransactionBox() async {
    var box = await Hive.openBox<TransactionItem>('transactionBox');
    listTransactions.value = box.values.toList();

    var incomeList = listTransactions.where((element) => element.type == 'income');
    var accomodationList = listTransactions.where((element) => element.category == 'Accomodation');
    var fnbList = listTransactions.where((element) => element.category == 'Food n Beverages');
    var lifestyleList = listTransactions.where((element) => element.category == 'Lifestyle');
    var medicalList = listTransactions.where((element) => element.category == 'Medical');
    var dailyNeedsList = listTransactions.where((element) => element.category == 'Daily Needs');

    print(accomodationList);

    chartTest.value = <ChartData>[
      ChartData("Income", incomeList.fold(0, (sum, element) => sum + element.amount)),
      ChartData("Accomodation", accomodationList.fold(0, (sum, element) => sum + element.amount)),
      ChartData("Food n Beverages", fnbList.fold(0, (sum, element) => sum + element.amount)),
      ChartData("Lifestyle", lifestyleList.fold(0, (sum, element) => sum + element.amount)),
      ChartData("Medical", medicalList.fold(0, (sum, element) => sum + element.amount)),
      ChartData("Daily Needs", dailyNeedsList.fold(0, (sum, element) => sum + element.amount)),
    ];

    // chartTest.value =
    //     listTransactions.map((e) => ChartData(e.category, e.amount.toDouble())).toList();
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

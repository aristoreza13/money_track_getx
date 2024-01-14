import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:money_track_getx/app/data/models/transaction_item.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controllers/stats_controller.dart';

class StatsView extends GetView<StatsController> {
  const StatsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final StatsController statsC = Get.put(StatsController());
    final StatsController statsC = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('StatsView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SfCircularChart(
              tooltipBehavior: statsC.tooltipBehavior,
              title: ChartTitle(text: ''),
              legend: const Legend(isVisible: true),
              series: <CircularSeries>[
                // Render pie chart
                PieSeries<ChartData, String>(
                  dataSource: statsC.chartTest,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                )
              ],
            ),
            ListView.builder(
              itemCount: statsC.listTransactions.length,
              itemBuilder: (context, index) {
                TransactionItem transactionItem = statsC.listTransactions[index];
                return ListTile(
                  title: Text(transactionItem.category),
                  subtitle: Text(transactionItem.amount.toString()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

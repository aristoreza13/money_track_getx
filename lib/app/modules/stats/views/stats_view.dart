import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:money_track_getx/helpers/currency_helper.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../common/Colors.dart';
import '../controllers/stats_controller.dart';

class StatsView extends GetView<StatsController> {
  const StatsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final StatsController statsC = Get.put(StatsController());
    // final StatsController statsC = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Statistics'),
        foregroundColor: AppColors.blackColor,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => statsC.chartTest.isEmpty
                  ? const Center(child: Text("No data"))
                  : SfCircularChart(
                      tooltipBehavior: statsC.tooltipBehavior,
                      // title: ChartTitle(text: 'Statistic'),
                      legend: const Legend(isVisible: true),
                      series: <CircularSeries>[
                        PieSeries<ChartData, String>(
                          dataSource: statsC.chartTest,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,
                          dataLabelSettings: const DataLabelSettings(isVisible: true),
                        )
                      ],
                    ),
            ),
            Container(
              height: Get.height * 0.44,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              // color: Colors.red,
              child: Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: statsC.chartTest.length,
                  itemBuilder: (context, index) {
                    ChartData data = statsC.chartTest[index];
                    return Card(
                      elevation: 4,
                      child: ListTile(
                        title: Text(data.x),
                        subtitle: Text(CurrencyHelper.convertToIdr(data.y)),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Expanded(
            //   child:
            // ListView.builder(
            //     shrinkWrap: true,
            //     itemCount: statsC.listTransactions.length,
            //     itemBuilder: (context, index) {
            //       TransactionItem transactionItem = statsC.listTransactions[index];
            //       return ListTile(
            //         title: Text(transactionItem.category),
            //         subtitle: Text(transactionItem.amount.toString()),
            //       );
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../common/Colors.dart';
import '../controllers/stats_controller.dart';

class StatsView extends GetView<StatsController> {
  const StatsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final StatsController statsC = Get.put(StatsController());
    final StatsController statsC = Get.find();
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
                      title: ChartTitle(text: 'Stats'),
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
            ),
            // SfCircularChart(
            //   tooltipBehavior: statsC.tooltipBehavior,
            //   title: ChartTitle(text: 'Stats'),
            //   legend: const Legend(isVisible: true),
            //   series: <CircularSeries>[
            //     // Render pie chart
            //     PieSeries<ChartData, String>(
            //       dataSource: statsC.chartTest,
            //       xValueMapper: (ChartData data, _) => data.x,
            //       yValueMapper: (ChartData data, _) => data.y,
            //       dataLabelSettings: const DataLabelSettings(isVisible: true),
            //     )
            //   ],
            // ),
            // Expanded(
            //   child: ListView.builder(
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

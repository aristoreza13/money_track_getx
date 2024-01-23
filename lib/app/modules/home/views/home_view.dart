import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:money_track_getx/app/data/models/transaction_item.dart';
import 'package:money_track_getx/app/modules/profile/controllers/profile_controller.dart';
import 'package:money_track_getx/app/modules/stats/controllers/stats_controller.dart';
import 'package:money_track_getx/common/Colors.dart';
import 'package:money_track_getx/helpers/currency_helper.dart';
import 'package:money_track_getx/helpers/data_preferences.dart';
import 'package:money_track_getx/widgets/custom_input.dart';

import '../../../../services/transaction_service.dart';
import '../../../../services/user_service.dart';
import '../../../data/models/user_data.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final HomeController homeC = Get.find();
    final ProfileController profileC = Get.find();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.height * 0.3),
        child: Stack(
          children: [
            Container(
              height: Get.height * 0.3,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [AppColors.yellowLight, AppColors.purpleLight],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Obx(
                      () => Text(
                        "Hello, ${profileC.nameText}",
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: AppColors.purpleMedium,
                      radius: 25.0,
                      backgroundImage: profileC.photoUrl.value == ""
                          ? const AssetImage('assets/images/goat.png') as ImageProvider
                          : NetworkImage(
                              profileC.photoUrl.value,
                            ),
                    ),
                  ]),
                  const Text(
                    "Total balance",
                    style: TextStyle(fontSize: 14),
                  ),
                  Obx(
                    () => RichText(
                      text: TextSpan(
                          text: "Rp ",
                          style: const TextStyle(color: AppColors.blackColor),
                          children: [
                            homeC.totalBalance.value == 0
                                ? TextSpan(
                                    text: CurrencyHelper.convertToCoin(0),
                                    // text: CurrencyHelper.convertToCoin(int.parse(),
                                    style: const TextStyle(fontSize: 32))
                                : TextSpan(
                                    text: CurrencyHelper.convertToCoin(homeC.totalBalance.value),
                                    // text: CurrencyHelper.convertToCoin(int.parse(),
                                    style: const TextStyle(fontSize: 32)),
                          ]),
                    ),
                  ),
                  const Spacer(),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        homeC.incomeCount.value == 0
                            ? buildIncomeExpense(
                                "Income",
                                0,
                              )
                            : buildIncomeExpense(
                                "Income",
                                homeC.incomeCount.value,
                              ),
                        homeC.expenseCount.value == 0
                            ? buildIncomeExpense(
                                "Expenses",
                                0,
                              )
                            : buildIncomeExpense(
                                "Expenses",
                                homeC.expenseCount.value,
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: homeC.quotesList
                  .map((quote) => Image.asset(
                        quote,
                        width: Get.width * 0.9,
                      ))
                  .toList(),
              options: CarouselOptions(
                autoPlayInterval: const Duration(seconds: 5),
                autoPlay: true,
                viewportFraction: 1,
                enlargeCenterPage: false,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text("Transaction"),
                  GestureDetector(
                    child: const Text(
                      "See all",
                      style: TextStyle(color: AppColors.purpleMedium),
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //   height: Get.height,
            //   margin: const EdgeInsets.all(20),
            //   child: FutureBuilder(
            //     future: homeC.transactionService.getAllTransaction(),
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.done) {
            //         return ValueListenableBuilder(
            //           valueListenable: Hive.box<TransactionItem>('transactionBox').listenable(),
            //           builder: (context, box, _) {
            //             if (box.isEmpty) {
            //               return const Text("No data");
            //             }
            //             return ListView.separated(
            //               shrinkWrap: true,
            //               physics: const NeverScrollableScrollPhysics(),
            //               itemCount: box.values.length,
            //               separatorBuilder: (BuildContext context, int index) {
            //                 return const SizedBox(height: 10);
            //               },
            //               itemBuilder: (BuildContext context, int index) {
            //                 var transaction = box.getAt(index);
            //                 return Container(
            //                   height: 75,
            //                   width: Get.width,
            //                   padding: const EdgeInsets.symmetric(horizontal: 20),
            //                   decoration: BoxDecoration(
            //                     color: Colors.white,
            //                     borderRadius: BorderRadius.circular(30),
            //                     border: Border.all(color: AppColors.greyText, width: 1),
            //                   ),
            //                   child: Row(
            //                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                     children: [
            //                       Container(
            //                         height: 35,
            //                         width: 35,
            //                         decoration: BoxDecoration(
            //                             color: AppColors.purpleMedium,
            //                             borderRadius: BorderRadius.circular(10)),
            //                         child: const Center(
            //                             child: Icon(
            //                           Icons.shopping_bag,
            //                           color: AppColors.whiteColor,
            //                         )),
            //                       ),
            //                       const SizedBox(width: 10),
            //                       Column(
            //                         mainAxisAlignment: MainAxisAlignment.center,
            //                         crossAxisAlignment: CrossAxisAlignment.start,
            //                         children: [
            //                           Text(
            //                             transaction!.date,
            //                             style: const TextStyle(color: AppColors.greyText),
            //                           ),
            //                           Text(transaction.category,
            //                               style: const TextStyle(
            //                                   color: AppColors.blackColor,
            //                                   fontSize: 16,
            //                                   fontWeight: FontWeight.bold)),
            //                         ],
            //                       ),
            //                       const Spacer(),
            //                       Column(
            //                         mainAxisAlignment: MainAxisAlignment.center,
            //                         crossAxisAlignment: CrossAxisAlignment.end,
            //                         children: [
            //                           Text(
            //                             CurrencyHelper.convertToIdr(transaction.amount),
            //                             style: TextStyle(
            //                                 color: transaction.type == 'income'
            //                                     ? Colors.green
            //                                     : Colors.red),
            //                           ),
            //                           const SizedBox(height: 10),
            //                           GestureDetector(
            //                             onTap: () async {
            //                               Get.defaultDialog(
            //                                 onConfirm: () async {
            //                                   TransactionService().deleteTransactionById(index);
            //                                   Get.back();
            //                                 },
            //                                 onCancel: () => Get.back(),
            //                                 middleText: "Ingin menghapus?",
            //                                 confirmTextColor: Colors.white,
            //                               );
            //                             },
            //                             child: const SizedBox(
            //                               height: 20,
            //                               width: 20,
            //                               child: Icon(Icons.delete, color: Colors.red, size: 20),
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                     ],
            //                   ),
            //                 );
            //               },
            //             );
            //           },
            //         );
            //       } else {
            //         return const CircularProgressIndicator();
            //       }
            //     },
            //   ),
            // ),
            Container(
              margin: const EdgeInsets.all(20),
              child: FutureBuilder(
                future: homeC.userService.getAllUsers(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ValueListenableBuilder(
                      valueListenable: Hive.box<UserData>('userBox').listenable(),
                      builder: (context, box, _) {
                        var data = box.values
                            .firstWhere((element) => element.email == profileC.emailText.string)
                            .transactionItem!
                            .reversed
                            .toList();
                        if (data.isEmpty) {
                          return const Text("No data");
                        }
                        return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(height: 10);
                          },
                          itemBuilder: (BuildContext context, int index) {
                            var transaction = data[index];
                            return Container(
                              height: 75,
                              width: Get.width,
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: AppColors.greyText, width: 1),
                              ),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        color: AppColors.purpleMedium,
                                        borderRadius: BorderRadius.circular(10)),
                                    child: const Center(
                                        child: Icon(
                                      Icons.shopping_bag,
                                      color: AppColors.whiteColor,
                                    )),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        transaction.date,
                                        style: const TextStyle(color: AppColors.greyText),
                                      ),
                                      Text(transaction.category,
                                          style: const TextStyle(
                                              color: AppColors.blackColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        CurrencyHelper.convertToIdr(transaction.amount),
                                        style: TextStyle(
                                            color: transaction.type == 'income'
                                                ? Colors.green
                                                : Colors.red),
                                      ),
                                      const SizedBox(height: 10),
                                      GestureDetector(
                                        onTap: () async {
                                          Get.defaultDialog(
                                            onConfirm: () async {
                                              TransactionService().deleteTransactionById(index);
                                              data.removeAt(index);
                                              Get.back();
                                            },
                                            onCancel: () => Get.back(),
                                            middleText: "Ingin menghapus?",
                                            confirmTextColor: Colors.white,
                                          );
                                        },
                                        child: const SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: Icon(Icons.delete, color: Colors.red, size: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.purpleMedium,
        onPressed: () async {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Add transaction"),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Type",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          const Spacer(),
                          Obx(
                            () => DropdownButton(
                              value: homeC.chosenType.value,
                              items: homeC.listType
                                  .map(
                                    (type) => DropdownMenuItem(
                                      value: type,
                                      child: Text(type.capitalizeFirst.toString()),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                print(value);
                                homeC.chosenType(value.toString());
                              },
                            ),
                          ),
                        ],
                      ),
                      Obx(
                        () => homeC.chosenType.value == 'income'
                            ? const SizedBox()
                            : Row(
                                children: [
                                  const Text(
                                    "Category",
                                    style: TextStyle(fontSize: 14, color: Colors.grey),
                                  ),
                                  const Spacer(),
                                  Obx(
                                    () => DropdownButton(
                                      value: homeC.chosenCategory.value,
                                      items: homeC.listCategory
                                          .map(
                                            (type) => DropdownMenuItem(
                                              value: type,
                                              child: Text(type.toString()),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (value) {
                                        print(value);
                                        homeC.chosenCategory(value.toString());
                                      },
                                    ),
                                  ),
                                ],
                              ),
                      ),
                      CustomTextInput(
                        label: "Amount",
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        controller: homeC.amountController,
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                              onPressed: () async {
                                DateTime? newDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2030),
                                );
                                if (newDate == null) return;
                                String format = DateFormat("yyyy-MM-dd").format(newDate);
                                homeC.formattedDate.value = format;
                              },
                              child: const Text("Date")),
                          const Spacer(),
                          Obx(() => Text(homeC.formattedDate.value)),
                        ],
                      ),
                    ],
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () async {
                      if (homeC.chosenType.value == 'income') {
                        var transaction = TransactionItem(
                          homeC.formattedDate.value,
                          int.parse(homeC.amountController.text),
                          false,
                          homeC.chosenType.value,
                          "Income",
                        );
                        await homeC.countTransaction();
                        await homeC.transactionService.addItem(transaction);
                        await homeC.clearTransactions();
                        List<TransactionItem> listItem =
                            await TransactionService().getAllTransaction();
                        UserData userData = UserData(
                          profileC.emailText.string,
                          profileC.nameText.string,
                          listItem,
                        );
                        await UserService().updateUser(0, userData);
                      } else {
                        var transaction = TransactionItem(
                          homeC.formattedDate.value,
                          int.parse(homeC.amountController.text),
                          false,
                          homeC.chosenType.value,
                          homeC.chosenCategory.value,
                        );
                        await homeC.countTransaction();
                        await homeC.transactionService.addItem(transaction);
                        await homeC.clearTransactions();
                        List<TransactionItem> listItem =
                            await TransactionService().getAllTransaction();
                        UserData userData = UserData(
                          profileC.emailText.string,
                          profileC.nameText.string,
                          listItem,
                        );
                        await UserService().updateUser(0, userData);
                      }
                      if (Get.isRegistered<StatsController>() == true) {
                        print(true);
                        Get.delete<StatsController>();
                      }
                      Get.back();
                    },
                    child: const Text("Add"),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

Widget buildIncomeExpense(String type, int amount) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: 75,
      width: Get.width * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 1,
            offset: Offset(
              8,
              3,
            ),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 35,
            width: 35,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [AppColors.yellowLight, AppColors.purpleLight],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
            child: Center(child: Icon(type == "Income" ? Icons.add : Icons.remove)),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(type),
              Text(
                CurrencyHelper.convertToIdr(amount),
                style: TextStyle(
                  color: type == "Income" ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

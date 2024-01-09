import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_track_getx/helpers/data_preferences.dart';
import 'package:money_track_getx/services/transaction_service.dart';

class HomeController extends GetxController {
  var totalBalance = 0.obs;

  var incomeCount = 0.obs;

  var expenseCount = 0.obs;

  final TransactionService transactionService = TransactionService();

  final TextEditingController idController = TextEditingController();

  final TextEditingController statusController = TextEditingController();

  final TextEditingController paymentTypeController = TextEditingController();

  final TextEditingController amountController = TextEditingController();

  var formattedDate = "".obs;

  List<String> listType = ['income', 'expense'];

  var chosenType = 'income'.obs;

  List<String> quotesList = [
    'assets/images/image_1.png',
    'assets/images/image_2.png',
  ];

  countTransaction() async {
    if (chosenType.value == "income") {
      totalBalance.value = totalBalance.value + int.parse(amountController.text);
      await DataPreferences.setBalance(totalBalance.value);
      incomeCount.value = incomeCount.value + int.parse(amountController.text);
      await DataPreferences.setIncome(incomeCount.value);
    } else {
      totalBalance.value = totalBalance.value - int.parse(amountController.text);
      await DataPreferences.setBalance(totalBalance.value);
      expenseCount.value = expenseCount.value - int.parse(amountController.text);
      await DataPreferences.setExpense(expenseCount.value);
    }
  }

  @override
  void onInit() {
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

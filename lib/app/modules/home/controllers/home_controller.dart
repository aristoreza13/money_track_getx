import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_track_getx/helpers/data_preferences.dart';
import 'package:money_track_getx/services/transaction_service.dart';
import 'package:money_track_getx/services/user_service.dart';

import '../../../data/models/transaction_item.dart';

class HomeController extends GetxController {
  var totalBalance = 0.obs;

  var incomeCount = 0.obs;

  var expenseCount = 0.obs;

  final TransactionService transactionService = TransactionService();

  final UserService userService = UserService();

  final TextEditingController idController = TextEditingController();

  final TextEditingController statusController = TextEditingController();

  final TextEditingController paymentTypeController = TextEditingController();

  final TextEditingController amountController = TextEditingController();

  var formattedDate = "".obs;

  List<String> listType = ['income', 'expense'];

  List<String> listCategory = [
    'Accomodation',
    'Food n Beverages',
    'Lifestyle',
    'Medical',
    'Daily Needs',
  ];
  var chosenCategory = 'Accomodation'.obs;

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

  clearTransactions() {
    amountController.clear();
    formattedDate('');
    chosenType('income');
    chosenCategory('Accomodation');
  }

  void getInitBalance() async {
    List<TransactionItem> listTransaction = await UserService().getAllUsers().then((value) => value
        .firstWhere((element) => element.email == DataPreferences.getEmail()!)
        .transactionItem!);

    var incomeList = listTransaction.where((element) => element.type == "income");
    for (var element in incomeList) {
      incomeCount.value = incomeCount.value + element.amount;
    }

    var expenseList = listTransaction.where((element) => element.type == "expense");
    for (var element in expenseList) {
      expenseCount.value = expenseCount.value + element.amount;
    }

    totalBalance.value = incomeCount.value - expenseCount.value;
  }

  @override
  void onInit() {
    super.onInit();
    getInitBalance();
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

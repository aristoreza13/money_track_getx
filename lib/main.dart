import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_track_getx/app/data/models/user_data.dart';

import 'app/data/models/transaction_item.dart';
import 'app/routes/app_pages.dart';
import 'helpers/data_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataPreferences.init();
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionItemAdapter());
  Hive.registerAdapter(UserDataAdapter());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: Routes.SPLASH,
      getPages: AppPages.routes,
    ),
  );
}

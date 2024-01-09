import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:money_track_getx/app/routes/app_pages.dart';

import '../helpers/data_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Tambahkan delay selama 2 detik
    Future.delayed(
      const Duration(seconds: 2),
      () {
        // Get.offAllNamed(Routes.LOGIN);

        print(DataPreferences.getInit());
        print(DataPreferences.getLoggedIn());
        DataPreferences.getInit() == null
            ? Get.offAllNamed(Routes.LOGIN)
            : DataPreferences.getLoggedIn() == null
                ? Get.offAllNamed(Routes.LOGIN)
                : Get.offAllNamed(Routes.NAVIGATOR);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/lottie/piggy_bank.json',
        ),
      ),
    );
  }
}

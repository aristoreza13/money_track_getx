import 'package:get/get.dart';
import 'package:money_track_getx/app/modules/home/controllers/home_controller.dart';
import 'package:money_track_getx/app/modules/login/controllers/login_controller.dart';
import 'package:money_track_getx/app/modules/navigator/controllers/navigator_controller.dart';
import 'package:money_track_getx/app/modules/profile/controllers/profile_controller.dart';
import 'package:money_track_getx/app/modules/stats/controllers/stats_controller.dart';

class NavigatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigatorController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => HomeController());
    // Get.lazyPut(() => StatsController());
    Get.lazyPut(() => ProfileController());
  }
}

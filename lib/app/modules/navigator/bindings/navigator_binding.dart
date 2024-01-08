import 'package:get/get.dart';
import 'package:money_track_getx/app/modules/home/controllers/home_controller.dart';
import 'package:money_track_getx/app/modules/navigator/controllers/navigator_controller.dart';

class NavigatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigatorController());
    Get.lazyPut(() => HomeController());
  }
}

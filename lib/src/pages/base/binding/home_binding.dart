
import 'package:get/get.dart';
import 'package:quitandavirtual/src/pages/base/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }

}
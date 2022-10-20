import 'package:get/get.dart';
import 'package:quitandavirtual/src/pages/orders/controller/all_orders_controller.dart';

class OrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AllOrdersController());
  }
}
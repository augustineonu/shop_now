
import 'package:get/get.dart';
import 'package:shop_now/features/dashboard/data/controller/product_controller.dart';

class AppBinding extends Bindings {

  @override
  void dependencies() {
    print('loading dependencies');
    Get.put(ProductController());

  }
}
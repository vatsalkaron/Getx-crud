import 'package:get/get.dart';
import 'package:testgetx/ui/controllers/controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController());
  }
}

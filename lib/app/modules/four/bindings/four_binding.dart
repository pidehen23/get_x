import 'package:get/get.dart';

import '../controllers/four_controller.dart';

class FourBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FourController>(
      () => FourController(),
    );
  }
}

import 'package:get/get.dart';

import '../controllers/dog_controller.dart';

class DogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DogController>(
      () => DogController(),
    );
  }
}

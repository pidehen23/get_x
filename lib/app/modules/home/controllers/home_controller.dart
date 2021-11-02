import 'package:get/get.dart';

class HomeController extends GetxController {
  int count = 0;

  String get text => 'sum= $count';
  // static HomeController get to => Get.find(); // 添加这一行

  void increment() {
    count++;
    update();
  }
}

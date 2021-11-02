import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/app/routes/app_pages.dart';
import '../controllers/second_controller.dart';

class SecondView extends GetView<SecondController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Open route'),
          onPressed: () {
            Get.toNamed(Routes.THIRD);
          },
        ),
      ),
    );
  }
}

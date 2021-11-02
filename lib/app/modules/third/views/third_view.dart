import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/third_controller.dart';

class ThirdView extends GetView<ThirdController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ThirdView'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

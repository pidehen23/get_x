import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FiveView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FiveView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'FiveView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

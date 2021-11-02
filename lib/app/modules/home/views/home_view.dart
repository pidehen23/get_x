import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (home) => Scaffold(
        appBar: AppBar(
          title: Text('HomeView ${home.text}'),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.snackbar(
                'hi',
                'i am a modern snackbar',
                colorText: Colors.black87,
              );
            },
          ),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text('Open route'),
            onPressed: () {
              Get.toNamed(Routes.SECOND);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            home.increment();
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            Get.snackbar("hi", "i am a modern snackbar");
          },
        ),
        title: Text('second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Open route'),
          onPressed: () {
            Get.toNamed("/third");
          },
        ),
      ),
    );
  }
}

class Third extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third Route"),
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

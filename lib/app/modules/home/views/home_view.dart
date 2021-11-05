import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (home) => Scaffold(
        appBar: AppBar(
          title: Text('count-${home.count}'),
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
          actions: [
            Center(
              child: IconButton(
                icon: Icon(Icons.public),
                onPressed: () {
                  Get.toNamed(Routes.DOG);
                },
              ),
            )
          ],
        ),
        body: home.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: home.movieList.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 120,
                          margin: EdgeInsets.all(10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.network(
                              home.movieList[index].itemCover,
                              width: 150,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                home.movieList[index].author,
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      color: Colors.grey.shade300,
                      height: 2,
                    ),
                  ],
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

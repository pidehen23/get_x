import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/app/modules/dog/dog_model.dart';
import '../controllers/dog_controller.dart';

class DogView extends GetView<DogController> {
  Dog getDog(int len) => Dog(id: len + 10, name: 'dog-${len + 1}', age: 666);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DogController>(builder: (dog) {
      return Scaffold(
        appBar: AppBar(
          title: Text('DogView'),
          centerTitle: true,
          actions: [
            Center(
              child: IconButton(
                tooltip: '插入数据',
                icon: Icon(Icons.add),
                onPressed: () {
                  dog.insert(getDog(dog.state.dogList.length));
                },
              ),
            ),
          ],
        ),
        body: dog.state.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: dog.state.dogList.length,
                itemBuilder: (context, index) {
                  var item = dog.state.dogList[index];
                  return ListTile(
                      title: Text(
                        item.name!,
                      ),
                      subtitle: Text(item.id.toString()),
                      leading: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          var obj = item.toJson();
                          dog.updateDd(Dog.fromJson(
                              {...obj, 'name': '${item.name}-update'}));
                        },
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          dog.delete(item.id!);
                        },
                      ));
                }),
      );
    });
  }
}

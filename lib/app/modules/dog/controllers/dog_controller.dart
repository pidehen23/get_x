import 'package:get/get.dart';
import 'package:get_x/app/modules/dog/dog_model.dart';
import 'package:get_x/app/modules/dog/state/state.dart';

class DogController extends GetxController {
  final state = DogTable();

  void setDogList() async {
    var list = await state.getDogs();
    state.dogList = list;
    update();
  }

  // 插入数据
  void insert(Dog dog) async {
    await state.insertDog(dog);
    setDogList();
  }

  // 删除数据
  void delete(int id) async {
    await state.deleteDog(id);
    setDogList();
  }

  // 更新数据
  void updateDd(Dog dog) async {
    await state.updateDog(dog);
    setDogList();
  }

  ///在 widget 内存中分配后立即调用。
  ///你可以用它来为控制器初始化 initialize 一些东西。
  @override
  void onInit() {
    super.onInit();
  }

  ///在 onInit() 之后调用 1 帧。这是进入的理想场所
  ///导航事件，例如 snackbar、对话框或新route，或
  ///async 异步请求。
  @override
  void onReady() {
    super.onReady();
    setDogList();
  }

  @override
  void onClose() {}

  @override
  void dispose() async {
    super.dispose();
    final db = await state.database;
    db.close();
    // dispose 释放对象
  }

  void updateDogList(List<Dog> list) {
    state.dogList = list;
    update();
  }
}

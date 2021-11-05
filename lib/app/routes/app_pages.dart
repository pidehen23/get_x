import 'package:get/get.dart';

import 'package:get_x/app/modules/dog/bindings/dog_binding.dart';
import 'package:get_x/app/modules/dog/views/dog_view.dart';
import 'package:get_x/app/modules/home/bindings/home_binding.dart';
import 'package:get_x/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DOG,
      page: () => DogView(),
      binding: DogBinding(),
    ),
  ];
}

import 'package:get/get.dart';

import 'package:get_x/app/modules/four/bindings/four_binding.dart';
import 'package:get_x/app/modules/four/views/four_view.dart';
import 'package:get_x/app/modules/home/bindings/home_binding.dart';
import 'package:get_x/app/modules/home/views/home_view.dart';
import 'package:get_x/app/modules/second/bindings/second_binding.dart';
import 'package:get_x/app/modules/second/views/second_view.dart';
import 'package:get_x/app/modules/third/bindings/third_binding.dart';
import 'package:get_x/app/modules/third/views/third_view.dart';

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
      name: _Paths.SECOND,
      page: () => SecondView(),
      binding: SecondBinding(),
    ),
    GetPage(
      name: _Paths.THIRD,
      page: () => ThirdView(),
      binding: ThirdBinding(),
    ),
    GetPage(
      name: _Paths.FOUR,
      page: () => FourView(),
      binding: FourBinding(),
    ),
  ];
}

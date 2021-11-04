import 'package:get/get.dart';
import 'package:get_x/app/modules/home/views/api_service.dart';
import 'package:get_x/app/modules/home/views/movie_model.dart';
import 'package:get_x/app/utils/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

const ShareKey = 'counter';

class HomeController extends GetxController {
  var isLoading = false;
  int count = 0;
  List<MovieModel> movieList = [];

  void increment() async {
    var abc = await (LocalStorage.getInt(ShareKey));
    count = (abc ?? 0) + 1;
    LocalStorage.setInt(ShareKey, count);
    update();
  }

  void fetchMovie() async {
    try {
      isLoading = true;
      var movie = await ApiService.fetchMovie();
      if (movie != null) {
        movieList = movie;
      }
    } finally {
      isLoading = false;
      update();
    }
  }

  void _loadCounter() async {
    var keys = await LocalStorage.getKeys();
    print([...keys]);
    var _counter = await LocalStorage.getInt(ShareKey) ?? 0;
    count = _counter;
    update();
  }

  @override
  void onInit() {
    _loadCounter();
    fetchMovie();
    super.onInit();
  }

  ///dispose 释放内存
  @override
  void dispose() async {
    super.dispose();
    // dispose 释放对象
    final prefs = await SharedPreferences.getInstance();
    prefs.clear().then((value) => {print('clean store data')});
  }
}

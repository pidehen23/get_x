import 'package:get/get.dart';
import 'package:get_x/app/modules/home/views/api_service.dart';
import 'package:get_x/app/modules/home/views/movie_model.dart';

class HomeController extends GetxController {
  var isLoading = false;
  int count = 0;
  List<MovieModel> movieList = [];

  void increment() {
    count++;
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

  @override
  void onInit() {
    fetchMovie();
    super.onInit();
  }
}

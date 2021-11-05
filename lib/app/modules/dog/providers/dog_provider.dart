import 'package:get/get.dart';

import '../dog_model.dart';

class DogProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Dog.fromJson(map);
      if (map is List) return map.map((item) => Dog.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Dog?> getDog(int id) async {
    final response = await get('dog/$id');
    return response.body;
  }

  Future<Response<Dog>> postDog(Dog dog) async => await post('dog', dog);
  Future<Response> deleteDog(int id) async => await delete('dog/$id');
}

import 'package:mvvm/app/constant/constant.dart';
import 'package:mvvm/app/model/network/my_response.dart';
import 'package:mvvm/app/service/base_service.dart';

class SampleService extends BaseServices {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com/users';

  Future<MyResponse<dynamic, dynamic>> getUsers() {
    final path = _baseUrl;
    return callAPI(HttpRequestType.GET, path);
  }

  // Future<MyResponse<List<User>, String>> getUsers() async {
  //   try {
  //     final response = await _dio.get(_baseUrl);

  //     if (response.statusCode == 200) {
  //       List<dynamic> data = response.data;
  //       List<User> users = data.map((json) => User.fromJson(json)).toList();
  //       return MyResponse.success(data: users);
  //     } else {
  //       return MyResponse.error(response.data, error: 'Failed to load users');
  //     }
  //   } on DioException catch (e) {
  //     return MyResponse.error(e, error: e.toString());
  //   }
  // }
}

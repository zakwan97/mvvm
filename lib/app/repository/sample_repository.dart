import 'package:mvvm/app/constant/constant.dart';
import 'package:mvvm/app/model/network/my_response.dart';
import 'package:mvvm/app/model/user.dart';
import 'package:mvvm/app/service/sample_service.dart';

class SampleRepository {
  final SampleService _sampleService = SampleService();

  Future<MyResponse<dynamic, dynamic>> getUsers() async {
    final response = await _sampleService.getUsers();
    if (response.isSuccess) {
      final result = response.data as List<dynamic>;
      final userList =
          result.map((json) => User.fromJson(json as Json)).toList();
      return MyResponse.success(data: userList);
    }
    return response;
  }
}

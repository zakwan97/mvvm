import 'package:mvvm/app/view_model/base_view_model.dart';
import 'package:mvvm/app/repository/sample_repository.dart';
import 'package:mvvm/app/model/user.dart'; // Import the model

class UserListViewModel extends BaseViewModel {
  final SampleRepository _repository = SampleRepository();

  List<User>? users;

  Future<void> fetchUsers() async {
    setLoading(true);
    setError(null);

    final response = await _repository.getUsers();

    if (response.isSuccess) {
      users = response.data;
    } else {
      setError(response.error);
    }

    setLoading(false);
  }
}

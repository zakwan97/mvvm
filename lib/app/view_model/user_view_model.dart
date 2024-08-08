import 'package:mvvm/app/model/user_model.dart';
import 'base_view_model.dart';

class UserViewModel extends BaseViewModel {
  User? _user;

  User? get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void clearUser() {
    _user = null;
    notifyListeners();
  }
}

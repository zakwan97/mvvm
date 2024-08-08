import 'package:mvvm/app/view_model/main_page_view_model.dart';
import 'package:mvvm/app/view_model/user_list_view_model.dart';
import 'package:mvvm/app/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/// Define the type of environment supported in this project
enum EnvironmentType { PRODUCTION, UAT, DEVELOPMENT }

List<SingleChildWidget> providerAssets() => [
      ChangeNotifierProvider(create: (_) => UserViewModel()),
      ChangeNotifierProvider(create: (_) => UserListViewModel()),
      ChangeNotifierProvider(create: (_) => MainPageViewModel()),
    ];

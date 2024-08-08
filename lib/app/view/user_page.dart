import 'package:flutter/material.dart';
import 'package:mvvm/app/constant/custom_colors.dart';
import 'package:mvvm/app/model/user_model.dart';
import 'package:mvvm/app/view/widget/app_bar_widget.dart';
import 'package:mvvm/app/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import 'base_stateful_page.dart';

class UserPage extends BaseStatefulPage {
  const UserPage({super.key});

  @override
  UserPageState createState() => UserPageState();
}

class UserPageState extends BaseStatefulState<UserPage> {
  late UserViewModel _userViewModel;

  @override
  void initState() {
    super.initState();
    _userViewModel = context.read<UserViewModel>();
  }

  @override
  PreferredSizeWidget? appbar() {
    return AppBarWidget(
      backgroundColor: CustomColors.primaryColor,
      isHome: true,
      centerTitle: true,
      leading: null,
      showBackButton: false,
      // actions: getHomeActions(),
      bottomLine: false,
    );
  }

  @override
  Widget buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer<UserViewModel>(
          builder: (context, userViewModel, child) {
            return userViewModel.user != null
                ? Column(
                    children: [
                      Text('ID: ${userViewModel.user!.id}'),
                      Text('Name: ${userViewModel.user!.name}'),
                      Text('Email: ${userViewModel.user!.email}'),
                    ],
                  )
                : const Text('No user data');
          },
        ),
        ElevatedButton(
          onPressed: () {
            showLoading();
            Future.delayed(const Duration(seconds: 2), () {
              _userViewModel.setUser(
                User(id: '1', name: 'John Doe', email: 'john.doe@example.com'),
              );
              hideLoading();
            });
          },
          child: const Text('Load User'),
        ),
        ElevatedButton(
          onPressed: () {
            _userViewModel.clearUser();
          },
          child: const Text('Clear User'),
        ),
      ],
    );
  }
}

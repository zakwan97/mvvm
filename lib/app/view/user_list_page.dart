import 'package:flutter/material.dart';
import 'package:mvvm/app/view_model/user_list_view_model.dart';
import 'package:provider/provider.dart';
import 'package:mvvm/app/view/base_stateful_page.dart';

class UserListPage extends BaseStatefulPage {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => UserListPageState();
}

class UserListPageState extends BaseStatefulState<UserListPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<UserListViewModel>().fetchUsers());
  }

  @override
  PreferredSizeWidget? appbar() {
    return AppBar(
      title: const Text('Users'),
      centerTitle: true,
    );
  }

  @override
  Widget buildContent(BuildContext context) {
    final viewModel = context.watch<UserListViewModel>();

    if (viewModel.isLoading) {
      showLoading();
    } else {
      hideLoading();
    }

    if (viewModel.errorMessage != null) {
      showError(viewModel.errorMessage!);
    } else {
      hideError();
    }

    return ListView.builder(
      itemCount: viewModel.users?.length ?? 0,
      itemBuilder: (context, index) {
        final user = viewModel.users![index];
        return ListTile(
          title: Text(user.name),
          subtitle: Text(user.email),
        );
      },
    );
  }
}

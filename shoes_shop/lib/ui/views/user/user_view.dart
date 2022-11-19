import 'package:flutter/material.dart';
import 'package:shoes_shop/core/view_models/user_view_model.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/views/user/components/body.dart';

class UserView extends StatelessWidget {
  final String username;
  const UserView({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<UserViewModel>(
        builder: (BuildContext context, UserViewModel model, Widget? child) =>
            Scaffold(
              body: Body(userViewModel: model, username: username),
            ));
  }
}

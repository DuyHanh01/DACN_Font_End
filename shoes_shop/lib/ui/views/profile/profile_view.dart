import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shoes_shop/core/enum/menu_state.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/view_models/user_view_model.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/views/profile/components/body.dart';
import 'package:shoes_shop/ui/widgets/custom_button_nav_bar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Account account = Provider.of<Account>(context);
    return BaseView<UserViewModel>(
        onModelReady: (model) => model.getUser(account.accountId),
        builder: (BuildContext context, UserViewModel model, Widget? child) =>
            const Scaffold(
              body: Body(),
              bottomNavigationBar:
                  CustomBottomNavBar(selectedMenu: MenuState.profile),
            ));
  }
}

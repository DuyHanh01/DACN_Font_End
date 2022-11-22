import 'package:flutter/material.dart';
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/view_models/user_view_model.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/shared/ui_helpers.dart';
import 'package:shoes_shop/ui/widgets/circle_delay.dart';
import 'package:shoes_shop/ui/widgets/profile_menu.dart';
import 'package:shoes_shop/ui/views/profile/components/profile_pic.dart';

class Body extends StatelessWidget {
  final UserViewModel userViewModel;
  const Body({super.key, required this.userViewModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          UIHelper.verticalSpaceMedium(),
          const Text('Profile', style: wellComeStyle),
          UIHelper.verticalSpaceMedium(),
          ProfilePic(userViewModel: userViewModel),
          UIHelper.verticalSpaceMedium(),
          ProfileMenu(
            text: "My Account",
            icon: Icons.person_outline_rounded,
            press: () => {Navigator.pushNamed(context, RoutePaths.account)},
          ),
          ProfileMenu(
            text: "Notifications",
            icon: Icons.notifications_outlined,
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: Icons.settings,
            press: () => {Navigator.pushNamed(context, RoutePaths.setting)},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: Icons.question_mark_rounded,
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: Icons.logout_rounded,
            press: () {},
          ),
        ],
      ),
    );
  }
}

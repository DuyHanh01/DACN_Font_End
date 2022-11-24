import 'package:flutter/material.dart';
import 'package:shoes_shop/core/view_models/user_view_model.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/shared/ui_helpers.dart';
import 'package:shoes_shop/ui/widgets/alertlog_logout.dart';
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
          Text(S.of(context).profile, style: wellComeStyle),
          UIHelper.verticalSpaceMedium(),
          ProfilePic(userViewModel: userViewModel),
          UIHelper.verticalSpaceMedium(),
          ProfileMenu(
            text: S.of(context).myAccount,
            icon: Icons.person_outline_rounded,
            widget: const Icon(Icons.arrow_forward_ios),
            press: () => {Navigator.pushNamed(context, RoutePaths.account)},
          ),
          ProfileMenu(
            text: S.of(context).notifications,
            icon: Icons.notifications_outlined,
            widget: const Icon(Icons.arrow_forward_ios),
            press: () {},
          ),
          ProfileMenu(
            text: S.of(context).settings,
            icon: Icons.settings,
            widget: const Icon(Icons.arrow_forward_ios),
            press: () => {Navigator.pushNamed(context, RoutePaths.setting)},
          ),
          ProfileMenu(
            text: S.of(context).helpCenter,
            icon: Icons.question_mark_rounded,
            widget: const Icon(Icons.arrow_forward_ios),
            press: () {},
          ),
          ProfileMenu(
            text: S.of(context).logout,
            icon: Icons.logout_rounded,
            widget: const Icon(Icons.arrow_forward_ios),
            press: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => buildAlertLogLogout(context, userViewModel)
            ),
          ),
        ],
      ),
    );
  }
}

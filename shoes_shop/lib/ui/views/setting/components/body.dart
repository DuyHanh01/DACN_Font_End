import 'package:flutter/material.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/widgets/profile_menu.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileMenu(
          text: "Language",
          icon: Icons.person_outline_rounded,
          press: () => {},
        ),
        ProfileMenu(
          text: "Screen Mode",
          icon: Icons.mode_night,
          press: () {},
        ),
        ProfileMenu(
          text: "Change Password",
          icon: Icons.change_circle,
          press: () => {Navigator.pushNamed(context, RoutePaths.changePass)},
        ),
      ],
    );
  }
}

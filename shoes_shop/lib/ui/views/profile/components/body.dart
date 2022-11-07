import 'package:flutter/material.dart';
import 'package:shoes_shop/ui/views/profile/components/profile_menu.dart';
import 'package:shoes_shop/ui/views/profile/components/profile_pic.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: Icons.person_outline_rounded,
            press: () => {},
          ),
          ProfileMenu(
            text: "Notifications",
            icon: Icons.notifications_outlined,
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: Icons.settings,
            press: () {},
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
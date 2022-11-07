import 'package:flutter/material.dart';
import 'package:shoes_shop/core/enum/menu_state.dart';
import 'package:shoes_shop/ui/views/profile/components/body.dart';
import 'package:shoes_shop/ui/widgets/app_bar.dart';
import 'package:shoes_shop/ui/widgets/custom_button_nav_bar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Profile'),
      body: const Body(),
      bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}

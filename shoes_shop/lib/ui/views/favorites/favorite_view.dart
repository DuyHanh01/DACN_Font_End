import 'package:flutter/material.dart';
import 'package:shoes_shop/core/enum/menu_state.dart';
import 'package:shoes_shop/ui/views/favorites/components/app_bar.dart';
import 'package:shoes_shop/ui/widgets/custom_button_nav_bar.dart';
import 'package:shoes_shop/ui/widgets/main_drawer.dart';
class FavoriteView extends StatelessWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Container(),
      bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.favorite),
    );
  }
}

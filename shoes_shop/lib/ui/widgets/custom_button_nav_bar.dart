import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/enum/menu_state.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  Widget buildButtonNav(
      MenuState menuState, Function? onTap, String text, IconData icon) {
    return menuState == selectedMenu
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  icon,
                  color: AppColors.primaryColor,
                  size: 30,
                ),
                onPressed: onTap as void Function()?,
              ),
              Text(text,
                  style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold, fontSize: 15))
            ],
          )
        : IconButton(
            icon: Icon(
              icon,
              color: AppColors.lightGray,
            ),
            onPressed: onTap as void Function()?,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: AppColors.primaryColor.withOpacity(0.15),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildButtonNav(MenuState.home, () {
                Navigator.pushNamed(context, RoutePaths.home);
              }, 'Home', Icons.home_rounded),
              buildButtonNav(MenuState.favorite, () {
                Navigator.pushNamed(context, RoutePaths.favorite);
              }, 'Favorite', Icons.favorite_border_rounded),
              buildButtonNav(MenuState.order, () {
                Navigator.pushNamed(context, RoutePaths.order);
              }, 'Order', Icons.shop_rounded),
              buildButtonNav(MenuState.profile, () {
                Navigator.pushNamed(context, RoutePaths.profile);
              }, 'Profile', Icons.person_rounded),
            ],
          )),
    );
  }
}

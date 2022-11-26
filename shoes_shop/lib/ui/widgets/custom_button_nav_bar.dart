import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/enum/menu_state.dart';
import 'package:shoes_shop/core/view_models/locale_provider.dart';
import 'package:shoes_shop/generated/assets.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu, required this.provider,
  }) : super(key: key);

  final MenuState selectedMenu;
  final LocaleProvider provider;

  Widget buildButtonNav(
      MenuState menuState, Function? onTap, String text, IconData icon) {
    return menuState == selectedMenu
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                onTap: onTap as void Function()?,
                child: Icon(
                  icon,
                  color: AppColors.primaryColor,
                  size: 26,
                ),
              ),
              Text(text,
                  style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14))
            ],
          )
        : GestureDetector(
            onTap: onTap as void Function()?,
            child: Icon(
              icon,
              color: AppColors.lightGrey,
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
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
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildButtonNav(MenuState.home, () {
                Navigator.pushNamed(context, RoutePaths.home);
              }, S.of(context).home, Icons.home_rounded),
              buildButtonNav(MenuState.favorite, () {
                Navigator.pushNamed(context, RoutePaths.favorite);
              }, S.of(context).favorite, Icons.favorite_border_rounded),
              buildButtonNav(MenuState.order, () {
                Navigator.pushNamed(context, RoutePaths.order);
              }, S.of(context).order, Icons.shop_rounded),
              buildButtonNav(MenuState.profile, () {
                Navigator.pushNamed(context, RoutePaths.profile);
              }, S.of(context).profile, Icons.person_rounded),
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/ui/views/home/components/home_bottom_menu_icon.dart';

class ButtonMenu extends StatefulWidget {
  const ButtonMenu({Key? key}) : super(key: key);

  @override
  State<ButtonMenu> createState() => _ButtonMenuState();
}

class _ButtonMenuState extends State<ButtonMenu> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: false,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      selectedItemColor: AppColors.primaryColor,
      currentIndex: _selectedIndex,
      backgroundColor: AppColors.white,
      items: [
        homeBottomMenuIcon(
          currentIndex: _selectedIndex,
          itemIndex: 0,
          svgPic: AppUI.home,
          title: 'Home',
        ),
        homeBottomMenuIcon(
          itemIndex: _selectedIndex,
          currentIndex: 1,
          svgPic: AppUI.favorite,
          title: 'Favorite',
        ),
        homeBottomMenuIcon(
          currentIndex: _selectedIndex,
          itemIndex: 2,
          svgPic: AppUI.notification,
          title: 'Notification',
        ),
        homeBottomMenuIcon(
          currentIndex: _selectedIndex,
          itemIndex: 3,
          svgPic: AppUI.profile,
          title: 'Profile',
        ),
      ],
    );
  }
}

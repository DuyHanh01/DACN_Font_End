import 'package:flutter/cupertino.dart';
import 'package:shoes_shop/config/theme.dart';

BottomNavigationBarItem homeBottomMenuIcon({
  required final int itemIndex,
  required final int currentIndex,
  required final String title,
  required final IconData img,
}) {
  return BottomNavigationBarItem(
    label: title,
    icon: Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Icon(
        img,
        size: 22,
        color: currentIndex == itemIndex
            ? AppColors.primaryColor
            : AppColors.darkGray,
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';

class AppButton {
  static normalButton({
    required String title,
    VoidCallback? onPress,
    Color? backgroundColor = AppColors.primaryColor,
    Color? titleColor = AppColors.white,
    bool shadow = true,
    double height = 55,
    double width = 200,
  }) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: shadow
              ? [
                  const BoxShadow(color: AppColors.lightGrey, blurRadius: 5),
                ]
              : null,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: titleColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

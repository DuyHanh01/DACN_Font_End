import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press, required this.widget,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback? press;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: AppColors.black,
          padding: const EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: AppColors.secondaryColor,
        ),
        onPressed: press,
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.primaryColor,
            ),
            const SizedBox(width: 20),
            Expanded(child: Text(text)),
            widget
            //const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}

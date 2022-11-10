import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';

class ButtonIcon extends StatelessWidget {
  const ButtonIcon({
    Key? key,
    required this.text,
    required this.icon,
    required this.press,
  }) : super(key: key);
  final String? text;
  final String? icon;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.asset(icon!),
      ),
      style: TextButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        primary: Colors.white,
        backgroundColor: AppColors.primaryColor,
      ),
      onPressed: press as void Function()?,
      label: Text(
        text!,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    this.press, required this.backColor, required this.textColor,
  }) : super(key: key);
  final String? text;
  final Color backColor, textColor;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(10),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        primary: AppColors.black,
        backgroundColor: backColor,
      ),
      onPressed: press as void Function()?,
      child: Text(
        text!,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: textColor
        ),
      ),
    );
  }
}

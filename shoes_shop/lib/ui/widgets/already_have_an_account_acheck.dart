import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/generated/l10n.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function? press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    required this.login,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "${S.of(context).DontHaveAnAccount} ? " : "${S.of(context).AlreadyHaveAnAccount} ? ",
          style: const TextStyle(color: AppColors.blackGrey, fontSize: 14),
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child: Text(
            login ? S.of(context).signUp : S.of(context).signIn,
            style: const TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        )
      ],
    );
  }
}

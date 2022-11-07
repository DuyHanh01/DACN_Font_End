import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/widgets/default_button.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppUI.success),
        const Text(
          "Login Success",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const Spacer(),
        SizedBox(
          child: DefaultButton(
            text: "Confirm",
            press: () {
              Navigator.of(context).pushNamed(
                RoutePaths.login,
              );
            },
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

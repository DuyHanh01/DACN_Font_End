import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/shared/ui_helpers.dart';

class LoginHeader extends StatelessWidget {
  final TextEditingController controllerUser;
  final TextEditingController controllerPass;
  final String validationMessage;

  const LoginHeader(this.validationMessage,
      {Key? key, required this.controllerUser, required this.controllerPass})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      const Text('Welcome Back', style: wellComeStyle),
      UIHelper.verticalSpaceMedium(),
      SizedBox(width: 360, child: Image.asset('assets/images/main.png')),
      LoginTextField(false, controllerUser, TextInputType.emailAddress,
          'Enter your email'),
      LoginTextField(true, controllerPass, TextInputType.visiblePassword,
          'Enter your password'),
      Text(validationMessage,
          style: const TextStyle(color: AppColors.red)),
      TextButton(
        onPressed: () {},
        child: const Text(
          'Forgot Password',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryColor),
        ),
      ),
    ]);
  }
}

class LoginTextField extends StatelessWidget {
  final bool state;
  final String hinText;
  final TextInputType textInputType;
  final TextEditingController controller;

  const LoginTextField(
      this.state, this.controller, this.textInputType, this.hinText,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: TextField(
        cursorColor: AppColors.primaryColor,
        obscureText: state,
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
            floatingLabelStyle:
                const TextStyle(color: AppColors.primaryColor, fontSize: 13),
            filled: true,
            fillColor: AppColors.white,
            enabledBorder: const OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(AppSizes.buttonRadius)),
                borderSide: BorderSide(color: AppColors.background)),
            focusedBorder: const OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(AppSizes.buttonRadius)),
              borderSide: BorderSide(width: 1, color: AppColors.primaryColor),
            ),
            labelText: hinText,
            labelStyle: const TextStyle(fontSize: 13)),
      ),
    );
  }
}

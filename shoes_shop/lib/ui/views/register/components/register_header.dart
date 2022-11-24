import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/shared/ui_helpers.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader(
      {Key? key,
      required this.controllerUser,
      required this.controllerPass,
      required this.controllerRePass})
      : super(key: key);

  final TextEditingController controllerUser;
  final TextEditingController controllerPass;
  final TextEditingController controllerRePass;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      const Text('Welcome Onboard!', style: wellComeStyle),
      UIHelper.verticalSpaceSmall(),
      const Text('Let’s help you meet up your tasks'),
      UIHelper.verticalSpaceMedium(),
      RegisterTextField(false, controllerUser, TextInputType.emailAddress,
         S.of(context).enterEmail),
      RegisterTextField(true, controllerPass, TextInputType.visiblePassword,
          S.of(context).enterPass),
      RegisterTextField(true, controllerRePass, TextInputType.visiblePassword,
          S.of(context).enterRePass),
      UIHelper.verticalSpaceSmall(),
    ]);
  }
}

class RegisterTextField extends StatelessWidget {
  final bool state;
  final String hinText;
  final TextInputType textInputType;
  final TextEditingController controller;

  const RegisterTextField(
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
        style: shoesTextStyle.copyWith(fontSize: 16),
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

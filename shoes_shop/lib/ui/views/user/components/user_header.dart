import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/shared/ui_helpers.dart';

class UserHeader extends StatelessWidget {
  const UserHeader(
      {Key? key,
      required this.controllerFirstName,
      required this.controllerLastName,
      required this.controllerPhone,
      required this.controllerAddress})
      : super(key: key);

  final TextEditingController controllerFirstName;
  final TextEditingController controllerLastName;
  final TextEditingController controllerPhone;
  final TextEditingController controllerAddress;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      UIHelper.verticalSpaceMedium(),
      Text(S.of(context).completeProfile, style: wellComeStyle),
      UIHelper.verticalSpaceMedium(),
      RegisterTextField(controllerFirstName, TextInputType.name, S.of(context).enterYourFirstName),
      RegisterTextField(controllerLastName, TextInputType.name,
          S.of(context).enterYourLastName),
      RegisterTextField(controllerPhone, TextInputType.phone,
          S.of(context).enterYourPhone),
      RegisterTextField(controllerAddress, TextInputType.streetAddress,
          S.of(context).enterYourAddress),
      UIHelper.verticalSpaceMedium(),
    ]);
  }
}

class RegisterTextField extends StatelessWidget {
  final String hinText;
  final TextInputType textInputType;
  final TextEditingController controller;

  const RegisterTextField(this.controller, this.textInputType, this.hinText,
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

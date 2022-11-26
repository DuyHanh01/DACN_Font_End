import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';

import '../../../shared/ui_helpers.dart';

class CheckoutHeader extends StatelessWidget {
  const CheckoutHeader({
    Key? key,
    required this.controllerFirstName,
    required this.controllerLastName,
    required this.controllerPhone,
    required this.controllerMail,
    required this.controllerAddress,
    required this.controllerNote
  }) : super(key: key);
  final TextEditingController controllerFirstName;
  final TextEditingController controllerLastName;
  final TextEditingController controllerPhone;
  final TextEditingController controllerMail;
  final TextEditingController controllerAddress;
  final TextEditingController controllerNote;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          CheckoutTextField(
              controller: controllerFirstName,
              hinText: S.of(context).enterYourFirstName,
              textInputType: TextInputType.name,
              icon: Icons.person_rounded),
          UIHelper.verticalSpaceVerySmall(),
          CheckoutTextField(
              controller: controllerLastName,
              hinText: S.of(context).enterYourLastName,
              textInputType: TextInputType.name,
              icon: Icons.person_rounded),
          UIHelper.verticalSpaceVerySmall(),
          CheckoutTextField(
              controller: controllerPhone,
              hinText: S.of(context).enterYourPhone,
              textInputType: TextInputType.phone,
              icon: Icons.phone_rounded),
          UIHelper.verticalSpaceVerySmall(),
          CheckoutTextField(
              controller: controllerMail,
              hinText: S.of(context).enterYourEmail,
              textInputType: TextInputType.emailAddress,
              icon: Icons.email_rounded),
          UIHelper.verticalSpaceVerySmall(),
          CheckoutTextField(
              controller: controllerAddress,
              hinText: S.of(context).enterYourAddress,
              textInputType: TextInputType.streetAddress,
              icon: Icons.location_on_rounded),
          UIHelper.verticalSpaceMedium(),
          SizedBox(
            height: 200,
            child: TextFormField(
              style: const TextStyle(fontSize: 16.0, height: 1.0, color: AppColors.black),
              cursorColor: AppColors.primaryColor,
              controller: controllerNote,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                icon: const Icon(Icons.note_alt, size: 20),
                iconColor: AppColors.primaryColor,
                floatingLabelStyle:
                const TextStyle(color: AppColors.primaryColor, fontSize: 12),
                filled: true,
                border: const OutlineInputBorder(),
                hintText: S.of(context).enterANote,

              ),
            ),
          ),
        ]);
  }
}

class CheckoutTextField extends StatelessWidget {
  final IconData? icon;
  final String hinText;
  final TextInputType textInputType;
  final TextEditingController controller;

  const CheckoutTextField(
      {super.key,
      this.icon,
      required this.hinText,
      required this.textInputType,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.primaryColor,
      controller: controller,
      keyboardType: textInputType,
      style: shoesTextStyle.copyWith(fontSize: 16),
      decoration: InputDecoration(
        icon: Icon(icon, size: 20),
        iconColor: AppColors.primaryColor,
        floatingLabelStyle:
            const TextStyle(color: AppColors.primaryColor, fontSize: 12),
        filled: true,
        fillColor: AppColors.backgroundLight,
        border: const UnderlineInputBorder(),
        labelText: hinText,
        labelStyle: const TextStyle(fontSize: 14),
      ),
    );
  }
}

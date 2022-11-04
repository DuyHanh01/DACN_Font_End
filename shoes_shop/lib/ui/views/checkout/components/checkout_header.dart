import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';

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
              hinText: "Enter your firstname",
              textInputType: TextInputType.name,
              icon: Icons.person_rounded),
          CheckoutTextField(
              controller: controllerLastName,
              hinText: "Enter your lastname",
              textInputType: TextInputType.name,
              icon: Icons.person_rounded),
          CheckoutTextField(
              controller: controllerPhone,
              hinText: "Enter your phone",
              textInputType: TextInputType.phone,
              icon: Icons.phone_rounded),
          CheckoutTextField(
              controller: controllerMail,
              hinText: "Enter your email",
              textInputType: TextInputType.emailAddress,
              icon: Icons.email_rounded),
          CheckoutTextField(
              controller: controllerAddress,
              hinText: "Enter your address",
              textInputType: TextInputType.streetAddress,
              icon: Icons.location_on_rounded),
          UIHelper.verticalSpaceMedium(),
          SizedBox(
            height: 200,
            child: TextFormField(
              style: TextStyle(fontSize: 16.0, height: 1.0, color: AppColors.black),
              cursorColor: AppColors.primaryColor,
              controller: controllerNote,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                icon: Icon(Icons.note_alt, size: 20),
                iconColor: AppColors.primaryColor,
                floatingLabelStyle:
                TextStyle(color: AppColors.primaryColor, fontSize: 12),
                filled: true,
                border: OutlineInputBorder(),
                hintText: 'Enter a note',

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

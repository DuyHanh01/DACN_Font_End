import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/view_models/user_view_model.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import '../../../shared/ui_helpers.dart';

class AccountHeader extends StatelessWidget {
  const AccountHeader(
      {Key? key,
      required this.controllerFirstName,
      required this.controllerLastName,
      required this.controllerPhone,
      required this.controllerMail,
      required this.controllerAddress,
      required this.controllerNote,})
      : super(key: key);
  final TextEditingController controllerFirstName;
  final TextEditingController controllerLastName;
  final TextEditingController controllerPhone;
  final TextEditingController controllerMail;
  final TextEditingController controllerAddress;
  final TextEditingController controllerNote;

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);
    return Column(children: <Widget>[
      ProfileTextField(
        controller: controllerFirstName,
        hinText: userViewModel.users!.firstName!,
        textInputType: TextInputType.name,
        labelText: 'First Name',
      ),
      UIHelper.verticalSpaceVerySmall(),
      ProfileTextField(
          controller: controllerLastName,
          hinText: userViewModel.users!.lastName!,
          textInputType: TextInputType.name,
          labelText: 'Last Name'),
      UIHelper.verticalSpaceVerySmall(),
      ProfileTextField(
          controller: controllerPhone,
          hinText:  userViewModel.users!.phone!,
          textInputType: TextInputType.phone,
          labelText: 'Phone'),
      UIHelper.verticalSpaceVerySmall(),
      ProfileTextField(
          controller: controllerMail,
          hinText:  userViewModel.users!.email!,
          textInputType: TextInputType.emailAddress,
          labelText: 'Email'),
      UIHelper.verticalSpaceVerySmall(),
      ProfileTextField(
          controller: controllerAddress,
          hinText:  userViewModel.users!.address!,
          textInputType: TextInputType.streetAddress,
          labelText: 'Address'),
      UIHelper.verticalSpaceMedium(),
    ]);
  }
}

class ProfileTextField extends StatelessWidget {
  final String labelText;
  final String hinText;
  final TextInputType textInputType;
  final TextEditingController controller;

  const ProfileTextField(
      {super.key,
      required this.labelText,
      required this.hinText,
      required this.textInputType,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextField(
        cursorColor: AppColors.primaryColor,
        controller: controller,
        keyboardType: textInputType,
        style: hinTextStyle,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelStyle:
              const TextStyle(color: AppColors.primaryColor, fontSize: 15),
          labelText: labelText,
          hintText: hinText,
          hintStyle: hinTextStyle,
          labelStyle: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}

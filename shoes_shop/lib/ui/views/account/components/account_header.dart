import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/view_models/user_view_model.dart';
import 'package:shoes_shop/generated/l10n.dart';
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
        hinText: userViewModel.users != null ? userViewModel.users!.firstName! : S.of(context).firstName,
        textInputType: TextInputType.name,
        labelText: S.of(context).firstName,
      ),
      UIHelper.verticalSpaceVerySmall(),
      ProfileTextField(
          controller: controllerLastName,
          hinText: userViewModel.users != null ? userViewModel.users!.lastName! : S.of(context).lastName,
          textInputType: TextInputType.name,
          labelText: S.of(context).lastName),
      UIHelper.verticalSpaceVerySmall(),
      ProfileTextField(
          controller: controllerPhone,
          hinText:  userViewModel.users != null ? userViewModel.users!.phone! : S.of(context).phone,
          textInputType: TextInputType.phone,
          labelText: S.of(context).phone),
      UIHelper.verticalSpaceVerySmall(),
      ProfileTextField(
          controller: controllerMail,
          hinText:  userViewModel.users != null ? userViewModel.users!.email! : S.of(context).email,
          textInputType: TextInputType.emailAddress,
          labelText: S.of(context).email),
      UIHelper.verticalSpaceVerySmall(),
      ProfileTextField(
          controller: controllerAddress,
          hinText:  userViewModel.users != null ? userViewModel.users!.address! : S.of(context).address,
          textInputType: TextInputType.streetAddress,
          labelText: S.of(context).address),
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

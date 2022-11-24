import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/shared/ui_helpers.dart';

import '../../../shared/text_styles.dart';

class NewPassHeader extends StatefulWidget {
  const NewPassHeader({Key? key, required this.controllerNewPass, required this.controllerReNewPass}) : super(key: key);
  final TextEditingController controllerNewPass;
  final TextEditingController controllerReNewPass;

  @override
  State<NewPassHeader> createState() => _NewPassHeaderState();
}

class _NewPassHeaderState extends State<NewPassHeader> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      UIHelper.verticalSpaceMedium(),
      loginTextField(true, S.of(context).enterNewPass, TextInputType.visiblePassword,
          widget.controllerNewPass),
      loginTextField(true, S.of(context).enterRePass, TextInputType.visiblePassword,
          widget.controllerReNewPass),
    ]);
  }

  Widget loginTextField(bool state, String hinText, TextInputType textInputType,
      TextEditingController controller) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: TextField(
        cursorColor: AppColors.primaryColor,
        obscureText: state ? showPassword : false,
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

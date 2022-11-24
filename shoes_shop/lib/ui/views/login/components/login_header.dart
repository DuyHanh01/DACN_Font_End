import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/shared/ui_helpers.dart';

class LoginHeader extends StatefulWidget {
  final TextEditingController controllerUser;
  final TextEditingController controllerPass;

  const LoginHeader(
      {Key? key, required this.controllerUser, required this.controllerPass})
      : super(key: key);

  @override
  State<LoginHeader> createState() => LoginHeaderState();
}

class LoginHeaderState extends State<LoginHeader> {
  bool showPassword = true;
  var userInvalid = false;
  var passInvalid = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      const Text('Welcome Back', style: wellComeStyle),
      UIHelper.verticalSpaceMedium(),
      SizedBox(width: 360, child: Image.asset('assets/images/main.png')),
      loginTextField(false, S.of(context).enterYourEmail,
          TextInputType.emailAddress, widget.controllerUser),
      loginTextField(true, S.of(context).enterYourPass,
          TextInputType.visiblePassword, widget.controllerPass),
      TextButton(
        onPressed: () {
          Navigator.pushNamed(context, RoutePaths.forgotPass);
        },
        child: Text(
          S.of(context).forgotPass,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryColor),
        ),
      ),
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
            suffixIcon: state
                ? IconButton(
                    icon: const Icon(Icons.remove_red_eye_rounded,
                        color: AppColors.lightGrey),
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    })
                : null,
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

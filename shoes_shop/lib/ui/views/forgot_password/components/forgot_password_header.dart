import 'dart:async';

import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/shared/ui_helpers.dart';
import 'package:shoes_shop/ui/widgets/default_button.dart';

class ForgotPasswordHeader extends StatefulWidget {
  final TextEditingController controllerUser;
  final TextEditingController controllerOTP;
  const ForgotPasswordHeader(
      {Key? key, required this.controllerUser, required this.controllerOTP})
      : super(key: key);
  @override
  State<ForgotPasswordHeader> createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPasswordHeader> {
  bool submitValid = false;
  EmailAuth emailAuth = EmailAuth(
    sessionName: "VHIT Sneaker",
  );

  void verify() {
    var res = emailAuth.validateOtp(
        recipientMail: widget.controllerUser.value.text,
        userOtp: widget.controllerOTP.value.text);
    if (res) {
      Navigator.pushNamed(context, RoutePaths.newPass, arguments: widget.controllerUser.text);
    }
  }

  void sendOtp() async {
    bool result = await emailAuth.sendOtp(
        recipientMail: widget.controllerUser.value.text, otpLength: 5);
    if (result) {
      setState(() {
        submitValid = true;
      });
    }
  }

  late Timer _timer;
  bool showPassword = true;
  int _start = 60;
  bool countdowntime = true;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            countdowntime = false;
            submitValid = false;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text(S.of(context).forgotPass, style: wellComeStyle),
      UIHelper.verticalSpaceMedium(),
      SizedBox(width: 360, child: Image.asset('assets/images/main.png')),
      loginTextField(S.of(context).enterYourEmail, TextInputType.emailAddress,
          widget.controllerUser),
      TextButton(
          onPressed: () {
            sendOtp();
            startTimer();
          },
          child: (!submitValid)
              ? Text(
                  S.of(context).requestOTP,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: AppColors.primaryColor),
                )
              : (countdowntime
                  ? Text('${S.of(context).time} $_start', style: shoesTextStyle)
                  : Text(
            S.of(context).requestOTP,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: AppColors.primaryColor),
                    ))),
      loginTextField(S.of(context).enterOTP, TextInputType.number,
          widget.controllerOTP),
      UIHelper.verticalSpaceMedium(),
      (submitValid & countdowntime)
          ? SizedBox(
              height: 55,
              width: 200,
              child: DefaultButton(
                  text: S.of(context).verify,
                  press: () {
                    verify();
                  },
                  textColor: AppColors.white,
                  backColor: AppColors.primaryColor),
            )
          : const SizedBox(height: 1)
    ]);
  }

  Widget loginTextField( String hinText, TextInputType textInputType,
      TextEditingController controller) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
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

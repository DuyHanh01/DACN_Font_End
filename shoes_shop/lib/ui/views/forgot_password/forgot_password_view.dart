import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/ui/views/forgot_password/components/forgot_password_header.dart';
import 'package:shoes_shop/ui/widgets/background.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({Key? key}) : super(key: key);

  final TextEditingController _controllerUser = TextEditingController();

  final TextEditingController _controllerOTP = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundLight,
      body: Background(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ForgotPasswordHeader(
                    //model.errorMessage,
                    controllerUser: _controllerUser,
                    controllerOTP: _controllerOTP,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/view_models/login_view_model.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/widgets/background.dart';
import 'package:shoes_shop/ui/widgets/login_header.dart';
import '../shared/ui_helpers.dart';
import '../widgets/already_have_an_account_acheck.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controllerUser = TextEditingController();
  final TextEditingController _controllerPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      builder: (BuildContext context, LoginViewModel model, Widget? child) =>
          Scaffold(
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
                    LoginHeader(
                      model.errorMessage,
                      controllerUser: _controllerUser,
                      controllerPass: _controllerPass,
                    ),
                    model.state == ViewState.Busy
                        ? const CircularProgressIndicator()
                        : SizedBox(
                            height: 60,
                            width: 325,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: AppColors.primaryColor,
                                onPrimary: AppColors.white,
                              ),
                              child: const Text(
                                'Sign In',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              onPressed: () async {
                                var loginSuccess = await model.login(
                                    _controllerUser.text, _controllerPass.text);
                                if (loginSuccess) {
                                  Navigator.pushNamed(context, '/');
                                }
                              },
                            ),
                          ),
                    UIHelper.verticalSpaceMedium(),
                    AlreadyHaveAnAccountCheck(
                      press: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

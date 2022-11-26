import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/view_models/locale_provider.dart';
import 'package:shoes_shop/core/view_models/register_view_model.dart';
import 'package:shoes_shop/generated/assets.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/shared/ui_helpers.dart';
import 'package:shoes_shop/ui/views/base_view.dart';
import 'package:shoes_shop/ui/widgets/already_have_an_account_acheck.dart';
import 'package:shoes_shop/ui/widgets/background.dart';
import 'package:shoes_shop/ui/views/register/components/register_header.dart';
import 'package:shoes_shop/ui/widgets/toast_widget.dart';
import 'package:shoes_shop/ui/widgets/toggle_language.dart';
import 'package:toggle_switch/toggle_switch.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _controllerUser = TextEditingController();
  final TextEditingController _controllerPass = TextEditingController();
  final TextEditingController _controllerRePass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    return BaseView<RegisterViewModel>(
      builder: (BuildContext context, RegisterViewModel model, Widget? child) =>
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
                child: Stack(children: [
                  Positioned(
                    right: 10,
                    top: 10,
                    child: ToggleLanguage(provider: provider),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      RegisterHeader(
                        controllerUser: _controllerUser,
                        controllerPass: _controllerPass,
                        controllerRePass: _controllerRePass,
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
                                child: Text(S.of(context).register,
                                    style: signInSignUpStyle),
                                onPressed: () async {
                                  var registerSuccess = await model.register(
                                      _controllerUser.text,
                                      _controllerPass.text,
                                      _controllerRePass.text);
                                  buildToast(model.errorMessage);
                                  if (registerSuccess) {
                                    // ignore: use_build_context_synchronously
                                    Navigator.pushNamed(
                                        context, RoutePaths.insertUser,
                                        arguments: _controllerUser.text);
                                  }
                                },
                              ),
                            ),
                      UIHelper.verticalSpaceMedium(),
                      AlreadyHaveAnAccountCheck(
                        login: false,
                        press: () {
                          Navigator.pushNamed(context, RoutePaths.login);
                        },
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/register.dart';
import 'package:shoes_shop/core/view_models/user_view_model.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/views/user/components/user_header.dart';
import 'package:shoes_shop/ui/widgets/toast_widget.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.userViewModel}) : super(key: key);
  final UserViewModel userViewModel;

  @override
  State<Body> createState() => _BodyViewState();
}

class _BodyViewState extends State<Body> {
  final TextEditingController _controllerFirstName = TextEditingController();
  final TextEditingController _controllerLastName = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerAddress = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Register register = Provider.of<Register>(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            margin:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                UserHeader(
                  controllerFirstName: _controllerFirstName,
                  controllerLastName: _controllerLastName,
                  controllerAddress: _controllerAddress,
                  controllerMail: _controllerEmail,
                  controllerPhone: _controllerPhone,
                ),
                widget.userViewModel.state == ViewState.Busy
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
                          child: const Text('Confirm', style: signInSignUpStyle),
                          onPressed: () async {
                            var suerSuccess =
                                await widget.userViewModel.insertUser(
                              register.accountid!,
                              _controllerFirstName.text,
                              _controllerLastName.text,
                              _controllerPhone.text,
                              _controllerEmail.text,
                              _controllerAddress.text,
                            );
                            buildToast(widget.userViewModel.errorMessage);
                            if (suerSuccess) {
                              Navigator.pushNamed(context, RoutePaths.success);
                            }
                          },
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

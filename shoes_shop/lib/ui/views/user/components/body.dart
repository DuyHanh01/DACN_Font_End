import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/register.dart';
import 'package:shoes_shop/core/view_models/user_view_model.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/shared/text_styles.dart';
import 'package:shoes_shop/ui/views/user/components/user_header.dart';
import 'package:shoes_shop/ui/widgets/toast_widget.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.userViewModel, required this.username})
      : super(key: key);
  final UserViewModel userViewModel;
  final String username;

  @override
  State<Body> createState() => _BodyViewState();
}

class _BodyViewState extends State<Body> {
  final TextEditingController _controllerFirstName = TextEditingController();
  final TextEditingController _controllerLastName = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
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
                          child: Text(S.of(context).confirm, style: signInSignUpStyle),
                          onPressed: () async {
                            var userSuccess =
                                await widget.userViewModel.insertUser(
                              register.accountid!,
                              _controllerFirstName.text.trim(),
                              _controllerLastName.text.trim(),
                              _controllerPhone.text.trim(),
                              widget.username.trim(),
                              _controllerAddress.text.trim(),
                            );
                            buildToast(widget.userViewModel.errorMessage);
                            if (userSuccess) {
                              // ignore: use_build_context_synchronously
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/view_models/user_view_model.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/shared/ui_helpers.dart';
import 'package:shoes_shop/ui/views/account/components/account_header.dart';
import 'package:shoes_shop/ui/views/account/components/account_pic.dart';
import 'package:shoes_shop/ui/widgets/default_button.dart';
import 'package:shoes_shop/ui/widgets/toast_widget.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final TextEditingController _controllerFirstName = TextEditingController();
  final TextEditingController _controllerLastName = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerAddress = TextEditingController();
  final TextEditingController _controllerNote = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            margin:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const AccountPic(),
                AccountHeader(
                  controllerFirstName: _controllerFirstName,
                  controllerLastName: _controllerLastName,
                  controllerAddress: _controllerAddress,
                  controllerMail: _controllerEmail,
                  controllerPhone: _controllerPhone,
                  controllerNote: _controllerNote,
                ),
                UIHelper.verticalSpaceSmall(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: DefaultButton(
                          text: "Save",
                          press: () async {
                            String firstName = "";
                            String lastName = "";
                            String phone = "";
                            String email = "";
                            String address = "";
                            if (_controllerFirstName.text != "") {
                              firstName = _controllerFirstName.text;
                            } else {
                              firstName = userViewModel.users!.firstName!;
                            }
                            if (_controllerLastName.text != "") {
                              lastName = _controllerLastName.text;
                            } else {
                              lastName = userViewModel.users!.lastName!;
                            }
                            if (_controllerPhone.text != "") {
                              phone = _controllerPhone.text;
                            } else {
                              phone = userViewModel.users!.phone!;
                            }
                            if (_controllerEmail.text != "") {
                              email = _controllerEmail.text;
                            } else {
                              email = userViewModel.users!.email!;
                            }
                            if (_controllerAddress.text != "") {
                              address = _controllerAddress.text;
                            } else {
                              address = userViewModel.users!.address!;
                            }
                            var loginSuccess = await userViewModel.updateUser(
                                userViewModel.users!.accountid!,
                                userViewModel.users!.userid!,
                                firstName,
                                lastName,
                                phone,
                                email,
                                address,
                                userViewModel.users!.avatar!);
                            buildToast(userViewModel.errorMessage);
                            if (loginSuccess) {
                              Navigator.pushNamed(context, RoutePaths.profile);
                            }
                          },
                          textColor: AppColors.white,
                          backColor: AppColors.primaryColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

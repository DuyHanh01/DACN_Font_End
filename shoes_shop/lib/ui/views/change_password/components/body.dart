import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/view_models/changepass_view_model.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/views/change_password/components/change_pass_header.dart';
import 'package:shoes_shop/ui/widgets/default_button.dart';
import 'package:shoes_shop/ui/widgets/toast_widget.dart';

class Body extends StatelessWidget {
  final ChangePassViewModel model;
  const Body({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerCurrentPass = TextEditingController();
    final TextEditingController controllerNewPass = TextEditingController();
    final TextEditingController controllerReNewPass = TextEditingController();
    Size size = MediaQuery.of(context).size;
    Account account = Provider.of<Account>(context);
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: ChangePassHeader(
              controllerCurrentPass: controllerCurrentPass,
              controllerNewPass: controllerNewPass,
              controllerReNewPass: controllerReNewPass),
        ),
        SliverToBoxAdapter(child: SizedBox(height: size.height * 0.4)),
        SliverPadding(
          padding: EdgeInsets.all(20),
          sliver: SliverToBoxAdapter(
              child: SizedBox(
            height: 55,
            child: DefaultButton(
                text: "Confirm",
                press: () async {
                  String Oldpassword = controllerCurrentPass.text;
                  String password = controllerNewPass.text;
                  String Repassword = controllerReNewPass.text;
                  var acc = Account(account.accountid, account.username,Oldpassword, password, Repassword, 0);
                  await model.changePass(acc);
                  buildToast(model.errorMessage);
                },
                textColor: AppColors.white,
                backColor: AppColors.primaryColor),
          )),
        )
      ],
    );
  }
}
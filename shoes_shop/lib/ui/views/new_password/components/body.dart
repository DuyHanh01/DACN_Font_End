import 'package:flutter/material.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/view_models/changepass_view_model.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/views/new_password/components/newpass_header.dart';
import 'package:shoes_shop/ui/widgets/default_button.dart';
import 'package:shoes_shop/ui/widgets/toast_widget.dart';
class Body extends StatelessWidget {
  final String username;
  final ChangePassViewModel model;
  const Body({Key? key, required this.model, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerNewPass = TextEditingController();
    final TextEditingController controllerReNewPass = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: NewPassHeader(
              controllerNewPass: controllerNewPass,
              controllerReNewPass: controllerReNewPass),
        ),
        SliverToBoxAdapter(child: SizedBox(height: size.height * 0.4)),
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 55,
                child: DefaultButton(
                    text: S.of(context).confirm,
                    press: () async {
                      var acc = Account(0, username, null, controllerNewPass.text, controllerReNewPass.text, 0);
                      var isSuccess = await model.newPassword(acc);
                      buildToast(model.errorMessage);
                      if(isSuccess){
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamed(context, RoutePaths.login);
                      }

                    },
                    textColor: AppColors.white,
                    backColor: AppColors.primaryColor),
              )),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shoes_shop/generated/l10n.dart';
import 'package:shoes_shop/ui/views/login_success/components/body.dart';
class LoginSuccessView extends StatelessWidget {

  const LoginSuccessView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        elevation: 0,
        centerTitle: true,
        title: Text(S.of(context).loginSuccess),
      ),
      body: Body(),
    );
  }
}
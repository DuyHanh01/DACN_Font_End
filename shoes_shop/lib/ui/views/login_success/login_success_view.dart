import 'package:flutter/material.dart';
import 'package:shoes_shop/ui/views/login_success/components/body.dart';
class LoginSuccessView extends StatelessWidget {

  const LoginSuccessView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("Login Success"),
      ),
      body: Body(),
    );
  }
}
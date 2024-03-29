import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/services/authentication_service.dart';
import 'package:shoes_shop/locator.dart';
import 'package:shoes_shop/ui/router.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Account>(
      initialData: Account.initial(),
      create: (BuildContext context) =>
      locator<AuthenticationService>().accountController.stream,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Provider Architecture',
        theme: CustomAppTheme.of(context),
        initialRoute: '/wellCome',
        onGenerateRoute: MainRouter.generateRoute,
      ),
    );
  }
}
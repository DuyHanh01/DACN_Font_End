import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/config/theme.dart';
import 'package:shoes_shop/core/models/account.dart';
import 'package:shoes_shop/core/models/register.dart';
import 'package:shoes_shop/core/models/user.dart';
import 'package:shoes_shop/core/services/authentication_service.dart';
import 'package:shoes_shop/core/services/user_service.dart';
import 'package:shoes_shop/core/view_models/cart_view_model.dart';
import 'package:shoes_shop/core/view_models/search_history_view_model.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/core/view_models/sizetable_view_model.dart';
import 'package:shoes_shop/core/view_models/user_view_model.dart';
import 'package:shoes_shop/locator.dart';
import 'package:shoes_shop/ui/route/router.dart';
void main() {
  setupLocator();
  runApp(const MyApp());
}

ThemeManager _manager = ThemeManager();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<Account>(
            initialData: Account.initial(),
            create: (BuildContext context) =>
                locator<AuthenticationService>().accountController.stream),
        StreamProvider<Register>(
            initialData: Register.initial(),
            create: (BuildContext context) =>
            locator<AuthenticationService>().registerController.stream),
        StreamProvider<User>(
            initialData: User.initial(),
            create: (BuildContext context) =>
            locator<UserSerVice>().userController.stream),
        ChangeNotifierProvider.value(
          value: CartViewModel(),
        ),
        ChangeNotifierProvider.value(
          value: UserViewModel(),
        ),
        ChangeNotifierProvider.value(
          value: SearchHistoryViewModel(),
        ),
        ChangeNotifierProvider.value(
          value: ShoesViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Provider Architecture',
        theme: CustomAppThemeLight.of(context),
        darkTheme: CustomAppThemeDark.of(context),
        themeMode: _manager.themMode,
        initialRoute: '/wellCome',
        onGenerateRoute: MainRouter.generateRoute,
      ),
    );
  }
}

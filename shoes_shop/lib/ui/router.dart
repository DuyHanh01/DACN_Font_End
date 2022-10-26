import 'package:flutter/material.dart';
import 'package:shoes_shop/ui/views/home/home_view.dart';
import 'package:shoes_shop/ui/views/login/login_view.dart';
import 'package:shoes_shop/ui/views/register/register_view.dart';
import 'package:shoes_shop/ui/views/wellcome/wellcome_view.dart';

class MainRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeView());
      case '/wellCome':
        return MaterialPageRoute(builder: (_) => const WellComeView());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginView());
      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}.'),
            ),
          ),
        );
    }
  }
}
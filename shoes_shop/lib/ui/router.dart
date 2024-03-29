import 'package:flutter/material.dart';
import 'package:shoes_shop/ui/views/home_view.dart';
import 'package:shoes_shop/ui/views/login_view.dart';
import 'package:shoes_shop/ui/views/wellcome_view.dart';

class MainRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeView());
      case '/wellCome':
        return MaterialPageRoute(builder: (_) => const WellComeView());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginView());
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
import 'package:flutter/material.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/views/cart/cart_view.dart';
import 'package:shoes_shop/ui/views/detail/detail_view.dart';
import 'package:shoes_shop/ui/views/home/home_view.dart';
import 'package:shoes_shop/ui/views/login/login_view.dart';
import 'package:shoes_shop/ui/views/register/register_view.dart';
import 'package:shoes_shop/ui/views/wellcome/wellcome_view.dart';

class MainRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case RoutePaths.wellCome:
        return MaterialPageRoute(builder: (_) => const WellComeView());
      case RoutePaths.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case RoutePaths.cart:
        return MaterialPageRoute(builder: (_) => const CartView());
      case RoutePaths.register:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case RoutePaths.detailView:
        final event = settings.arguments as Shoes;
        return MaterialPageRoute(builder: (_) => DetailView(shoes: event));
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

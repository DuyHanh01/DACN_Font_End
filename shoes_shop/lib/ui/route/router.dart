import 'package:flutter/material.dart';
import 'package:shoes_shop/core/models/brand.dart';
import 'package:shoes_shop/core/models/sales.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/ui/route/route_paths.dart';
import 'package:shoes_shop/ui/views/brandshoes/brandshoes_view.dart';
import 'package:shoes_shop/ui/views/cart/cart_view.dart';
import 'package:shoes_shop/ui/views/checkout/checkout_view.dart';
import 'package:shoes_shop/ui/views/contacts/components/google_maps.dart';
import 'package:shoes_shop/ui/views/contacts/contacts_view.dart';
import 'package:shoes_shop/ui/views/detail/detail_view.dart';
import 'package:shoes_shop/ui/views/favorites/favorite_view.dart';
import 'package:shoes_shop/ui/views/home/home_view.dart';
import 'package:shoes_shop/ui/views/login/login_view.dart';
import 'package:shoes_shop/ui/views/login_success/login_success_view.dart';
import 'package:shoes_shop/ui/views/order/order_view.dart';
import 'package:shoes_shop/ui/views/orderdetais/orderdetails_view.dart';
import 'package:shoes_shop/ui/views/profile/profile_view.dart';
import 'package:shoes_shop/ui/views/register/register_view.dart';
import 'package:shoes_shop/ui/views/saledetails/saledetails_view.dart';
import 'package:shoes_shop/ui/views/user/user_view.dart';
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
      case RoutePaths.contact:
        return MaterialPageRoute(builder: (_) => const ContactsView());
      case RoutePaths.googleMap:
        return MaterialPageRoute(builder: (_) => const GoogleMaps());
      case RoutePaths.insertUser:
        return MaterialPageRoute(builder: (_) => const UserView());
      case RoutePaths.success:
        return MaterialPageRoute(builder: (_) => const LoginSuccessView());
      case RoutePaths.profile:
        return MaterialPageRoute(builder: (_) => const ProfileView());
      case RoutePaths.order:
        return MaterialPageRoute(builder: (_) => const OrderView());
      case RoutePaths.favorite:
        return MaterialPageRoute(builder: (_) => const FavoriteView());
      // case RoutePaths.ui:
      //   return MaterialPageRoute(builder: (_) => const UI());
      case RoutePaths.detailView:
        final event = settings.arguments as Shoes;
        return MaterialPageRoute(builder: (_) => DetailView(shoes: event));
      case RoutePaths.saleDetails:
        final event = settings.arguments as Sales;
        return MaterialPageRoute(builder: (_) => SaleDetailsView(sales: event));
      case RoutePaths.brandShoes:
        final event = settings.arguments as Brand;
        return MaterialPageRoute(builder: (_) => BrandShoesView(brand: event));
      case RoutePaths.orderDetail:
        final event = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => OrderDetailsView(orderid: event));
      case RoutePaths.checkout:
        return MaterialPageRoute(builder: (_) => const CheckoutView());
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

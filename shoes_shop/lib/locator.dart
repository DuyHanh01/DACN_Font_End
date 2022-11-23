import 'package:get_it/get_it.dart';
import 'package:shoes_shop/core/services/authentication_service.dart';
import 'package:shoes_shop/core/services/brand_service.dart';
import 'package:shoes_shop/core/services/comment_service.dart';
import 'package:shoes_shop/core/services/order_service.dart';
import 'package:shoes_shop/core/services/orderdetails_service.dart';
import 'package:shoes_shop/core/services/saledetails_service.dart';
import 'package:shoes_shop/core/services/sales_service.dart';
import 'package:shoes_shop/core/services/search_history_service.dart';
import 'package:shoes_shop/core/services/shoes_service.dart';
import 'package:shoes_shop/core/services/sizetable_service.dart';
import 'package:shoes_shop/core/services/user_service.dart';
import 'package:shoes_shop/core/view_models/brand_view_model.dart';
import 'package:shoes_shop/core/view_models/cart_view_model.dart';
import 'package:shoes_shop/core/view_models/comment_view_model.dart';
import 'package:shoes_shop/core/view_models/home_view_model.dart';
import 'package:shoes_shop/core/view_models/login_view_model.dart';
import 'package:shoes_shop/core/view_models/order_view_model.dart';
import 'package:shoes_shop/core/view_models/orderdetails_view_model.dart';
import 'package:shoes_shop/core/view_models/register_view_model.dart';
import 'package:shoes_shop/core/view_models/saledetails_view_model.dart';
import 'package:shoes_shop/core/view_models/sales_view_model.dart';
import 'package:shoes_shop/core/view_models/search_history_view_model.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/core/view_models/sizetable_view_model.dart';
import 'package:shoes_shop/core/view_models/user_view_model.dart';
import 'package:shoes_shop/generated/assets.dart';
import 'core/services/api.dart';
import 'core/view_models/changepass_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => BrandService());
  locator.registerLazySingleton(() => ShoesService());
  locator.registerLazySingleton(() => SizeTableService());
  locator.registerLazySingleton(() => SalesService());
  locator.registerLazySingleton(() => SaleDetailsService());
  locator.registerLazySingleton(() => UserSerVice());
  locator.registerLazySingleton(() => OrderService());
  locator.registerLazySingleton(() => OrderDetailsService());
  locator.registerLazySingleton(() => CommentService());
  locator.registerLazySingleton(() => SearchHistoryService());

  locator.registerFactory(() => RegisterViewModel());
  locator.registerFactory(() => UserViewModel());
  locator.registerFactory(() => LoginViewModel());
  locator.registerFactory(() => HomeViewModel());
  locator.registerFactory(() => ShoesViewModel());
  locator.registerFactory(() => BrandViewModel());
  locator.registerFactory(() => SalesViewModel());
  locator.registerFactory(() => CartViewModel());
  locator.registerFactory(() => SizeTableViewModel());
  locator.registerFactory(() => SaleDetailsViewModel());
  locator.registerFactory(() => OrderViewModel());
  locator.registerFactory(() => OrderDetailsViewModel());
  locator.registerFactory(() => CommentViewModel());
  locator.registerFactory(() => ChangePassViewModel());
  locator.registerFactory(() => SearchHistoryViewModel());
  locator.registerFactory(() => LocaleProvider());

}
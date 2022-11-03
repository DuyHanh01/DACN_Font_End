import 'package:get_it/get_it.dart';
import 'package:shoes_shop/core/services/authentication_service.dart';
import 'package:shoes_shop/core/services/brand_service.dart';
import 'package:shoes_shop/core/services/saledetails_service.dart';
import 'package:shoes_shop/core/services/sales_service.dart';
import 'package:shoes_shop/core/services/shoes_service.dart';
import 'package:shoes_shop/core/services/sizetable_service.dart';
import 'package:shoes_shop/core/view_models/brand_view_model.dart';
import 'package:shoes_shop/core/view_models/cart_view_model.dart';
import 'package:shoes_shop/core/view_models/home_view_model.dart';
import 'package:shoes_shop/core/view_models/login_view_model.dart';
import 'package:shoes_shop/core/view_models/register_view_model.dart';
import 'package:shoes_shop/core/view_models/saledetails_view_model.dart';
import 'package:shoes_shop/core/view_models/sales_view_model.dart';
import 'package:shoes_shop/core/view_models/shoes_view_model.dart';
import 'package:shoes_shop/core/view_models/sizetable_view_model.dart';
import 'core/services/api.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => BrandService());
  locator.registerLazySingleton(() => ShoesService());
  locator.registerLazySingleton(() => SizeTableService());
  locator.registerLazySingleton(() => SalesService());
  locator.registerLazySingleton(() => SaleDetailsService());

  locator.registerFactory(() => LoginViewModel());
  locator.registerFactory(() => CartViewModel());
  locator.registerFactory(() => RegisterViewModel());
  locator.registerFactory(() => SizeTableViewModel());
  locator.registerFactory(() => SalesViewModel());
  locator.registerFactory(() => SaleDetailsViewModel());
  locator.registerFactory(() => BrandViewModel());
  locator.registerFactory(() => ShoesViewModel());
  locator.registerFactory(() => HomeViewModel());


}
import 'package:shoes_shop/core/models/brand.dart';
import 'package:shoes_shop/core/services/api.dart';
import 'package:shoes_shop/locator.dart';

class BrandService {
  final Api _api = locator<Api>();

  String message = "";

  List<Brand?>? _brand = <Brand>[];
  List<Brand?>? get brands => _brand;

  Future<bool> getAllBrands() async {
    var fetchedBrand = await _api.getAllBrands();
    var isSuccessBrand = fetchedBrand.isSuccess;
    _brand = fetchedBrand.data;
    message = fetchedBrand.Message!;

    return isSuccessBrand ?? false;
  }
}

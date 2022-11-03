import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/brand.dart';
import 'package:shoes_shop/core/services/brand_service.dart';
import 'package:shoes_shop/core/view_models/base_view_model.dart';
import 'package:shoes_shop/locator.dart';

class BrandViewModel extends BaseViewModel{
  final BrandService _brandService = locator<BrandService>();

  String errorMessage = '';
  List<Brand?>? get brands => _brandService.brands;

  Future<bool> getAllBrands() async {
    setState(ViewState.Busy);

    var success = await _brandService.getAllBrands();
    String message = _brandService.message;

    if (!success) {
      errorMessage = message;
      setState(ViewState.Idle);
      return false;
    } else {
      errorMessage = message;
      setState(ViewState.Idle);
      return success;
    }
  }
}
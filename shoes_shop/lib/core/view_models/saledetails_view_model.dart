import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/saledetails.dart';
import 'package:shoes_shop/core/services/saledetails_service.dart';
import 'package:shoes_shop/core/view_models/base_view_model.dart';
import 'package:shoes_shop/locator.dart';

class SaleDetailsViewModel extends BaseViewModel {
  final SaleDetailsService _saleDetailsService = locator<SaleDetailsService>();

  String errorMessage = '';

  List<SaleDetails?>? get saleDetails => _saleDetailsService.saleDetails;

  Future<bool> getAllSaleDetailsById(int saleid) async {
    setState(ViewState.Busy);


    var saleId = saleid;
    var success = await _saleDetailsService.getSaleDetailsBySaleId(saleId);
    String message = _saleDetailsService.message;

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

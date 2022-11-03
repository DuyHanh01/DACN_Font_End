import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/sales.dart';
import 'package:shoes_shop/core/services/sales_service.dart';
import 'package:shoes_shop/core/view_models/base_view_model.dart';
import 'package:shoes_shop/locator.dart';

class SalesViewModel extends BaseViewModel{
  final SalesService _salesService = locator<SalesService>();

  String errorMessage = '';

  List<Sales?>? get sales => _salesService.sales;

  Future<bool> getAllSales() async {
    setState(ViewState.Busy);


    var success = await _salesService.getAllSales();
    String message = _salesService.message;

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
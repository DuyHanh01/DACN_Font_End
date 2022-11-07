import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/orderdetails.dart';
import 'package:shoes_shop/core/services/orderdetails_service.dart';
import 'package:shoes_shop/core/view_models/base_view_model.dart';
import 'package:shoes_shop/locator.dart';

class OrderDetailsViewModel extends BaseViewModel {
  final OrderDetailsService _orderDetailsService =
      locator<OrderDetailsService>();

  String errorMessage = '';
  List<OrderDetails?>? get orderDetails => _orderDetailsService.orderDetails;

  Future<bool> getOrderDetails(int orderid) async {
    setState(ViewState.Busy);

    var accountId = orderid;
    var success = await _orderDetailsService.getOrderDetails(accountId);
    String message = _orderDetailsService.message;

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
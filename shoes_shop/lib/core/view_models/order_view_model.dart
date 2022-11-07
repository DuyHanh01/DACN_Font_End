import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/order.dart';
import 'package:shoes_shop/core/services/order_service.dart';
import 'package:shoes_shop/core/view_models/base_view_model.dart';
import 'package:shoes_shop/locator.dart';

class OrderViewModel extends BaseViewModel {
  final OrderService _orderService = locator<OrderService>();

  String errorMessage = '';
  List<Order?>? get orders => _orderService.orders;

  Future<bool> getOrderByAccountId(int accountid) async {
    setState(ViewState.Busy);

    var accountId = accountid;
    var success = await _orderService.getOrderByAccountId(accountId);
    String message = _orderService.message;

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
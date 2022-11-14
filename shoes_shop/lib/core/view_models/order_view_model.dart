import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/checkout.dart';
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

  Future<bool> insertOrder(Checkout checkout) async {
    setState(ViewState.Busy);

    var success = await _orderService.insertOrder(checkout);
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

  Future<bool> updateOrder(Order order) async {
    setState(ViewState.Busy);

    var success = await _orderService.updateOrder(order);
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

  Future<bool> cancelOrder(int orderid) async {
    setState(ViewState.Busy);

    var success = await _orderService.cancelOrder(orderid);
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

  Future<bool> deleteOrder(int orderid) async {
    setState(ViewState.Busy);

    var success = await _orderService.deleteOrder(orderid);
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

  void sortOrder(List<Order?>? list){
    list!.sort((a, b) => a!.statusid.compareTo(b!.statusid));
  }
}

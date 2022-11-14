import 'package:shoes_shop/core/models/checkout.dart';
import 'package:shoes_shop/core/models/order.dart';
import 'package:shoes_shop/core/services/api.dart';
import 'package:shoes_shop/locator.dart';

class OrderService {
  final Api _api = locator<Api>();

  String message = "";

  List<Order?>? _orders = <Order>[];
  List<Order?>? get orders => _orders;

  Future<bool> getOrderByAccountId(int accountid) async {
    var fetchedOrder = await _api.getOrderByAccountId(accountid);
    var isSuccessOrder = fetchedOrder.isSuccess;

    message = fetchedOrder.Message!;
    if (isSuccessOrder != null && isSuccessOrder) {
      if (fetchedOrder.data != null) {
        _orders = fetchedOrder.data;
      }
    }else{
      _orders = [];
    }

    return isSuccessOrder ?? false;
  }

  Future<bool> insertOrder(Checkout checkout) async {
    var fetchedOrder = await _api.insertOrder(checkout);
    var isSuccessOrder = fetchedOrder.isSuccess;
    _orders = fetchedOrder.data;
    message = fetchedOrder.Message!;
    return isSuccessOrder ?? false;
  }

  Future<bool> updateOrder(Order order) async {
    var fetchedOrder = await _api.updateOrder(order);
    var isSuccessOrder = fetchedOrder.isSuccess;
    message = fetchedOrder.Message!;
    return isSuccessOrder ?? false;
  }

  Future<bool> cancelOrder(int orderid) async {
    var fetchedOrder = await _api.cancelOrder(orderid);
    var isSuccessOrder = fetchedOrder.isSuccess;
    message = fetchedOrder.Message!;
    if (isSuccessOrder != null && isSuccessOrder) {
      if (fetchedOrder.data != null) {
        _orders = fetchedOrder.data;
      }
    }else{
      _orders = [];
    }
    return isSuccessOrder ?? false;
  }

  Future<bool> deleteOrder(int orderid) async {
    var fetchedOrder = await _api.deleteOrder(orderid);
    var isSuccessOrder = fetchedOrder.isSuccess;
    message = fetchedOrder.Message!;
    return isSuccessOrder ?? false;
  }
}

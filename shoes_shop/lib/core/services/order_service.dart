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
    _orders = fetchedOrder.data;
    message = fetchedOrder.Message!;

    return isSuccessOrder ?? false;
  }
}

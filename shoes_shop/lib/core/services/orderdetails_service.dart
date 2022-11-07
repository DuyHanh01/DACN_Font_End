import 'package:shoes_shop/core/models/orderdetails.dart';
import 'package:shoes_shop/core/services/api.dart';
import 'package:shoes_shop/locator.dart';

class OrderDetailsService {
  final Api _api = locator<Api>();

  String message = "";

  List<OrderDetails?>? _orderDetails = <OrderDetails>[];
  List<OrderDetails?>? get orderDetails => _orderDetails;

  Future<bool> getOrderDetails(int orderid) async {
    var fetchedOrderDetails = await _api.getOrderDetails(orderid);
    var isSuccessOrderDetails = fetchedOrderDetails.isSuccess;
    _orderDetails = fetchedOrderDetails.data;
    message = fetchedOrderDetails.Message!;

    return isSuccessOrderDetails ?? false;
  }
}

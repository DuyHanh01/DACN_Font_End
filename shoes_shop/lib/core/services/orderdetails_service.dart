import 'package:shoes_shop/core/models/orderdetails.dart';
import 'package:shoes_shop/core/models/rating.dart';
import 'package:shoes_shop/core/services/api.dart';
import 'package:shoes_shop/locator.dart';

class OrderDetailsService {
  final Api _api = locator<Api>();

  String message = "";
  String messageRate = "";

  List<OrderDetails?>? _orderDetails = <OrderDetails>[];
  List<OrderDetails?>? get orderDetails => _orderDetails;

  Future<bool> getOrderDetails(int orderid) async {
    var fetchedOrderDetails = await _api.getOrderDetails(orderid);
    var isSuccessOrderDetails = fetchedOrderDetails.isSuccess;
    _orderDetails = fetchedOrderDetails.data;
    message = fetchedOrderDetails.Message!;

    return isSuccessOrderDetails ?? false;
  }

  Future<bool> insertRating(Rating rating) async {
    var fetchedRating = await _api.insertRating(rating);
    var isSuccessRating = fetchedRating.isSuccess;
    messageRate = fetchedRating.Message!;

    return isSuccessRating ?? false;
  }
}

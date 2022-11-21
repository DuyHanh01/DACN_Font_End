import 'package:shoes_shop/core/enum/viewstate.dart';
import 'package:shoes_shop/core/models/orderdetails.dart';
import 'package:shoes_shop/core/models/rating.dart';
import 'package:shoes_shop/core/models/shoes.dart';
import 'package:shoes_shop/core/services/orderdetails_service.dart';
import 'package:shoes_shop/core/view_models/base_view_model.dart';
import 'package:shoes_shop/locator.dart';

class OrderDetailsViewModel extends BaseViewModel {
  final OrderDetailsService _orderDetailsService =
      locator<OrderDetailsService>();

  String errorMessage = '';
  String errorMessageRating = '';
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

  Future<bool> insertRating(Rating rating) async {
    setState(ViewState.Busy);

    var success = await _orderDetailsService.insertRating(rating);
    String message = _orderDetailsService.messageRate;

    if (!success) {
      errorMessageRating = message;
      setState(ViewState.Idle);
      return false;
    } else {
      errorMessageRating = message;
      setState(ViewState.Idle);
      return success;
    }
  }

  bool checkShoeName(OrderDetails? shoes) {
    if (shoes!.shoename!.length > 26) {
      return true;
    }
    return false;
  }
}

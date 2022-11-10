import 'package:shoes_shop/core/models/order.dart';
import 'package:shoes_shop/core/models/orderdetails.dart';

class Checkout{
  Order order;
  List<OrderDetails> lstOrderDetails;

  Checkout(this.order, this.lstOrderDetails);

  Checkout.fromJson(Map<String, dynamic> json)
      : order = json['order'],
        lstOrderDetails = json['lstOrderDetails'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order'] = order;
    data['lstOrderDetails'] = lstOrderDetails;
    return data;
  }
}
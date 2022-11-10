class OrderDetails {
  int? orderid;
  int shoeid;
  int quantity;
  int size;
  double price;
  double? total;
  int? statusid;
  String? shoename;
  String? image1;

  OrderDetails(this.orderid, this.shoeid, this.quantity, this.size, this.price,
      this.total, this.statusid, this.shoename, this.image1);

  OrderDetails.fromJson(Map<String, dynamic> json)
      : orderid = json['orderid'],
        shoeid = json['shoeid'],
        quantity = json['quantity'],
        size = json['size'],
        price = json['price'],
        statusid = json['statusid'],
        shoename = json['shoename'],
        image1 = json['image1'],
        total = json['total'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderid'] = orderid;
    data['shoeid'] = shoeid;
    data['quantity'] = quantity;
    data['size'] = size;
    data['price'] = price;
    data['firstName'] = statusid;
    data['shoename'] = shoename;
    data['image1'] = image1;
    return data;
  }
}

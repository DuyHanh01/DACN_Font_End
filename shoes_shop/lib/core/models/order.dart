class Order {
  int? orderid;
  int accountid;
  int statusid;
  String? statusname;
  String? createdate;
  String? deliverydate;
  String firstName;
  String lastName;
  String phone;
  String email;
  String address;
  String? note;
  double total;
  bool payment;
  String? momo;

  Order(
      this.orderid,
      this.accountid,
      this.statusid,
      this.statusname,
      this.createdate,
      this.deliverydate,
      this.firstName,
      this.lastName,
      this.phone,
      this.email,
      this.address,
      this.note,
      this.total,
      this.payment,
      this.momo);

  Order.fromJson(Map<String, dynamic> json)
      : orderid = json['orderid'],
        accountid = json['accountid'],
        statusid = json['statusid'],
        statusname = json['statusname'],
        createdate = json['createdate'],
        deliverydate = json['deliverydate'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        phone = json['phone'],
        email = json['email'],
        address = json['address'],
        note = json['note'],
        total = json['total'],
        payment = json['payment'],
        momo = json['momo'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderid'] = orderid;
    data['accountid'] = accountid;
    data['statusid'] = statusid;
    data['statusname'] = statusname;
    data['createdate'] = createdate;
    data['deliverydate'] = deliverydate;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phone'] = phone;
    data['email'] = email;
    data['address'] = address;
    data['note'] = note;
    data['total'] = total;
    data['payment'] = payment;
    data['momo'] = momo;
    return data;
  }
}

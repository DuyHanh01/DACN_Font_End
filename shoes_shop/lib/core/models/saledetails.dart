class SaleDetails {
  final int? saleid;
  final int shoeid;
  final double? saleprice;
  final int? updateby;
  final String? shoename;
  final double? price;
  final String? image1;

  SaleDetails(
      {required this.saleid,
      required this.shoeid,
      required this.saleprice,
      required this.updateby,
      required this.shoename,
      required this.price,
      required this.image1});

  SaleDetails.fromJson(Map<String, dynamic> json)
      : saleid = json['saleid'],
        shoeid = json['shoeid'],
        saleprice = json['saleprice'],
        updateby = json['updateby'],
        shoename = json['shoename'],
        price = json['price'],
        image1 = json['image1'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['saleid'] = saleid;
    data['shoeid'] = shoeid;
    data['saleprice'] = saleprice;
    data['updateby'] = updateby;
    data['shoename'] = shoename;
    data['price'] = price;
    data['image1'] = image1;
    return data;
  }
}

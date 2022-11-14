class Shoes {
  int shoeid;
  String shoename;
  double price;
  double? rate;
  String description;
  int? stock;
  int? purchased;
  bool shoenew;
  String createdate;
  int? createby;
  int? updateby;
  String? dateupdate;
  bool active;
  int brandid;
  int categoryid;
  String image1;
  String? image2;
  String? image3;
  String? image4;
  double? saleprice;
  double? percent;
  String? salename;
  String? startday;
  String? endday;
  bool? isfavorite;

  Shoes(
      this.shoeid,
      this.shoename,
      this.price,
      this.rate,
      this.description,
      this.stock,
      this.purchased,
      this.shoenew,
      this.createdate,
      this.createby,
      this.updateby,
      this.dateupdate,
      this.active,
      this.brandid,
      this.categoryid,
      this.image1,
      this.image2,
      this.image3,
      this.image4,
      this.saleprice,
      this.percent,
      this.salename,
      this.startday,
      this.endday,
      this.isfavorite);

  Shoes.initial()
      : shoeid = 0,
        shoename = '',
        price = 0,
        rate = 0,
        description = '',
        stock = 0,
        purchased = 0,
        shoenew = false,
        createdate = DateTime.now().toString(),
        createby = 0,
        updateby = 0,
        dateupdate = DateTime.now().toString(),
        active = false,
        brandid = 0,
        categoryid = 0,
        image1 = '',
        image2 = '',
        image3 = '',
        image4 = '',
        saleprice = 0.0,
        percent = 0.0,
        salename = '',
        startday = DateTime.now().toString(),
        endday = DateTime.now().toString(),
        isfavorite = false;

  Shoes.fromJson(Map<String, dynamic> json)
      : shoeid = json['shoeid'],
        shoename = json['shoename'],
        price = json['price'],
        rate = json['rate'],
        description = json['description'],
        stock = json['stock'],
        purchased = json['purchased'],
        shoenew = json['shoenew'],
        createdate = json['createdate'],
        createby = json['createby'],
        updateby = json['updateby'],
        dateupdate = json['dateupdate'],
        active = json['active'],
        brandid = json['brandid'],
        categoryid = json['categoryid'],
        image1 = json['image1'],
        image2 = json['image2'],
        image3 = json['image3'],
        image4 = json['image4'],
        saleprice = json['saleprice'],
        percent = json['percent'],
        salename = json['salename'],
        startday = json['startday'],
        endday = json['endday'],
        isfavorite = json['isfavorite'];
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['shoeid'] = shoeid;
    data['shoename'] = shoename;
    data['price'] = price;
    data['rate'] = rate;
    data['description'] = description;
    data['stock'] = stock;
    data['purchased'] = purchased;
    data['shoenew'] = shoenew;
    data['createdate'] = createdate;
    data['createby'] = createby;
    data['updateby'] = updateby;
    data['dateupdate'] = dateupdate;
    data['active'] = active;
    data['brandid'] = brandid;
    data['categoryid'] = categoryid;
    data['image1'] = image1;
    data['image2'] = image2;
    data['image3'] = image3;
    data['image4'] = image4;
    data['saleprice'] = saleprice;
    data['percent'] = percent;
    data['salename'] = salename;
    data['startday'] = startday;
    data['endday'] = endday;
    data['isfavorite'] = isfavorite;
    return data;
  }
}

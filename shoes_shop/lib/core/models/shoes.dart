class Shoes {
  int? shoeid;
  String shoename;
  Shoes(this.shoeid, this.shoename);

  Shoes.initial()
      : shoeid = 0,
        shoename = '';

  Shoes.fromJson(Map<String, dynamic> json)
      : shoeid = json['shoeid'],
        shoename = json['shoename'];
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['shoeid'] = shoeid;
    data['shoename'] = shoename;
    return data;
  }
}

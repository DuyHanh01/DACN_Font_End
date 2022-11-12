class Rating {
  int accountid;
  int shoeid;
  double rate;

  Rating(this.accountid, this.shoeid, this.rate);

  Rating.fromJson(Map<String, dynamic> json)
      : accountid = json['accountid'],
        shoeid = json['shoeid'],
        rate = json['rate'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accountid'] = accountid;
    data['shoeid'] = shoeid;
    data['rate'] = rate;
    return data;
  }

}
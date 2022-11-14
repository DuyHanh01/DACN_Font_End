class Favorite {
  int accountid;
  int shoeid;

  Favorite(this.accountid, this.shoeid);

  Favorite.fromJson(Map<String, dynamic> json)
      : accountid = json['accountid'],
        shoeid = json['shoeid'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accountid'] = accountid;
    data['shoeid'] = shoeid;
    return data;
  }
}

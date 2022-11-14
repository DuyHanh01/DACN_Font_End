class Brand {
  final int? brandid;
  final String? brandname;
  final String? logo;
  final String? information;


  Brand.fromJson(Map<String, dynamic> json)
      : brandid = json['brandid'],
        brandname = json['brandname'],
        logo = json['logo'],
        information = json['information'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['brandid'] = brandid;
    data['brandname'] = brandname;
    data['logo'] = logo;
    data['information'] = information;
    return data;
  }
}

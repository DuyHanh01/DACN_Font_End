class SizeTable {
  final int? stid;
  final int? shoeid;
  final int? s38;
  final int? s39;
  final int? s40;
  final int? s41;
  final int? s42;
  final int? s43;
  final int? s44;
  final int? s45;
  final int? s46;
  final int? s47;
  final int? s48;


  SizeTable.fromJson(Map<String, dynamic> json)
      : stid = json['stid'],
        shoeid = json['shoeid'],
        s38 = json['s38'],
        s39 = json['s39'],
        s40 = json['s40'],
        s41 = json['s41'],
        s42 = json['s42'],
        s43 = json['s43'],
        s44 = json['s44'],
        s45 = json['s45'],
        s46 = json['s46'],
        s47 = json['s47'],
        s48 = json['s48'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stid'] = stid;
    data['shoeid'] = shoeid;
    data['s38'] = s38;
    data['s39'] = s39;
    data['s40'] = s40;
    data['s41'] = s41;
    data['s42'] = s42;
    data['s43'] = s43;
    data['s44'] = s44;
    data['s45'] = s45;
    data['s46'] = s46;
    data['s47'] = s47;
    data['s48'] = s48;
    return data;
  }
}

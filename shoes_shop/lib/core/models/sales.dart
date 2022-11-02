class Sales {
  final int saleid;
  final String salename;
  final int createby;
  final int updateby;
  final String startday;
  final String endday;
  final String content;
  final double percent;
  final String imgsale;

  Sales(
      {required this.saleid,
      required this.salename,
      required this.createby,
      required this.updateby,
      required this.startday,
      required this.endday,
      required this.content,
      required this.percent,
      required this.imgsale});

  Sales.fromJson(Map<String, dynamic> json)
      : saleid = json['saleid'],
        salename = json['salename'],
        createby = json['createby'],
        updateby = json['updateby'],
        startday = json['startday'],
        endday = json['endday'],
        content = json['content'],
        percent = json['percent'],
        imgsale = json['imgsale'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['saleid'] = saleid;
    data['salename'] = salename;
    data['createby'] = createby;
    data['updateby'] = updateby;
    data['startday'] = startday;
    data['endday'] = endday;
    data['content'] = content;
    data['percent'] = percent;
    data['imgsale'] = imgsale;
    return data;
  }
}

class Sales {
  final int saleid;
  final String salename;
  final int createby;
  final int updateby;
  final String startday;
  final String endday;
  final String content;
  final double percent;

  Sales(
      {required this.saleid,
      required this.salename,
      required this.createby,
      required this.updateby,
      required this.startday,
      required this.endday,
      required this.content,
      required this.percent});

  Sales.fromJson(Map<String, dynamic> json)
      : saleid = json['saleid'],
        salename = json['salename'],
        createby = json['createby'],
        updateby = json['updateby'],
        startday = json['startday'],
        endday = json['endday'],
        content = json['content'],
        percent = json['percent'];

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
    return data;
  }

}

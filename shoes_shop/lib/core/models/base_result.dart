class BaseResult<T> {
  bool? isSuccess;
  int? status;
  String? Message;
  List<T?>? data;

  BaseResult(this.isSuccess, this.status, this.Message, this.data);

  BaseResult.fromJson(Map<String, dynamic> json)
      : isSuccess = json['isSuccess'],
        status = json['status'],
        Message = json['Message'],
        data = json['data'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dt = <String, dynamic>{};
    dt['isSuccess'] = isSuccess;
    dt['status'] = status;
    dt['Message'] = Message;
    dt['data'] = data;
    return dt;
  }
}

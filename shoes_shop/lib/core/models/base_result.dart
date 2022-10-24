class BaseResult<T> {
  bool? isSuccess;
  int? status;
  String? message;
  T? data;

  BaseResult(this.isSuccess, this.status, this.message, this.data);

  BaseResult.initial()
      : isSuccess = false,
        status = 0,
        message = "",
        data = null;

  BaseResult.fromJson(Map<String, dynamic> json)
      : isSuccess = json['isSuccess'],
        status = json['status'],
        message = json['message'],
        data = json['data'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dt = <String, dynamic>{};
    dt['isSuccess'] = isSuccess;
    dt['status'] = status;
    dt['message'] = message;
    dt['data'] = data;
    return dt;
  }
}
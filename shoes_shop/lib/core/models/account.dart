class Account {
  int? accountId;
  String username;
  String? password;
  int? roleId;
  bool? active;
  DateTime? createdate;
  Account(this.accountId, this.username, this.password, this.roleId);

  Account.initial()
      : accountId = 0,
        username = '',
        password = '',
        roleId = 0,
        active = false,
        createdate = DateTime.now();

  Account.fromJson(Map<String, dynamic> json)
      : accountId = json['accountid'],
        username = json['username'],
        password = json['password'],
        roleId = json['roleid'],
        active = json['active'];
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accountid'] = accountId;
    data['username'] = username;
    data['password'] = password;
    data['roleid'] = roleId;
    return data;
  }
}

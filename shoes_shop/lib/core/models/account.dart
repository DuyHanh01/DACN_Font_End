class Account {

  int accountid;
  String? username;
  String? Oldpassword;
  String? password;
  String? Repassword;
  int? roleid;
  bool? active;
  String? createdate;
  Account(this.accountid, this.username, this.Oldpassword, this.password, this.Repassword ,this.roleid);

  Account.initial()
      : accountid = 0,
        username = '',
        password = '',
        roleid = 0,
        active = false,
        createdate = DateTime.now().toString();

  Account.fromJson(Map<String, dynamic> json)
      : accountid = json['accountid'],
        roleid = json['roleid'],
        username = json['username'],
        Oldpassword = json['Oldpassword'],
        password = json['password'],
        Repassword = json['Repassword'],
        createdate = json['createdate'],
        active = json['active'];
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accountid'] = accountid;
    data['roleid'] = roleid;
    data['username'] = username;
    data['Oldpassword'] = Oldpassword;
    data['password'] = password;
    data['Repassword'] = Repassword;
    data['createdate'] = createdate;
    data['active'] = active;
    return data;
  }
}

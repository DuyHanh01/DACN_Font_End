class Register {
  int? accountid;
  String? username;
  String? password;
  String? Repassword;
  Register(this.accountid,this.username, this.password, this.Repassword);

  Register.initial()
      : accountid = 0,
        username = '',
        password = '',
        Repassword = '';

  Register.fromJson(Map<String, dynamic> json)
      : accountid = json['accountid'],
        username = json['username'],
        password = json['password'],
        Repassword = json['Repassword'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accountid'] = accountid;
    data['username'] = username;
    data['password'] = password;
    data['Repassword'] = Repassword;
    return data;
  }
}

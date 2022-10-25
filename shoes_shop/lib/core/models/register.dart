class Register {
  String username;
  String? password;
  String? Repassword;
  Register(this.username, this.password, this.Repassword);

  Register.initial()
      : username = '',
        password = '',
        Repassword = '';

  Register.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'],
        Repassword = json['Repassword'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['Repassword'] = Repassword;
    return data;
  }
}

class User {
  int? userid;
  int? accountid;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? address;
  String? avatar;

  User(this. userid, this.accountid, this.firstName, this.lastName, this.phone, this.email,
      this.address, this.avatar);

  User.initial()
      : userid = 0,
        accountid = 0,
        firstName = '',
        lastName = '',
        phone = '',
        email = '',
        address = ' ',
        avatar = ' ';

  User.fromJson(Map<String, dynamic> json)
      : userid = json['userid'],
        accountid = json['accountid'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        phone = json['phone'],
        email = json['email'],
        address = json['address'],
        avatar = json['avatar'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userid'] = userid;
    data['accountid'] = accountid;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phone'] = phone;
    data['email'] = email;
    data['address'] = address;
    data['avatar'] = avatar;
    return data;
  }
}

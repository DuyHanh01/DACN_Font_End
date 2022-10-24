class User {
  int id;
  String email;
  String password;
  String role;

  User(this.id, this.email, this.password, this.role);

  User.initial()
      : id = 0,
        email = '',
        password =  ' ',
        role =  ' ';

  User.fromJson(Map<String, dynamic> json) :
        id = json['id'],
        email = json['email'],
        password = json['password'],
        role = json['role'];


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['password'] = password;
    data['role'] = role;
    return data;
  }
}
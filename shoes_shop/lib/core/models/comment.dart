class Comment {
  int? cmtid;
  int accountid;
  int shoeid;
  String content;
  String? avatar;
  String? createdate;
  String? username;

  Comment(this.cmtid, this.accountid, this.shoeid, this.content, this.avatar,
      this.createdate, this.username);

  Comment.fromJson(Map<String, dynamic> json)
      : cmtid = json['cmtid'],
        accountid = json['accountid'],
        shoeid = json['shoeid'],
        content = json['content'],
        avatar = json['avatar'],
        createdate = json['createdate'],
        username = json['username'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cmtid'] = cmtid;
    data['accountid'] = accountid;
    data['shoeid'] = shoeid;
    data['content'] = content;
    data['avatar'] = avatar;
    data['createdate'] = createdate;
    data['username'] = username;
    return data;
  }
}

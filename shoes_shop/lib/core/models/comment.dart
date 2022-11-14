class Comment {
  int? cmtid;
  int accountid;
  int shoeid;
  String content;
  String? image;
  String? createdate;
  String? username;

  Comment(this.cmtid, this.accountid, this.shoeid, this.content, this.image,
      this.createdate, this.username);

  Comment.fromJson(Map<String, dynamic> json)
      : cmtid = json['cmtid'],
        accountid = json['accountid'],
        shoeid = json['shoeid'],
        content = json['content'],
        image = json['image'],
        createdate = json['createdate'],
        username = json['username'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cmtid'] = cmtid;
    data['accountid'] = accountid;
    data['shoeid'] = shoeid;
    data['content'] = content;
    data['image'] = image;
    data['createdate'] = createdate;
    data['username'] = username;
    return data;
  }
}

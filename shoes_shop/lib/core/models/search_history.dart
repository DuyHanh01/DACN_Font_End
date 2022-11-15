class SearchHistory {
  int? searchid;
  int accountid;
  String? keyword;

  SearchHistory(this.searchid, this.accountid, this.keyword);

  SearchHistory.fromJson(Map<String, dynamic> json)
      : searchid = json['searchid'],
        accountid = json['accountid'],
        keyword = json['keyword'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['searchid'] = searchid;
    data['accountid'] = accountid;
    data['keyword'] = keyword;
    return data;
  }

}
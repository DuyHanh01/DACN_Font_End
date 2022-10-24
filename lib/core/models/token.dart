class Token {
  String access_token;
  String token_type;
  int expires_in;
  Token(this.access_token, this.token_type, this.expires_in);
  Token.initial()
      : access_token = '',
        token_type = '',
        expires_in = 0;

  Token.fromJson(Map<String, dynamic> json)
      : access_token = json['access_token'],
        token_type = json['token_type'],
        expires_in = json['expires_in'];
}

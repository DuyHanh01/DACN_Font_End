class Token {
  String? access_token;
  String? token_type;
  int? expires_in;
  String? error_description;
  Token(this.access_token, this.token_type, this.expires_in,
      this.error_description);
  Token.initial()
      : access_token = '',
        token_type = '',
        expires_in = 0,
        error_description = '';

  Token.fromJson(Map<String, dynamic> json)
      : access_token = json['access_token'],
        token_type = json['token_type'],
        expires_in = json['expires_in'],
        error_description = json['error_description'];
}

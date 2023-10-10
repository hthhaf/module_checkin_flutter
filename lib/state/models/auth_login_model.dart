class AuthLoginModel {
  int id;
  String username;
  String token;
  AuthLoginModel({
    required this.id,
    required this.username,
    required this.token,
  });

  get message => null;

  static AuthLoginModel fromJson(Map<String, dynamic> json) {
    final auth = AuthLoginModel(
      id: json['id'] ?? -1,
      username: 'undefine',
      token: 'empty',
    );
    return auth;
    
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'token': token,
    };
  }
}

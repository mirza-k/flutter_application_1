class LoginRequest {
  String? username;
  String? password;

  LoginRequest({this.username, this.password});

  Map<String, dynamic> toJson(LoginRequest instance) => <String, dynamic>{
        'username': instance.username,
        'password': instance.password
      };
}

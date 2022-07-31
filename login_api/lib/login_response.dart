import 'dart:developer' as developer;

class LoginResponse {
  final String name;
  final String token;

  LoginResponse({
    required this.name,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    developer.log("LoginResponse, ${LoginResponse(
      name: json['name'],
      token: json['token'],
    )}");
    return LoginResponse(
      name: json['name'],
      token: json['token'],
    );
  }
}

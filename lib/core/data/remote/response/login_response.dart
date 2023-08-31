import 'package:transisi_apps/core/data/remote/api_constants.dart';

class LoginResponse {
  final String token;

  LoginResponse({
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json[ApiConstants.token],
    );
  }
}

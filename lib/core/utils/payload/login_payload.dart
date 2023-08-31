import 'package:transisi_apps/core/utils/constants.dart';

class LoginPayload {
  final String email;
  final String password;

  LoginPayload(this.email, this.password);

  Map<String, dynamic> toMap() {
    return {
      Constants.email: email,
      Constants.password: password,
    };
  }
}

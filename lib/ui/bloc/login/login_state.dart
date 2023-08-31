part of 'login_cubit.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginState extends Equatable {
  final LoginStatus status;
  final String? message;
  final Exception? exception;
  const LoginState({
    this.status = LoginStatus.initial,
    this.message,
    this.exception,
  });

  @override
  List<Object?> get props => [status, message, exception];

  LoginState copyWith({
    LoginStatus? status,
    String? message,
    Exception? exception,
  }) {
    return LoginState(
      status: status ?? this.status,
      message: message ?? this.message,
      exception: exception ?? this.exception,
    );
  }
}

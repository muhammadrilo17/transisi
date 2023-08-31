import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transisi_apps/core/domain/usecase/login_usecase.dart';
import 'package:transisi_apps/core/utils/payload/login_payload.dart';
import 'package:transisi_apps/core/utils/res/app_string.dart';
import 'package:transisi_apps/ui/pages.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _useCase;
  LoginCubit(this._useCase) : super(const LoginState());

  void login(String email, String password) async {
    emit(state.copyWith(status: LoginStatus.loading));

    if (email.isEmpty) {
      emit(
        state.copyWith(
            status: LoginStatus.failure, message: AppString.emailCannotEmpty),
      );
    } else if (password.isEmpty) {
      emit(
        state.copyWith(
          status: LoginStatus.failure,
          message: AppString.passwordCannotEmpty,
        ),
      );
    } else {
      LoginPayload loginPayload = LoginPayload(email, password);

      final response = await _useCase.login(loginPayload);
      if (response.data != null) {
        final result = response.data as bool;
        if (result) {
          emit(state.copyWith(status: LoginStatus.success));
        }
      } else {
        emit(
          state.copyWith(
            status: LoginStatus.failure,
            message: response.message,
          ),
        );
      }
    }
  }

  void moveToMainPage(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      Pages.home,
      (route) => false,
    );
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transisi_apps/core/domain/model/new_employee_model.dart';
import 'package:transisi_apps/core/domain/usecase/add_employee_usecase.dart';
import 'package:transisi_apps/core/utils/payload/new_employee_payload.dart';

part 'add_employee_state.dart';

class AddEmployeeCubit extends Cubit<AddEmployeeState> {
  final AddEmployeeUsecase _usecase;
  AddEmployeeCubit(this._usecase) : super(const AddEmployeeState());

  void addEmployee(String name, String job) async {
    emit(state.copyWith(status: AddEmployeeStatus.loading));
    NewEmployeePayload payload = NewEmployeePayload(name, job);

    final result = await _usecase.execute(payload);
    if (result.data != null) {
      emit(state.copyWith(
        status: AddEmployeeStatus.success,
        employees: result.data,
      ));
    } else {
      emit(state.copyWith(
        status: AddEmployeeStatus.failure,
        exception: Exception(result.message),
      ));
    }
  }

  void setFailed(String message) {
    emit(state.copyWith(status: AddEmployeeStatus.loading));
    emit(state.copyWith(
      status: AddEmployeeStatus.failure,
      exception: Exception(message),
    ));
  }

  void back() {
    close();
  }
}

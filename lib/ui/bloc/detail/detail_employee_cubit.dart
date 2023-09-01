import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transisi_apps/core/domain/model/employee_model.dart';
import 'package:transisi_apps/core/domain/usecase/get_detail_employee_usecase.dart';

part 'detail_employee_state.dart';

class DetailEmployeeCubit extends Cubit<DetailEmployeeState> {
  final GetDetailEmployeeUsecase _usecase;
  DetailEmployeeCubit(this._usecase) : super(const DetailEmployeeState());

  void init(int id) async {
    emit(state.copyWith(status: DetailEmployeeStatus.loading));
    final result = await _usecase.execute(id);

    if (result.data != null) {
      emit(
        state.copyWith(
          status: DetailEmployeeStatus.success,
          employees: result.data,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: DetailEmployeeStatus.failure,
          exception: Exception(result.message),
        ),
      );
    }
  }

  void back(BuildContext context) {
    emit(
      state.copyWith(
        status: DetailEmployeeStatus.initial,
        employees: null,
        exception: null,
      ),
    );

    Navigator.pop(context);
  }
}

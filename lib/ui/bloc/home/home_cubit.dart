import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transisi_apps/core/domain/model/employee_model.dart';
import 'package:transisi_apps/core/domain/usecase/get_employees_usecase.dart';
import 'package:transisi_apps/core/utils/res/app_string.dart';
import 'package:transisi_apps/ui/pages.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetEmployeesUsecase _usecase;
  HomeCubit(this._usecase) : super(const HomeState());

  void init() async {
    emit(state.copyWith(status: HomeStatus.loading));

    final result = await _usecase.execute(1);
    final value = result.data;

    if (value != null) {
      if (value.isEmpty) {
        emit(state.copyWith(
          status: HomeStatus.failure,
          exception: Exception(AppString.dataIsEmpty),
        ));
      } else {
        emit(state.copyWith(
          status: HomeStatus.success,
          employees: value,
        ));
      }
    } else {
      emit(state.copyWith(
        status: HomeStatus.failure,
        exception: Exception(result.message),
      ));
    }
  }

  void moveToAddEmployeePage(BuildContext context) {
    Navigator.pushNamed(context, Pages.addEmployee);
  }

  void moveToDetailEmployeePage(BuildContext context, int id) {
    Navigator.pushNamed(context, Pages.detailEmployee, arguments: id);
  }
}

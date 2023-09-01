import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
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
          employeesSearched: value,
        ));
      }
    } else {
      emit(state.copyWith(
        status: HomeStatus.failure,
        exception: Exception(result.message),
      ));
    }
  }

  void openSearch() {
    if (state.status == HomeStatus.onSearch) {
      search('');
    } else {
      emit(state.copyWith(status: HomeStatus.onSearch));
    }
  }

  void search(String keyword) {
    emit(state.copyWith(status: HomeStatus.loading));
    print('object ${state.employees?.length}');
    if (keyword.isEmpty) {
      emit(
        state.copyWith(
          status: HomeStatus.success,
          employeesSearched: state.employees,
        ),
      );
    } else if (state.employees?.isNotEmpty ?? false) {
      List<EmployeeModel> filteredEmployees = state.employees!
          .where(
            (employee) => employee.firstName
                .toLowerCase()
                .contains(keyword.toLowerCase()),
          )
          .toList();

      if (filteredEmployees.isEmpty) {
        emit(state.copyWith(
          status: HomeStatus.failure,
          exception: Exception(AppString.thereIsNoData),
        ));
      } else {
        emit(
          state.copyWith(
            status: HomeStatus.success,
            employeesSearched: filteredEmployees,
          ),
        );
      }
    } else {
      emit(state.copyWith(
        status: HomeStatus.failure,
        exception: Exception(AppString.thereIsNoData),
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

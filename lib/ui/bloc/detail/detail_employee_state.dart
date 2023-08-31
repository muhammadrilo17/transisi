part of 'detail_employee_cubit.dart';

enum DetailEmployeeStatus { initial, loading, success, failure }

class DetailEmployeeState extends Equatable {
  final DetailEmployeeStatus status;
  final EmployeeModel? employees;
  final Exception? exception;
  const DetailEmployeeState({
    this.status = DetailEmployeeStatus.initial,
    this.employees,
    this.exception,
  });

  @override
  List<Object?> get props => [status, employees, exception];

  DetailEmployeeState copyWith({
    DetailEmployeeStatus? status,
    EmployeeModel? employees,
    Exception? exception,
  }) {
    return DetailEmployeeState(
      status: status ?? this.status,
      employees: employees ?? this.employees,
      exception: exception ?? this.exception,
    );
  }
}

part of 'add_employee_cubit.dart';

enum AddEmployeeStatus { initial, loading, success, failure }

class AddEmployeeState extends Equatable {
  final AddEmployeeStatus status;
  final NewEmployeeModel? employees;
  final Exception? exception;
  const AddEmployeeState({
    this.status = AddEmployeeStatus.initial,
    this.employees,
    this.exception,
  });

  @override
  List<Object?> get props => [status, employees, exception];

  AddEmployeeState copyWith({
    AddEmployeeStatus? status,
    NewEmployeeModel? employees,
    Exception? exception,
  }) {
    return AddEmployeeState(
      status: status ?? this.status,
      employees: employees ?? this.employees,
      exception: exception ?? this.exception,
    );
  }
}

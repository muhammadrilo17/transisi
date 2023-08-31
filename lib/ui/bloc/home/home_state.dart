part of 'home_cubit.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  final HomeStatus status;
  final List<EmployeeModel>? employees;
  final Exception? exception;
  const HomeState({
    this.status = HomeStatus.initial,
    this.employees,
    this.exception,
  });

  @override
  List<Object?> get props => [status, employees, exception];

  HomeState copyWith({
    HomeStatus? status,
    List<EmployeeModel>? employees,
    Exception? exception,
  }) {
    return HomeState(
      status: status ?? this.status,
      employees: employees ?? this.employees,
      exception: exception ?? this.exception,
    );
  }
}

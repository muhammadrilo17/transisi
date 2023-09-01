part of 'home_cubit.dart';

enum HomeStatus { initial, loading, success, failure, onSearch }

class HomeState extends Equatable {
  final HomeStatus status;
  final List<EmployeeModel>? employees;
  final List<EmployeeModel>? employeesSearched;
  final String? searchKeyword;
  final Exception? exception;
  const HomeState({
    this.status = HomeStatus.initial,
    this.employees,
    this.employeesSearched,
    this.searchKeyword,
    this.exception,
  });

  @override
  List<Object?> get props => [status, employees, exception];

  HomeState copyWith({
    HomeStatus? status,
    List<EmployeeModel>? employees,
    List<EmployeeModel>? employeesSearched,
    String? searchKeyword,
    Exception? exception,
  }) {
    return HomeState(
      status: status ?? this.status,
      employees: employees ?? this.employees,
      employeesSearched: employeesSearched ?? this.employeesSearched,
      searchKeyword: searchKeyword ?? this.searchKeyword,
      exception: exception ?? this.exception,
    );
  }
}

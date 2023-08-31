import 'package:get_it/get_it.dart';
import 'package:transisi_apps/core/domain/usecase/add_employee_usecase.dart';
import 'package:transisi_apps/core/domain/usecase/get_detail_employee_usecase.dart';
import 'package:transisi_apps/core/domain/usecase/get_employees_usecase.dart';
import 'package:transisi_apps/core/domain/usecase/login_usecase.dart';

class UsecaseModule {
  final di = GetIt.instance;
  void init() {
    di.registerSingleton<LoginUseCase>(LoginUseCase(di.get()));
    di.registerSingleton<AddEmployeeUsecase>(AddEmployeeUsecase(di.get()));
    di.registerSingleton<GetDetailEmployeeUsecase>(
      GetDetailEmployeeUsecase(di.get()),
    );
    di.registerSingleton<GetEmployeesUsecase>(GetEmployeesUsecase(di.get()));
  }
}

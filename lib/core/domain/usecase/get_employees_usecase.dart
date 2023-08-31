import 'package:transisi_apps/core/data/resource.dart';
import 'package:transisi_apps/core/domain/model/employee_model.dart';
import 'package:transisi_apps/core/domain/repository/i_transisi_repository.dart';

class GetEmployeesUsecase {
  final ITransisiRepository _repository;

  GetEmployeesUsecase(this._repository);

  Future<Resource<List<EmployeeModel>>> execute(int page) async {
    return await _repository.getEmployees(page);
  }
}

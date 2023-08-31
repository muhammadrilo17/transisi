import 'package:transisi_apps/core/data/resource.dart';
import 'package:transisi_apps/core/domain/model/employee_model.dart';
import 'package:transisi_apps/core/domain/repository/i_transisi_repository.dart';

class GetDetailEmployeeUsecase {
  final ITransisiRepository _repository;

  GetDetailEmployeeUsecase(this._repository);

  Future<Resource<EmployeeModel>> execute(int id) async {
    return await _repository.detailEmployee(id);
  }
}

import 'package:transisi_apps/core/data/resource.dart';
import 'package:transisi_apps/core/domain/model/new_employee_model.dart';
import 'package:transisi_apps/core/domain/repository/i_transisi_repository.dart';
import 'package:transisi_apps/core/utils/payload/new_employee_payload.dart';

class AddEmployeeUsecase {
  final ITransisiRepository _repository;

  AddEmployeeUsecase(this._repository);

  Future<Resource<NewEmployeeModel>> execute(NewEmployeePayload payload) async {
    return await _repository.createEmployee(payload);
  }
}

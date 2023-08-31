import 'package:transisi_apps/core/data/resource.dart';
import 'package:transisi_apps/core/domain/model/employee_model.dart';
import 'package:transisi_apps/core/domain/model/new_employee_model.dart';
import 'package:transisi_apps/core/utils/payload/login_payload.dart';
import 'package:transisi_apps/core/utils/payload/new_employee_payload.dart';

abstract class ITransisiRepository {
  Future<Resource<bool>> login(LoginPayload payload);
  Future<Resource<List<EmployeeModel>>> getEmployees(int page);
  Future<Resource<EmployeeModel>> detailEmployee(int id);
  Future<Resource<NewEmployeeModel>> createEmployee(NewEmployeePayload payload);
}

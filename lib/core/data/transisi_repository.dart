import 'package:transisi_apps/core/data/remote/remote_data_source.dart';
import 'package:transisi_apps/core/data/remote/service/dio_service.dart';
import 'package:transisi_apps/core/data/resource.dart';
import 'package:transisi_apps/core/domain/model/employee_model.dart';
import 'package:transisi_apps/core/domain/model/new_employee_model.dart';
import 'package:transisi_apps/core/domain/repository/i_transisi_repository.dart';
import 'package:transisi_apps/core/utils/mapper/employee_mapper.dart';
import 'package:transisi_apps/core/utils/mapper/new_employee_mapper.dart';
import 'package:transisi_apps/core/utils/payload/login_payload.dart';
import 'package:transisi_apps/core/utils/payload/new_employee_payload.dart';

class TransisiRepository implements ITransisiRepository {
  late RemoteDataSource _remoteDataSource;

  TransisiRepository(DioService service) {
    _remoteDataSource = RemoteDataSource(service: service);
  }

  @override
  Future<Resource<bool>> login(LoginPayload payload) async {
    try {
      final result = await _remoteDataSource.login(payload);
      final value = result.data;

      if (value != null) {
        if (value.token != '') {
          return Resource.success(true);
        }
      }

      return Resource.error(result.message);
    } catch (e) {
      return Resource.error(e.toString());
    }
  }

  @override
  Future<Resource<NewEmployeeModel>> createEmployee(
    NewEmployeePayload payload,
  ) async {
    try {
      final result = await _remoteDataSource.createEmployee(payload);
      final value = result.data;

      if (value != null) {
        final data = NewEmployeeMapper.entityToDomain(value);
        return Resource.success(data);
      }
      return Resource.error(result.message);
    } catch (e) {
      return Resource.error(e.toString());
    }
  }

  @override
  Future<Resource<EmployeeModel>> detailEmployee(int id) async {
    try {
      final result = await _remoteDataSource.getDetailEmployee(id);
      final value = result.data;
      if (value != null) {
        final data = EmployeeMapper.entityToDomain(value);
        return Resource.success(data);
      }
      return Resource.error(result.message);
    } catch (e) {
      return Resource.error(e.toString());
    }
  }

  @override
  Future<Resource<List<EmployeeModel>>> getEmployees(int page) async {
    try {
      final result = await _remoteDataSource.getEmployees(page);
      final value = result.data;
      if (value != null) {
        final data = value
            .map(
              (e) => EmployeeMapper.entityToDomain(e),
            )
            .toList();
        return Resource.success(data);
      }
      return Resource.error(result.message);
    } catch (e) {
      return Resource.error(e.toString());
    }
  }
}

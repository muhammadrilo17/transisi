import 'package:dio/dio.dart';
import 'package:transisi_apps/core/data/remote/api_resource.dart';
import 'package:transisi_apps/core/data/remote/endpoints.dart';
import 'package:transisi_apps/core/data/remote/response/employee_response.dart';
import 'package:transisi_apps/core/data/remote/response/login_response.dart';
import 'package:transisi_apps/core/data/remote/response/new_employee_response.dart';
import 'package:transisi_apps/core/data/remote/service/dio_service.dart';
import 'package:transisi_apps/core/utils/mapper/employee_mapper.dart';
import 'package:transisi_apps/core/utils/mapper/new_employee_mapper.dart';
import 'package:transisi_apps/core/utils/payload/login_payload.dart';
import 'package:transisi_apps/core/utils/payload/new_employee_payload.dart';

class RemoteDataSource {
  final DioService service;

  RemoteDataSource({required this.service});

  Future<ApiResource<LoginResponse>> login(LoginPayload payload) async {
    try {
      final response = await service.post(
        Endpoints.login,
        payload.toMap(),
      );

      if (response.statusCode == 200) {
        final LoginResponse result = LoginResponse.fromJson(
          response.data,
        );

        final apiResource = ApiResource.success(result);
        return apiResource;
      }
      return ApiResource.error(response.data['error']);
    } on DioException catch (e) {
      return ApiResource.error(e.response?.data['error']);
    }
  }

  Future<ApiResource<List<EmployeeResponse>>> getEmployees(int page) async {
    try {
      Map<String, dynamic> queryParams = {
        "page": page,
      };

      final response = await service.getByParams(
        Endpoints.users,
        queryParams,
      );

      if (response.statusCode == 200) {
        final List<dynamic> dataList = response.data['data'] as List<dynamic>;

        final List<EmployeeResponse> result = dataList
            .map(
              (e) => EmployeeMapper.jsonToEntity(e),
            )
            .toList();

        final apiResource = ApiResource.success(result);
        return apiResource;
      }
      return ApiResource.error(response.data['error']);
    } on DioException catch (e) {
      return ApiResource.error(e.response?.data['error']);
    }
  }

  Future<ApiResource<EmployeeResponse>> getDetailEmployee(int id) async {
    try {
      final response = await service.getById(
        Endpoints.users,
        id,
      );

      print('RILOOOOO ${response.data}');

      if (response.statusCode == 200) {
        final EmployeeResponse result = EmployeeMapper.jsonToEntity(
          response.data['data'],
        );

        final apiResource = ApiResource.success(result);
        return apiResource;
      }
      return ApiResource.error(response.data['error']);
    } on DioException catch (e) {
      return ApiResource.error(e.response?.data['error']);
    }
  }

  Future<ApiResource<NewEmployeeResponse>> createEmployee(
    NewEmployeePayload payload,
  ) async {
    try {
      final response = await service.post(
        Endpoints.users,
        payload.toMap(),
      );

      if (response.statusCode == 200) {
        final NewEmployeeResponse result = NewEmployeeMapper.jsonToEntity(
          response.data['data'],
        );

        final apiResource = ApiResource.success(result);
        return apiResource;
      }
      return ApiResource.error(response.data['error']);
    } on DioException catch (e) {
      return ApiResource.error(e.response?.data['error']);
    }
  }
}

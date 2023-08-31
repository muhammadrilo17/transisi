import 'package:transisi_apps/core/data/remote/response/employee_response.dart';
import 'package:transisi_apps/core/domain/model/employee_model.dart';

class EmployeeMapper {
  static EmployeeResponse jsonToEntity(Map<String, dynamic> json) {
    return EmployeeResponse(
      id: json['id'],
      email: json['email'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      avatar: json['avatar'] ?? '',
    );
  }

  static EmployeeModel entityToDomain(EmployeeResponse entity) {
    return EmployeeModel(
      id: entity.id,
      email: entity.email,
      firstName: entity.firstName,
      lastName: entity.lastName,
      avatar: entity.avatar,
    );
  }
}

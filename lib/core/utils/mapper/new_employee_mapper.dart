import 'package:transisi_apps/core/data/remote/response/new_employee_response.dart';
import 'package:transisi_apps/core/domain/model/new_employee_model.dart';

class NewEmployeeMapper {
  static NewEmployeeResponse jsonToEntity(Map<String, dynamic> json) {
    return NewEmployeeResponse(
      name: json['name'],
      job: json['job'],
      id: json['id'],
      createdAt: json['createdAt'],
    );
  }

  static NewEmployeeModel entityToDomain(NewEmployeeResponse entity) {
    return NewEmployeeModel(
      name: entity.name,
      job: entity.job,
      id: entity.id,
      createdAt: entity.createdAt,
    );
  }
}

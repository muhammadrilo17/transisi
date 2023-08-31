import 'package:transisi_apps/core/utils/constants.dart';

class NewEmployeePayload {
  final String name;
  final String job;

  NewEmployeePayload(this.name, this.job);

  Map<String, dynamic> toMap() {
    return {
      Constants.name: name,
      Constants.job: job,
    };
  }
}

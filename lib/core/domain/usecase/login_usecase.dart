import 'package:transisi_apps/core/data/resource.dart';
import 'package:transisi_apps/core/domain/repository/i_transisi_repository.dart';
import 'package:transisi_apps/core/utils/payload/login_payload.dart';

class LoginUseCase {
  final ITransisiRepository _repository;

  LoginUseCase(this._repository);

  Future<Resource<bool>> login(LoginPayload payload) async {
    return await _repository.login(payload);
  }
}

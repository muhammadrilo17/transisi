import 'package:get_it/get_it.dart';
import 'package:transisi_apps/core/data/transisi_repository.dart';
import 'package:transisi_apps/core/domain/repository/i_transisi_repository.dart';

class RepositoryModule {
  final di = GetIt.instance;
  void init() {
    di.registerLazySingleton<ITransisiRepository>(
      () => TransisiRepository(di.get()),
    );
  }
}

import 'package:get_it/get_it.dart';
import 'package:transisi_apps/ui/bloc/add/add_employee_cubit.dart';
import 'package:transisi_apps/ui/bloc/detail/detail_employee_cubit.dart';
import 'package:transisi_apps/ui/bloc/home/home_cubit.dart';
import 'package:transisi_apps/ui/bloc/login/login_cubit.dart';

class CubitModule {
  final di = GetIt.instance;
  void init() {
    di.registerLazySingleton(() => LoginCubit(di.get()));
    di.registerLazySingleton(() => HomeCubit(di.get()));
    di.registerLazySingleton(() => DetailEmployeeCubit(di.get()));
    di.registerLazySingleton(() => AddEmployeeCubit(di.get()));
  }
}

import 'package:transisi_apps/core/di/cubit_module.dart';
import 'package:transisi_apps/core/di/network_module.dart';
import 'package:transisi_apps/core/di/repository_module.dart';
import 'package:transisi_apps/core/di/usecase_module.dart';

class AppComponent {
  static final AppComponent instance = AppComponent._();

  factory AppComponent() => instance;

  AppComponent._() {
    NetworkModule().init();
    RepositoryModule().init();
    UsecaseModule().init();
    CubitModule().init();
  }
}

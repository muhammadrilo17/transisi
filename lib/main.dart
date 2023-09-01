// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:transisi_apps/di/app_component.dart';
import 'package:transisi_apps/ui/bloc/add/add_employee_cubit.dart';
import 'package:transisi_apps/ui/bloc/detail/detail_employee_cubit.dart';
import 'package:transisi_apps/ui/bloc/home/home_cubit.dart';
import 'package:transisi_apps/ui/bloc/login/login_cubit.dart';
import 'package:transisi_apps/ui/pages/login_page.dart';
import 'package:transisi_apps/core/utils/router.dart' as CustomRouter;

void main() async {
  await dotenv.load(fileName: '.env');
  AppComponent();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CustomRouter.Router _router;
  MyApp({super.key}) : _router = CustomRouter.Router();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: true,
          create: (context) => GetIt.instance<LoginCubit>(),
        ),
        BlocProvider(
          lazy: true,
          create: (context) => GetIt.instance<HomeCubit>(),
        ),
        BlocProvider(
          lazy: true,
          create: (context) => GetIt.instance<DetailEmployeeCubit>(),
        ),
        BlocProvider(
          lazy: true,
          create: (context) => GetIt.instance<AddEmployeeCubit>(),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: _router.getRoute,
        navigatorObservers: [_router.routeObserver],
        home: LoginPage(),
      ),
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:transisi_apps/ui/pages.dart';
import 'package:transisi_apps/ui/pages/add_employee_page.dart';
import 'package:transisi_apps/ui/pages/detail_employee_page.dart';
import 'package:transisi_apps/ui/pages/home_page.dart';
import 'package:transisi_apps/ui/pages/login_page.dart';

class Router {
  late RouteObserver<PageRoute> routeObserver;

  Router() {
    routeObserver = RouteObserver<PageRoute>();
  }

  Route<dynamic>? getRoute(RouteSettings? settings) {
    switch (settings?.name) {
      case Pages.login:
        return _buildBackRoute(settings, LoginPage());

      case Pages.home:
        return _buildRoute(settings, HomePage());
      case Pages.addEmployee:
        return _buildRoute(settings, AddEmployeePage());
      case Pages.detailEmployee:
        final int id = settings?.arguments as int;
        return _buildRoute(settings, DetailEmployeePage(id: id));
    }
    return null;
  }

  PageRouteBuilder _buildRoute(RouteSettings? settings, Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: const Offset(0, 0),
              ).animate(animation),
              child: page,
            );
          },
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  PageRouteBuilder _buildBackRoute(RouteSettings? settings, Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0),
                end: const Offset(0, 0),
              ).animate(animation),
              child: page,
            );
          },
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}

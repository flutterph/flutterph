import 'package:flutter/material.dart';
import 'package:flutterph/pages/home/home.page.dart';
import 'package:flutterph/pages/jobs/jobs.page.dart';
import 'package:flutterph/pages/not_found/not_found.page.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
        break;
      case JobsPage.routeName:
        return MaterialPageRoute(
          builder: (_) => JobsPage(),
        );
        break;
      default:
        return MaterialPageRoute(
          builder: (_) => NotFoundPage(),
        );
    }
  }
}

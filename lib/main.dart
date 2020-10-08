import 'package:flutter/material.dart';
import 'package:flutterph/app/app_routes.dart';
import 'package:flutterph/pages/home/home.page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: HomePage.routeName,
      onGenerateRoute: (settings) => AppRoutes.generateRoute(settings),
    );
  }
}

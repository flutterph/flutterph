import 'package:flutter/material.dart';
import 'package:flutterph/app/app_navigator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final AppRouterDelegate _appRouterDelegate = AppRouterDelegate();
  final AppRouteInformationParser _appRouteInformationParser =
      AppRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Philippines',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerDelegate: _appRouterDelegate,
      routeInformationParser: _appRouteInformationParser,
    );
  }
}

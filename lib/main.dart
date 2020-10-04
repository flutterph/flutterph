import 'package:flutter/material.dart';
import 'package:flutterph/app/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Philippines',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Center(),
      onGenerateRoute: (settings) => AppRoutes.onGenerateRoute(settings),
    );
  }
}

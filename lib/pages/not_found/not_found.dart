import 'package:flutter/material.dart';

class NotFoundPage extends StatefulWidget {
  static const String routeName = "/NotFound";

  @override
  State<StatefulWidget> createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}

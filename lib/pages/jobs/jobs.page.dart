import 'package:flutter/material.dart';

class JobsPage extends StatefulWidget {
  static const String routeName = "/jobs";

  @override
  State<StatefulWidget> createState() {
    return _JobsPageState();
  }
}

class _JobsPageState extends State<JobsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Jobs"),
    );
  }
}

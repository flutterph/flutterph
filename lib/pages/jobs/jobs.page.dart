import 'package:flutter/material.dart';
import 'package:flutterph/pages/home/home.page.dart';

class JobsPage extends StatefulWidget {
  static const String routeName = "/jobs";

  @override
  State<StatefulWidget> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Jobs"),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  HomePage.routeName,
                );
              },
              child: Text("Go to Home"),
            ),
          ],
        ),
      ),
    );
  }
}

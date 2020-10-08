import 'package:flutter/material.dart';
import 'package:flutterph/models/job.model.dart';

class JobsPage extends StatelessWidget {
  final List<Job> jobs;
  final ValueChanged<Job> onTapped;

  JobsPage({
    @required this.jobs,
    @required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          for (var job in jobs)
            ListTile(
              title: Text(job.id.toString()),
              subtitle: Text(job.id.toString()),
              onTap: () => onTapped(job),
            )
        ],
      ),
    );
  }
}

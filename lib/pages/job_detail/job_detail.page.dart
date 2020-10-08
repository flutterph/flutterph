import 'package:flutter/material.dart';
import 'package:flutterph/models/job.model.dart';

class JobDetailsPage extends StatelessWidget {
  final Job job;

  JobDetailsPage({@required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (job != null) ...[
              Text(
                job.id.toString(),
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

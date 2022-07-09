import 'package:flutter/material.dart';

import '../../../../../app/resources/value_manger.dart';
import '../widgets/build_archive_tasks.dart';

class TasksArchiveView extends StatelessWidget {
  const TasksArchiveView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(AppSpacing.ap20),
      child: BuildArchiveTasks(),
    );
  }
}

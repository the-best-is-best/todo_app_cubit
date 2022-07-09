import 'package:flutter/material.dart';

import '../../../../../app/resources/value_manger.dart';
import '../widgets/build_done_tasks.dart';

class TasksDoneView extends StatelessWidget {
  const TasksDoneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(AppSpacing.ap20),
      child: BuildDoneTasks(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_app/app/resources/value_manger.dart';
import '../widgets/build_tasks.dart';

class TasksView extends StatelessWidget {
  const TasksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(AppSpacing.ap20),
      child: BuildTasks(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_app/presentation/main_screen/controller/main_screen_cubit.dart';
import '../../../../widgets/build_task.dart';

class BuildArchiveTasks extends StatelessWidget {
  const BuildArchiveTasks({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var tasks = MainScreenCubit.get(context).archiveTasks;

    return BuildTask(tasks: tasks, fromPage: 2);
  }
}

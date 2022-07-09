import 'package:flutter/material.dart';
import 'package:todo_app/presentation/main_screen/controller/main_screen_cubit.dart';
import '../../../../widgets/build_task.dart';

class BuildTasks extends StatelessWidget {
  const BuildTasks({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var tasks = MainScreenCubit.get(context).newTasks;

    return BuildTask(tasks: tasks, fromPage: 0);
  }
}

import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/resources/font_manager.dart';
import '../../app/resources/styles_manger.dart';
import '../../app/resources/value_manger.dart';
import '../../domain/models/task_model.dart';
import '../main_screen/controller/main_screen_cubit.dart';

class BuildTask extends StatelessWidget {
  const BuildTask({
    Key? key,
    required this.tasks,
    required this.fromPage,
  }) : super(key: key);

  final List<TaskModel> tasks;
  final int fromPage;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenCubit, MainScreenStates>(
        buildWhen: (prev, cur) => (cur is LoadingTaskIndexState ||
            cur is GetAllTaskIndexState ||
            cur is AddTaskIndexState ||
            cur is UpdateTaskIndexState ||
            cur is DeleteTaskIndexState),
        builder: (context, state) {
          return BuildCondition(
            condition: tasks.isNotEmpty,
            builder: (context) {
              return BuildCondition(
                condition: state is! LoadingTaskIndexState,
                builder: (context) {
                  return ListView.separated(
                    itemCount: tasks.length,
                    itemBuilder: (BuildContext context, int index) =>
                        Dismissible(
                      key: const Key('id'),
                      onDismissed: (_) {
                        MainScreenCubit.get(context)
                            .delete(tasks[index].id, fromPage);
                      },
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: AppSize.ap40,
                            child: FittedBox(
                              child: Text(
                                tasks[index].time,
                                textAlign: TextAlign.center,
                                style: getRegularStyle(fontSize: FontSize.s16)
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(width: AppSpacing.ap20),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tasks[index].title,
                                style: getRegularStyle(),
                              ),
                              const SizedBox(height: AppSize.ap8),
                              Text(
                                tasks[index].date,
                                style: getLightStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: fromPage == 1
                                  ? null
                                  : () {
                                      MainScreenCubit.get(context)
                                          .update(tasks[index].id, 1, fromPage);
                                    },
                              icon: Icon(
                                Icons.check_box,
                                size: FontSize.s24,
                                color: Colors.green,
                              )),
                          IconButton(
                              onPressed: fromPage == 2
                                  ? null
                                  : () {
                                      MainScreenCubit.get(context)
                                          .update(tasks[index].id, 2, fromPage);
                                    },
                              icon: Icon(
                                Icons.archive_rounded,
                                size: FontSize.s24,
                                color: Colors.black45,
                              )),
                        ],
                      ),
                    ),
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                      thickness: 1,
                      color: Colors.grey[300],
                    ),
                  );
                },
                fallback: (_) => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
            fallback: (_) => Center(
              child: Text(
                "No Tasks",
                style: getRegularStyle(),
              ),
            ),
          );
        });
  }
}

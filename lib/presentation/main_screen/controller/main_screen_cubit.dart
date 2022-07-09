import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/app/extensions/extension_build_context.dart';
import 'package:todo_app/domain/models/task_model.dart';
import '../../../app/di.dart';
import '../../../app/freezed/tasks_data_freezed.dart';
import '../pages/archive/view/archive_view.dart';
import '../pages/done/view/done_view.dart';
import '../pages/tasks/view/tasks_view.dart';
import '../view/widgets/build_add_task.dart';
part 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenStates> {
  MainScreenCubit() : super(MainScreenInitialState());

  static MainScreenCubit get(BuildContext context) => context.read();

  int indexButtonBar = 0;

  void getAllTasks() async {
    emit(LoadingTaskIndexState());
    List<Map> list = await di<Database>().rawQuery('SELECT * FROM tasks');
    for (var value in list) {
      if (value['status'] == 0) {
        newTasks.add(TaskModel(value['id'], value['title'], value['date'],
            value['time'], value['status']));
      }
      if (value['status'] == 1) {
        doneTasks.add(TaskModel(value['id'], value['title'], value['date'],
            value['time'], value['status']));
      }
      if (value['status'] == 2) {
        archiveTasks.add(TaskModel(value['id'], value['title'], value['date'],
            value['time'], value['status']));
      }
    }
    emit(GetAllTaskIndexState());
  }

  TasksObject tasksObject = TasksObject(0, "", "", "", 0);
  List<TaskModel> newTasks = [];
  List<TaskModel> doneTasks = [];
  List<TaskModel> archiveTasks = [];
  List<Widget> pages = [
    const TasksView(),
    const TasksDoneView(),
    const TasksArchiveView(),
  ];

  bool isBottomSheetOpened = false;

  void openBottomSheet(BuildContext context) {
    if (context.isBottomSheetOpened()) {
      context.closeBottomSheet();
      isBottomSheetOpened = false;
      emit(CloseBottomSheetState());
    } else {
      context.showBottomSheet(
        backgroundColor: Colors.white,
        elevation: 20,
        widget: const BuildAddTask(),
      );
      isBottomSheetOpened = true;
      emit(OpenBottomSheetState());
    }
  }

  void changeIndexBottomBar(int index) {
    indexButtonBar = index;
    emit(MainScreenBottomBarIndexState());
  }

  void addTaskName(String val) {
    tasksObject = tasksObject.copyWith(title: val);
  }

  void addTaskTime(String val) {
    tasksObject = tasksObject.copyWith(time: val);
  }

  void addTaskDate(String val) {
    tasksObject = tasksObject.copyWith(date: val);
  }

  void insert() async {
    emit(LoadingTaskIndexState());

    int id = await di<Database>().transaction((txn) async => await txn.rawInsert(
        'INSERT INTO tasks(title, date, time, status) VALUES("${tasksObject.title}", "${tasksObject.date}", "${tasksObject.time}",${tasksObject.status})'));
    newTasks.add(TaskModel(id, tasksObject.title, tasksObject.date,
        tasksObject.time, tasksObject.status));
    emit(AddTaskIndexState());
  }

  void update(int taskId, int updateTo, int fromPage) async {
    emit(LoadingTaskIndexState());

    await di<Database>().rawUpdate(
      'UPDATE tasks SET status = $updateTo WHERE id = $taskId',
    );
    if (updateTo == 1) {
      if (fromPage == 0) {
        doneTasks.add(newTasks.firstWhere((element) => element.id == taskId));
        newTasks.removeWhere((element) => element.id == taskId);
      } else if (fromPage == 2) {
        doneTasks
            .add(archiveTasks.firstWhere((element) => element.id == taskId));
        archiveTasks.removeWhere((element) => element.id == taskId);
      } else {
        return;
      }
    } else {
      if (fromPage == 0) {
        archiveTasks
            .add(newTasks.firstWhere((element) => element.id == taskId));
        newTasks.removeWhere((element) => element.id == taskId);
      } else if (fromPage == 1) {
        archiveTasks
            .add(doneTasks.firstWhere((element) => element.id == taskId));
        doneTasks.removeWhere((element) => element.id == taskId);
      } else {
        return;
      }
    }
    emit(UpdateTaskIndexState());
  }

  void delete(int taskId, int fromPage) async {
    emit(LoadingTaskIndexState());

    await di<Database>().rawUpdate('DELETE FROM  tasks WHERE id = $taskId');
    if (fromPage == 0) {
      newTasks.removeWhere((element) => element.id == taskId);
    } else if (fromPage == 1) {
      doneTasks.removeWhere((element) => element.id == taskId);
    } else {
      archiveTasks.removeWhere((element) => element.id == taskId);
    }
    emit(DeleteTaskIndexState());
  }
}

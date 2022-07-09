// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
part 'tasks_data_freezed.freezed.dart';

@freezed
class TasksObject with _$TasksObject {
  factory TasksObject(
    int id,
    String title,
    String date,
    String time,
    int status,
  ) = _TasksObject;
}

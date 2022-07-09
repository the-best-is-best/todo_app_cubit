import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../presentation/main_screen/controller/main_screen_cubit.dart';

extension ExtensionBuildContext on BuildContext {
  void back() {
    Navigator.pop(this);
  }

  double get width => MediaQuery.of(this).size.width;

  Future<String> showMyTimePicker() async {
    TimeOfDay? time = await showTimePicker(
      context: this,
      initialTime: TimeOfDay.now(),
    );
    return time?.format(this) ?? "";
  }

  Future<String> showMyDatePicker() async {
    DateTime dateNow = DateTime.now();
    DateTime? date = await showDatePicker(
        context: this,
        initialDate: dateNow,
        firstDate: dateNow,
        lastDate: DateTime.parse(
            DateTime(dateNow.year + 10, dateNow.month - 1, dateNow.day)
                .toIso8601String()));
    return DateFormat.yMMMd().format(date ?? dateNow);
  }

  static bool openedBottomSheet = false;
  void showBottomSheet({
    required Widget widget,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    bool? enableDrag,
    AnimationController? transitionAnimationController,
  }) {
    Scaffold.of(this).showBottomSheet((context) => widget,
        backgroundColor: backgroundColor,
        elevation: elevation,
        shape: shape,
        clipBehavior: clipBehavior,
        constraints: constraints,
        enableDrag: enableDrag,
        transitionAnimationController: transitionAnimationController);
    openedBottomSheet = true;
  }

  bool isBottomSheetOpened() {
    return openedBottomSheet;
  }

  void closeBottomSheet() {
    back();
    openedBottomSheet = false;
  }

  T getCubit<T>() {
    return BlocProvider.of(this);
  }
}

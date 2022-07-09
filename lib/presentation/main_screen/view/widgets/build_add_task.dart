import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app/extensions/extension_build_context.dart';
import 'package:todo_app/presentation/main_screen/controller/main_screen_cubit.dart';

import '../../../../app/resources/components/my_button.dart';
import '../../../../app/resources/components/my_form.dart';
import '../../../../app/resources/value_manger.dart';

class BuildAddTask extends StatefulWidget {
  const BuildAddTask({
    Key? key,
  }) : super(key: key);

  @override
  State<BuildAddTask> createState() => _BuildAddTaskState();
}

class _BuildAddTaskState extends State<BuildAddTask> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _taskTimeController = TextEditingController();
  final TextEditingController _taskDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.ap20),
      child: Form(
        key: _formKey,
        child: BlocBuilder<MainScreenCubit, MainScreenStates>(
            builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyForm(
                validator: "Task Name Can't be empty",
                hint: 'Task Title',
                type: TextInputType.text,
                prefixIcon: Icons.title,
                onSaved: (String? val) {
                  MainScreenCubit.get(context).addTaskName(val ?? "");
                },
              ),
              const SizedBox(height: AppSize.ap8),
              MyForm(
                controller: _taskTimeController,
                validator: "Task Time Can't be empty",
                hint: 'Task Time',
                type: TextInputType.none,
                prefixIcon: Icons.watch,
                onSaved: (String? val) {
                  MainScreenCubit.get(context).addTaskTime(val ?? "");
                },
                onTap: () async {
                  _taskTimeController.text = await context.showMyTimePicker();
                },
              ),
              const SizedBox(height: AppSize.ap8),
              MyForm(
                controller: _taskDateController,
                validator: "Task Date Can't be empty",
                hint: 'Task Date',
                type: TextInputType.none,
                prefixIcon: Icons.calendar_today,
                onTap: () async {
                  _taskDateController.text = await context.showMyDatePicker();
                },
                onSaved: (String? val) {
                  MainScreenCubit.get(context).addTaskDate(val ?? "");
                },
              ),
              const SizedBox(height: AppSize.ap8),
              MyButton(
                  text: 'Save',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      MainScreenCubit.get(context).insert();
                      context.closeBottomSheet();
                    }
                  }),
            ],
          );
        }),
      ),
    );
  }
}

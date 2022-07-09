import 'package:flutter/material.dart';
import 'package:todo_app/app/resources/font_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/di.dart';
import '../controller/main_screen_cubit.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainScreenCubit()..getAllTasks(),
      child: Scaffold(
        appBar: AppBar(
          leading: const SizedBox(),
          title: const Text("Todo App"),
        ),
        floatingActionButton: BlocBuilder<MainScreenCubit, MainScreenStates>(
            buildWhen: (pref, cur) =>
                (cur is OpenBottomSheetState || cur is CloseBottomSheetState),
            builder: (context, state) {
              return FloatingActionButton(
                onPressed: () {
                  MainScreenCubit.get(context).openBottomSheet(context);
                },
                child: Icon(
                  Icons.edit,
                  size: FontSize.s20,
                ),
              );
            }),
        bottomNavigationBar: BlocBuilder<MainScreenCubit, MainScreenStates>(
          buildWhen: (pref, cur) => (cur is MainScreenBottomBarIndexState),
          builder: (context, state) => BottomNavigationBar(
              currentIndex: MainScreenCubit.get(context).indexButtonBar,
              onTap: (index) =>
                  MainScreenCubit.get(context).changeIndexBottomBar(index),
              items: [
                BottomNavigationBarItem(
                  label: "Tasks",
                  icon: Icon(
                    Icons.menu,
                    size: FontSize.s30,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Done",
                  icon: Icon(
                    Icons.check_box,
                    size: FontSize.s30,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Archive",
                  icon: Icon(
                    Icons.archive,
                    size: FontSize.s30,
                  ),
                ),
              ]),
        ),
        body: BlocBuilder<MainScreenCubit, MainScreenStates>(
            buildWhen: (pref, cur) => (cur is MainScreenBottomBarIndexState),
            builder: (context, state) => MainScreenCubit.get(context)
                .pages[MainScreenCubit.get(context).indexButtonBar]),
      ),
    );
  }
}

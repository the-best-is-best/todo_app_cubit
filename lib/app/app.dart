import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/app/resources/font_manager.dart';

import '../presentation/main_screen/view/main_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo App',
        theme: getThemeData(),
        home: const MainScreen(),
      ),
    );
  }
}

ThemeData getThemeData() {
  return ThemeData(
    primarySwatch: Colors.teal,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        fontSize: FontSize.s20,
        fontWeight: FontWeightManager.medium,
      ),
    ),
  );
}

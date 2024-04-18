import 'package:diu_student/config/theme/Themes.dart';
import 'package:diu_student/core/widgets/bottom_navbar.dart';
import 'package:diu_student/features/routine/data/repository/student/slot_repo_implement.dart';
import 'package:diu_student/features/routine/presentation/pages/routine_main.dart';
import 'package:diu_student/features/routine/presentation/pages/student_routine.dart';
import 'package:diu_student/features/routine/presentation/state/student%20routine/student_routine_bloc.dart';
import 'package:diu_student/features/routine/presentation/state/student%20routine/student_routine_event.dart';
import 'package:diu_student/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/routine/data/repository/time_repository_implement.dart';


void main() async{
  initializeDependency();
  getStudentRoutineRemotely(batchSection: "41N").getRoutine();
  getTimesRemotely().getTime();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<StudentRoutineBloc>(
      create: (context) => sl()..add(getStudentRoutine()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: lightTheme,
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List Screens = [

    ];


    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.blue.shade50,
      body: RoutinePage(),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: const IconThemeData(color: Colors.white)
        ),
          child: const BottomNavbar()),
    );
  }
}


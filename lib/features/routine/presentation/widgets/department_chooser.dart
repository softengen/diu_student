import 'package:diu_student/features/routine/presentation/state/routine_bloc.dart';
import 'package:diu_student/features/routine/presentation/state/routine_event.dart';
import 'package:diu_student/features/routine/presentation/state/routine_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:popover/popover.dart';

import '../../../../core/resources/information_repository.dart';

class ChooseDepartment extends StatefulWidget {
  const ChooseDepartment({
    super.key,
  });

  @override
  State<ChooseDepartment> createState() => _ChooseDepartmentState();
}

class _ChooseDepartmentState extends State<ChooseDepartment> {
  Map departments = Information.departments;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return BlocBuilder(
      bloc: context.read<RoutineBloc>(),
      builder: (context, state) {
        switch (state.runtimeType) {
          case RoutineLoading:
            return Container(
              width: w * .45,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(11)),
                  color: Colors.teal.shade700),
              child: Lottie.asset("assets/lottie/Loading2.json",
                  height: w * .1, width: w * .1),
            );

          case RoutineSuccess:
            final successState = state as RoutineSuccess;
            return SizedBox(
              width: w * .45,
              child: ElevatedButton(
                  onPressed: () {
                    showPopover(
                        width: w * .9,
                        context: context,
                        bodyBuilder: (context) => ListView.builder(
                            shrinkWrap: true,
                            itemCount: departments.length,
                            itemBuilder: (context, index) {
                              String key = departments.keys.toList()[index];
                              return PopupMenuItem(
                                  value: departments[key][0],
                                  onTap: () async {
                                    context.read<RoutineBloc>().add(
                                        RoutineLoadingEvent(
                                            key.toString().toLowerCase()));
                                  },
                                  child: Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: h * .001),
                                      padding: EdgeInsets.symmetric(
                                          vertical: h * .005),
                                      color: Colors.teal.shade50,
                                      child: Center(
                                        child: Text(
                                          departments[key][0],
                                          style: TextStyle(
                                              color: Colors.teal.shade500,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )));
                            }),
                        direction: PopoverDirection.top);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(Colors.teal.shade700),
                    foregroundColor: const WidgetStatePropertyAll(Colors.white),
                    shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(11)))),
                  ),
                  child: Text(
                    successState.department,
                    style: TextStyle(fontSize: w * .04),
                  )),
            );

          default:
            return SizedBox(
              width: w * .45,
              child: ElevatedButton(
                  onPressed: () {
                    showPopover(
                        width: w * .9,
                        context: context,
                        bodyBuilder: (context) => ListView.builder(
                            shrinkWrap: true,
                            itemCount: departments.length,
                            itemBuilder: (context, index) {
                              String key = departments.keys.toList()[index];
                              return PopupMenuItem(
                                  value: departments[key][0],
                                  onTap: () async {
                                    context.read<RoutineBloc>().add(
                                        RoutineLoadingEvent(
                                            key.toString().toLowerCase()));
                                  },
                                  child: Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: h * .001),
                                      padding: EdgeInsets.symmetric(
                                          vertical: h * .005),
                                      color: Colors.teal.shade50,
                                      child: Center(
                                        child: Text(
                                          departments[key][0],
                                          style: TextStyle(
                                              color: Colors.teal.shade500,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )));
                            }),
                        direction: PopoverDirection.top);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(Colors.teal.shade700),
                    foregroundColor: const WidgetStatePropertyAll(Colors.white),
                    shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(11)))),
                  ),
                  child: Text(
                    "Department",
                    style: TextStyle(fontSize: w * .04),
                  )),
            );
        }
      },
    );
  }
}

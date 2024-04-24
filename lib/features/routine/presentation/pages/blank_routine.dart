
import 'package:diu_student/features/routine/domain/repository/information_repository.dart';
import 'package:diu_student/features/routine/domain/usecases/empty%20slot/empty_slot_usercase.dart';
import 'package:diu_student/features/routine/presentation/state/empty%20slots/empty_slots_bloc.dart';
import 'package:diu_student/features/routine/presentation/state/empty%20slots/empty_slots_event.dart';
import 'package:diu_student/features/routine/presentation/state/empty%20slots/empty_slots_state.dart';
import 'package:diu_student/features/routine/presentation/state/student%20routine/student_routine_bloc.dart';
import 'package:diu_student/features/routine/presentation/widgets/empty_slots_shower.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../injection_container.dart';

class EmptySlots extends StatefulWidget {
  const EmptySlots({super.key});

  @override
  State<EmptySlots> createState() => _EmptySlotsState();
}

class _EmptySlotsState extends State<EmptySlots> {


  // FutureBuilder EmptySlotBody(){
  //   return FutureBuilder(
  //       future: emptySlots,
  //       builder: (context,slots){
  //         if(slots.connectionState == ConnectionState.done) {
  //
  //           return EmptySlotShow(times: Times, slots: slots.data!);
  //         }
  //         else{
  //           return Center(child: CupertinoActivityIndicator());
  //         }
  //       });
  // }



  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;




    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: h*.05,width: w,),
            Hero(
                tag: "Empty Slots", child: Text(
              "Empty Slots",
              style: Theme.of(context).textTheme.displayLarge,
            )),
            SizedBox(height: h*.03,width: w,),

            EmptySlotShow(times: Times, slots: emptySlots),
          ],
        ),
      ),
    );
  }

  _buildBody(){
    return BlocProvider(
      create: (context) => sl.get<EmptySlotBloc>(),
      child: BlocBuilder<EmptySlotBloc,EmptySlotState>(
      builder: (_,state){
        if(state is EmptySlotLoading){
          return Center(child: CupertinoActivityIndicator());
        }
        if(state is EmptySlotDone)
        {
          print(state.slots);
          return Center(child: Text("Done"),);
        }
        return const SizedBox();
      }
      ),
    );
  }
}

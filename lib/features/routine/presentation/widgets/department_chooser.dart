import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:popover/popover.dart';

import '../../../../core/resources/information_repository.dart';

class ChooseDepartment extends StatefulWidget {
  final VoidCallback func;

  const ChooseDepartment({super.key, required this.func});

  @override
  State<ChooseDepartment> createState() => _ChooseDepartmentState();
}

class _ChooseDepartmentState extends State<ChooseDepartment> {
  String selected = "Department";
  Map departments = Information.departments;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    List<PopupMenuItem> options = [];

    departments.forEach((key, value) {
      options.add(PopupMenuItem(
          value: value[0],
          onTap: ()async{
            setState(() {
              _isLoading = true;
            });
            await value[1]();
            widget.func();
            setState(() {
              selected = key;
              _isLoading = false;
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: h*.001),
            padding: EdgeInsets.symmetric(vertical: h*.005),
              color: Colors.teal.shade50,
              child: Center(
                child: Text(
                  value[0],
                  style: TextStyle(color: Colors.teal.shade500, fontWeight: FontWeight.bold),
                ),
              ))
      ));
    });


    return _isLoading ?
        Container(
          width: w*.45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(11)),
            color: Colors.teal.shade700
          ),
          child: Lottie.asset("assets/lottie/Loading2.json",height: w*.1,width: w*.1),
        )
    : SizedBox(
      width: w*.45,
      child: ElevatedButton(
          onPressed: (){
        showPopover(
          width: w*.9,
            context: context,
            bodyBuilder: (context) => SingleChildScrollView(child: Center(child: Column(children: options,))),
          direction: PopoverDirection.bottom
        );
      },
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.teal.shade700),
            foregroundColor: WidgetStatePropertyAll(Colors.white),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(11)))),
          ),
          child: Text(selected, style: TextStyle(fontSize: w*.04),)
      ),
    );
  }
}

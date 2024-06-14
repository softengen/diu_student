import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../login/login.dart';
import '../widgets/customWidgets.dart';
import '../widgets/textStyle.dart';




class signupTeacher extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;
  final TextEditingController teacherInitialController;
  const signupTeacher({super.key, required this.emailController, required this.passwordController, required this.nameController, required this.teacherInitialController});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomForm(
        fields: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: "Name",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
            ),
          ),
          TextField(
            controller: teacherInitialController,
            decoration: InputDecoration(
              hintText: "Teacher Initial",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
            ),
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: "E.g: softenge@diu.edu.bd",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
            ),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              hintText: "Password",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
            ),
            obscureText: true,
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:local_storage/controller/user_controller.dart';
import 'package:local_storage/model/user_model.dart';
import 'package:local_storage/view/home_screen.dart';
import 'package:local_storage/widget/custom_text_field.dart';
import 'package:local_storage/widget/title_and_description_widget.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final emailContoller = TextEditingController();
  final passwordContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              // title & description
              const TitleAndDescriptioWidget(
                title: "Welcome Back",
                description:
                    "Please enter your email or username and password to sign in your accout.",
              ),
              const SizedBox(height: 120),
              // email or username
              CustomTextField(
                controller: emailContoller,
                hintText: "Email Or Username",
                icon: Icons.person,
              ),
              const SizedBox(height: 20),
              // password
              CustomTextField(
                controller: passwordContoller,
                hintText: "Password",
                icon: Icons.lock,
              ),
              const SizedBox(height: 60),
              // button
              MaterialButton(
                color: Colors.blue,
                minWidth: double.infinity,
                height: 50,
                onPressed: () async {
                  if (emailContoller.text.isNotEmpty &&
                      passwordContoller.text.isNotEmpty) {
                    if (await UserController().signIn(UserModel(
                        id: 0,
                        email: emailContoller.text,
                        password: passwordContoller.text))) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                          (route) => false);
                    }
                  } else {
                    log("message : enter all field");
                  }
                },
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

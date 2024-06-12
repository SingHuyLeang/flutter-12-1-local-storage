import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:local_storage/controller/user_controller.dart';
import 'package:local_storage/local_storage/shared_prefer.dart';
import 'package:local_storage/model/user_model.dart';
import 'package:local_storage/view/sign_in_screen.dart';
import 'package:local_storage/widget/custom_text_field.dart';
import 'package:local_storage/widget/title_and_description_widget.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

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
                title: "Hello Guys",
                description:
                    "Please enter your email or username and password to create your accout.",
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
                onPressed: () {
                  if (emailContoller.text.isNotEmpty &&
                      passwordContoller.text.isNotEmpty) {
                    UserController().signUp(UserModel(id: 0, email: emailContoller.text, password: passwordContoller.text));
                  } else {
                    log("message : enter all field");
                  }
                },
                child: Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account ? ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[800],
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(),
                        )),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:todo/config/firebase_auth_method.dart';
import 'package:todo/constant/constant.dart';
import 'package:todo/reusableWedget/reusable_button.dart';
import 'package:todo/reusableWedget/reusable_text.dart';
import 'package:todo/reusableWedget/reusable_textfield.dart';
import 'package:todo/routes/routes.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void loginUser() async {
    FirebaseAuthMethods(FirebaseAuth.instance).loginWithEmail(
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }

  void loginWithGoogle() async {
    FirebaseAuthMethods(FirebaseAuth.instance).signInWithGoogle(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ReusableText(
                      text: "Welcome to to-do list .",
                      fontWeight: FontWeight.w700,
                      color: csecondary.withOpacity(1),
                      fontSize: 28,
                      textAlign: TextAlign.start),
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  ReusableText(
                      text: "Create your free account.",
                      fontWeight: FontWeight.w300,
                      color: csecondary.withOpacity(1),
                      fontSize: 18,
                      textAlign: TextAlign.start),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      try {
                        Get.toNamed(RouterClass.getSignupRoute());
                      } catch (error) {
                        print(
                            error); // This will print any errors to the console
                      }
                    },
                    child: ReusableText(
                        text: "Sign up",
                        fontWeight: FontWeight.w300,
                        color: cprimary.withOpacity(1),
                        fontSize: 18,
                        textAlign: TextAlign.start),
                  )
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              ReusableTextField(
                  controller: emailController,
                  placeholder: "edigelan@gmail.com",
                  borderColor: cprimary.withOpacity(1),
                  borderRadius: 20),
              const SizedBox(
                height: 30,
              ),
              ReusableTextField(
                  controller: passwordController,
                  placeholder: "password",
                  borderColor: cprimary.withOpacity(1),
                  borderRadius: 20),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ReusableText(
                      text: "forgot password ?",
                      fontWeight: FontWeight.w500,
                      color: csecondary.withOpacity(1),
                      fontSize: 16,
                      textAlign: TextAlign.end),
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: ReusableButton(
                    backgroundColor: cprimary.withOpacity(1),
                    textColor: cbackgraound.withOpacity(1),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    text: "Login",
                    onPressed: () {
                      loginUser();
                    }),
              ),
              const SizedBox(
                height: 50,
              ),
              ReusableText(
                  text: "or continue with",
                  fontWeight: FontWeight.w600,
                  color: csecondary.withOpacity(1),
                  fontSize: 16,
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => loginWithGoogle(),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset("assets/image/google.png"),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset("assets/image/fb.png"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

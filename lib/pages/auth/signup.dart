import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/config/firebase_auth_method.dart';
import 'package:todo/constant/constant.dart';
import 'package:todo/reusableWedget/reusable_button.dart';
import 'package:todo/reusableWedget/reusable_text.dart';
import 'package:todo/reusableWedget/reusable_textfield.dart';
import 'package:todo/routes/routes.dart';
import 'package:fluttericon/mfg_labs_icons.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  void signUpUser() async {
    FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 70),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(MfgLabs.left_open))
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ReusableText(
                          text: "Create your free account.",
                          fontWeight: FontWeight.w700,
                          color: csecondary.withOpacity(1),
                          fontSize: 25,
                          textAlign: TextAlign.start),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    ReusableText(
                        text: "Aready have an account ?",
                        fontWeight: FontWeight.w300,
                        color: csecondary.withOpacity(1),
                        fontSize: 18,
                        textAlign: TextAlign.start),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouterClass.getLoginRoute());
                      },
                      child: ReusableText(
                          text: "Login",
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
                    controller: nameController,
                    placeholder: "Name",
                    borderColor: cprimary.withOpacity(1),
                    borderRadius: 20),
                const SizedBox(
                  height: 30,
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
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: ReusableButton(
                      backgroundColor: cprimary.withOpacity(1),
                      textColor: cbackgraound.withOpacity(1),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      text: "Sign up",
                      onPressed: () {
                        signUpUser();
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
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset("assets/image/google.png"),
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
      ),
    );
  }
}

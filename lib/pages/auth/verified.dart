import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/config/firebase_auth_method.dart';
import 'package:todo/constant/constant.dart';
import 'package:todo/reusableWedget/reusable_button.dart';
import 'package:todo/reusableWedget/reusable_text.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:todo/routes/routes.dart';

class Verified extends StatefulWidget {
  const Verified({super.key});

  @override
  State<Verified> createState() => _VerifiedState();
}

class _VerifiedState extends State<Verified> {
  @override
  void verifyUser() async {
    FirebaseAuthMethods(FirebaseAuth.instance).sendEmailVerification(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(MfgLabs.left_open)),
                ],
              ),
              ReusableText(
                  text: "Incoming email",
                  fontWeight: FontWeight.w500,
                  color: csecondary.withOpacity(1),
                  fontSize: 28,
                  textAlign: TextAlign.center),
              const Icon(
                Linecons.mail,
                size: 150,
                weight: 1,
              ),
              ReusableText(
                  text: "we just sent you an email to verify your account.",
                  fontWeight: FontWeight.normal,
                  color: csecondary.withOpacity(1),
                  fontSize: 18,
                  textAlign: TextAlign.center),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: ReusableButton(
                        backgroundColor: cprimary.withOpacity(1),
                        textColor: cbackgraound.withOpacity(1),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 10),
                        text: "check email",
                        onPressed: () {
                          verifyUser();
                        }),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouterClass.getLoginRoute());
                    },
                    child: ReusableText(
                        text: "Back to login",
                        fontWeight: FontWeight.w200,
                        color: cprimary.withOpacity(1),
                        fontSize: 14,
                        textAlign: TextAlign.center),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

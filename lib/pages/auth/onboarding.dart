import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/constant/constant.dart';
import 'package:todo/reusableWedget/reusable_button.dart';
import 'package:todo/reusableWedget/reusable_text.dart';
import 'package:todo/routes/routes.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cprimary.withOpacity(1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
                color: cprimary.withOpacity(1),
                child: const ReusableText(
                    text: "Manage your To-dos' ",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 48,
                    textAlign: TextAlign.start)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: ReusableButton(
                  backgroundColor: cbackgraound.withOpacity(1),
                  textColor: csecondary.withOpacity(1),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  text: "Get started",
                  onPressed: () {
                    Get.toNamed(RouterClass.getLoginRoute());
                  }),
            )
          ],
        ),
      ),
    );
  }
}

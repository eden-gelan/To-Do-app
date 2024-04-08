import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:todo/component/searchBar.dart';
import 'package:todo/component/tabBar.dart';
import 'package:todo/constant/constant.dart';
import 'package:todo/reusableWedget/reusable_text.dart';
import 'package:todo/routes/routes.dart';

class HomeComponent extends StatefulWidget {
  const HomeComponent({Key? key}) : super(key: key);

  @override
  State<HomeComponent> createState() => _HomeComponentState();
}

class _HomeComponentState extends State<HomeComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(RouterClass.getAddTaskRoute());
          },
          hoverElevation: 2,
          backgroundColor: cprimary.withOpacity(1),
          foregroundColor: Colors.white,
          child: const ReusableText(
              text: "+",
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 32)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Expanded(child: SearchBarWidget()),
                  const SizedBox(
                    width: 50,
                  ),
                  Row(
                    children: [
                      ReusableText(
                          text: "Date",
                          fontWeight: FontWeight.normal,
                          color: csecondary.withOpacity(1),
                          fontSize: 21),
                      const SizedBox(
                        width: 5,
                      ),
                      Icon(
                        FontAwesome5.arrow_down,
                        size: 20,
                        color: csecondary.withOpacity(0.9),
                        weight: 0.5,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomeTabBar(),
            ],
          ),
        ),
      ),
    );
  }
}

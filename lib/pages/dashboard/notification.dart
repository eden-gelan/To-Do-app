import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:todo/component/listView.dart';
import 'package:todo/constant/constant.dart';
import 'package:todo/reusableWedget/reusable_text.dart';

class Notification extends StatefulWidget {
  const Notification({super.key});

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AppBar(
            leading: GestureDetector(
                onTap: () => Get.back(),
                child: Icon(FontAwesome5.chevron_left)),
            actions: <Widget>[
              Icon(
                FontAwesome5.bell,
                color: cprimary.withOpacity(1),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                      text: "Due Today",
                      fontWeight: FontWeight.normal,
                      color: csecondary.withOpacity(1),
                      fontSize: 32),
                  Container(
                    width: 100,
                    height: 2,
                    color: csecondary.withOpacity(1),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: CustomeListView(
              status: "done",
            ))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo/constant/constant.dart';

import '../reusableWedget/reusable_text.dart';

class CustomeCalendar extends StatefulWidget {
  const CustomeCalendar({super.key});

  @override
  State<CustomeCalendar> createState() => _CustomeCalendarState();
}

class _CustomeCalendarState extends State<CustomeCalendar> {
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: AppBar(
            leading: GestureDetector(
                onTap: () => Get.back(),
                child: Icon(FontAwesome5.chevron_left)),
          ),
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Align(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReusableText(
                  text: "Calender view",
                  fontWeight: FontWeight.normal,
                  color: csecondary.withOpacity(1),
                  fontSize: 32),
              Container(width: 150, height: 2, color: Colors.black)
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TableCalendar(
            rowHeight: 40,
            headerStyle: HeaderStyle(formatButtonVisible: false),
            focusedDay: today,
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14)),
      ]),
    );
  }
}

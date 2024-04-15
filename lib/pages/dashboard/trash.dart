import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:todo/component/listView.dart';

class Trash extends StatefulWidget {
  const Trash({super.key});

  @override
  State<Trash> createState() => _TrashState();
}

class _TrashState extends State<Trash> {
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
            title: Text("Trash"),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: CustomeListView(status: "delete"),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo/component/listView.dart';
import 'package:todo/reusableWedget/reusable_text.dart';

class CustomeTabBar extends StatefulWidget {
  const CustomeTabBar({super.key});

  @override
  State<CustomeTabBar> createState() => _CustomeTabBarState();
}

class _CustomeTabBarState extends State<CustomeTabBar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Column(
      children: [
        Container(
          child: TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(
                text: "To DO",
              ),
              Tab(
                text: "Doing",
              ),
              Tab(
                text: "Done",
              )
            ],
          ),
        ),
        Container(
          width: double.maxFinite,
          height: 300,
          child: TabBarView(
            controller: _tabController,
            children: const [
              CustomeListView(status: "to-do"),
              CustomeListView(
                status: "doing",
              ),
              CustomeListView(
                status: "done",
              ),
            ],
          ),
        )
      ],
    );
  }
}

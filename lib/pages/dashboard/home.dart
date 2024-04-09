import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:fluttericon/web_symbols_icons.dart';
import 'package:get/get.dart';
import 'package:todo/bloc/Todo/to-do_bloc.dart';
import 'package:todo/bloc/Todo/to-do_state.dart';
import 'package:todo/component/home.dart';
import 'package:todo/constant/constant.dart';
import 'package:todo/reusableWedget/reusable_text.dart';
import 'package:todo/reusableWedget/snackBar.dart';
import 'package:todo/routes/routes.dart';
import '../../bloc/Todo/to-do_event.dart';
import '../../config/firebase_auth_method.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void userSignOut() async {
    FirebaseAuthMethods(FirebaseAuth.instance).signOut(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppBar(
              actions: <Widget>[
                IconButton(
                    onPressed: () => Get.toNamed(RouterClass.notification),
                    icon: Icon(FontAwesome5.bell))
              ],
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(color: cprimary.withOpacity(0.7)),
                  child: const Align(
                    alignment: Alignment.bottomLeft,
                    child: ReusableText(
                        text: "Eden Gelan",
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 32),
                  )),
              ListTile(
                onTap: () => Get.toNamed(RouterClass.calendar),
                leading: Icon(
                  Linecons.calendar,
                  size: 20,
                  color: csecondary.withOpacity(0.8),
                ),
                title: ReusableText(
                    text: "Calendar view",
                    fontWeight: FontWeight.w400,
                    color: csecondary.withOpacity(1),
                    fontSize: 21),
              ),
              ListTile(
                leading: Icon(
                  LineariconsFree.user_1,
                  size: 20,
                  color: csecondary.withOpacity(0.8),
                ),
                title: ReusableText(
                    text: "Profile",
                    fontWeight: FontWeight.w400,
                    color: csecondary.withOpacity(1),
                    fontSize: 21),
              ),
              ListTile(
                onTap: () => Get.toNamed(RouterClass.trash),
                leading: Icon(
                  Linecons.trash,
                  size: 20,
                  color: csecondary.withOpacity(0.8),
                ),
                title: ReusableText(
                    text: "Trash",
                    fontWeight: FontWeight.w400,
                    color: csecondary.withOpacity(1),
                    fontSize: 21),
              ),
              ListTile(
                onTap: () => userSignOut(),
                leading: Icon(
                  Entypo.logout,
                  size: 20,
                  color: csecondary.withOpacity(0.8),
                ),
                title: ReusableText(
                    text: "Log out",
                    fontWeight: FontWeight.w400,
                    color: csecondary.withOpacity(1),
                    fontSize: 21),
              ),
            ],
          ),
        ),
        body: BlocListener<ToDoBloc, ToDoState>(
            listener: (context, state) {},
            child: BlocBuilder<ToDoBloc, ToDoState>(
              builder: (context, state) {
                if (state is ToDoLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: csecondary.withOpacity(1),
                    ),
                  );
                } else if (state is ToDoOperationFailure) {
                  return const Center(
                    child: Text("error  "),
                  );
                }
                return HomeComponent();
              },
            )));
  }
}

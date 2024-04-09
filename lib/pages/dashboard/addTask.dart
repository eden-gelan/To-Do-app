import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:todo/bloc/Todo/to-do_bloc.dart';
import 'package:todo/bloc/Todo/to-do_state.dart';
import 'package:todo/component/addToDo.dart';
import 'package:todo/constant/constant.dart';
import 'package:todo/reusableWedget/snackBar.dart';
import 'package:todo/routes/routes.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  void _postToDo(context) {}

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  List<String> selectedTags = [];
  String selectedStatus = 'To-do';

  void _selectTag(String tag) {
    setState(() {
      if (selectedTags.contains(tag)) {
        selectedTags.remove(tag);
      } else {
        if (selectedTags.length < 2) {
          selectedTags.add(tag);
        } else {
          showSnackBar(context,
              text: "Only 2 tags can be selected.", textColor: Colors.red);
        }
      }
    });
  }

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
                IconButton(
                    onPressed: () => Get.toNamed(RouterClass.notification),
                    icon: Icon(FontAwesome5.bell))
              ],
            ),
          ),
        ),
        body: BlocListener<ToDoBloc, ToDoState>(listener: (context, state) {
          if (state is ToDoLoadSuccess) {
            showSnackBar(context,
                text: "To do added sucessfully", textColor: Colors.green);
            Navigator.of(context).pop();
          }
        }, child: BlocBuilder<ToDoBloc, ToDoState>(
          builder: (context, state) {
            if (state is ToDoLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: csecondary.withOpacity(1),
                ),
              );
            } else if (state is ToDoOperationFailure) {
              return const Center(
                child: Text("error"),
              );
            }
            return const AddToDo();
          },
        )));
  }
}

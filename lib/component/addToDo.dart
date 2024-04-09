import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:todo/bloc/Todo/to-do_bloc.dart';
import 'package:todo/bloc/Todo/to-do_event.dart';
import 'package:todo/constant/constant.dart';
import 'package:todo/reusableWedget/reusable_button.dart';
import 'package:todo/reusableWedget/reusable_text.dart';
import 'package:todo/reusableWedget/snackBar.dart';

class AddToDo extends StatefulWidget {
  const AddToDo({super.key});

  @override
  State<AddToDo> createState() => _AddToDoState();
}

class _AddToDoState extends State<AddToDo> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();

  List<String> selectedTags = [];
  String selectedStatus = 'todo';

  void _selectTag(String tag) {
    setState(() {
      if (selectedTags.contains(tag)) {
        selectedTags.remove(tag);
      } else {
        if (selectedTags.length < 2) {
          selectedTags.add(tag);
        } else {
          showSnackBar(context,
              text: "Only 2 tags can be selected.",
              icon: Iconic.block,
              textColor: Colors.red);
          print("Only 2 tags can be selected.");
        }
      }
    });
  }

  void _postToDo(BuildContext context) {
    if (_titleController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _dueDateController.text.isEmpty) {
      showSnackBar(context,
          text: "Please fill in all fields.",
          icon: Iconic.block,
          textColor: Colors.red);
      return;
    }
    BlocProvider.of<ToDoBloc>(context).add(
      AddToDoRequested(
        title: _titleController.text,
        description: _descriptionController.text,
        status: selectedStatus,
        tags: selectedTags,
        date: _dueDateController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String _dropdownValue = 'todo'; // Ensure casing matches the items
    var _items = ["todo", "Doing", "Done"];
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 80)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                    text: "Add task",
                    fontWeight: FontWeight.normal,
                    color: csecondary.withOpacity(1),
                    fontSize: 32),
                Container(width: 100, height: 2, color: Colors.black)
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ReusableText(
                text: "1. Title",
                fontWeight: FontWeight.w200,
                color: csecondary.withOpacity(1),
                fontSize: 20),
            TextField(
              controller: _titleController,
            ),
            const SizedBox(
              height: 20,
            ),
            ReusableText(
                text: "2. Description",
                fontWeight: FontWeight.w200,
                color: csecondary.withOpacity(1),
                fontSize: 20),
            TextField(
              controller: _descriptionController,
            ),
            const SizedBox(
              height: 20,
            ),
            ReusableText(
                text: "3. Due date",
                fontWeight: FontWeight.w200,
                color: csecondary.withOpacity(1),
                fontSize: 20),
            Row(
              children: [
                SizedBox(
                    height: 30,
                    width: 30,
                    child: Icon(
                      FontAwesome5.calendar_alt,
                      color: csecondary.withOpacity(0.7),
                    )),
                Expanded(
                    child: TextField(
                  controller: _dueDateController,
                )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ReusableText(
                text: "4. Status",
                fontWeight: FontWeight.w200,
                color: csecondary.withOpacity(1),
                fontSize: 20),
            Container(
              width: 150,
              height: 80,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: DropdownButton(
                key: Key('taskStatusDropdown'),
                items: _items
                    .map((String item) =>
                        DropdownMenuItem(value: item, child: Text(item)))
                    .toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedStatus = newValue ?? 'todo';
                  });
                },
                value: selectedStatus,
                borderRadius: BorderRadius.circular(10),
                icon: const Icon(
                  FontAwesome5.chevron_down,
                  size: 18,
                  color: Colors.black,
                ),
                style: const TextStyle(fontSize: 21, color: Colors.black),
                underline: Container(),
              ),
            ),
            ReusableText(
                text: "5 select only 2 tags",
                fontWeight: FontWeight.w200,
                color: csecondary.withOpacity(1),
                fontSize: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => _selectTag("sport"),
                    child: ReusableText(
                      text: "# sport",
                      fontWeight: selectedTags.contains("sport")
                          ? FontWeight.bold // Change color if selected
                          : FontWeight.w200,
                      color: selectedTags.contains("sport")
                          ? Colors.blue // Change color if selected
                          : csecondary.withOpacity(1),
                      fontSize: selectedTags.contains("sport")
                          ? 21 // Change color if selected
                          : 18,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () => _selectTag("work"),
                    child: ReusableText(
                      text: "# work",
                      fontWeight: selectedTags.contains("work")
                          ? FontWeight.bold // Change color if selected
                          : FontWeight.w200,
                      color: selectedTags.contains("work")
                          ? Colors.blue // Change color if selected
                          : csecondary.withOpacity(1),
                      fontSize: selectedTags.contains("work")
                          ? 21 // Change color if selected
                          : 18,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () => _selectTag("habit"),
                    child: ReusableText(
                      text: "# Habit",
                      fontWeight: selectedTags.contains("habit")
                          ? FontWeight.bold // Change color if selected
                          : FontWeight.w200,
                      color: selectedTags.contains("habit")
                          ? Colors.blue // Change color if selected
                          : csecondary.withOpacity(1),
                      fontSize: selectedTags.contains("habit")
                          ? 21 // Change color if selected
                          : 18,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => _selectTag("study"),
                    child: ReusableText(
                      text: "# study",
                      fontWeight: selectedTags.contains("study")
                          ? FontWeight.bold // Change color if selected
                          : FontWeight.w200,
                      color: selectedTags.contains("study")
                          ? Colors.blue // Change color if selected
                          : csecondary.withOpacity(1),
                      fontSize: selectedTags.contains("study")
                          ? 21 // Change color if selected
                          : 18,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () => _selectTag("Exercise"),
                    child: ReusableText(
                      text: "# Exercise",
                      fontWeight: selectedTags.contains("Exercise")
                          ? FontWeight.bold // Change color if selected
                          : FontWeight.w200,
                      color: selectedTags.contains("Exercise")
                          ? Colors.blue // Change color if selected
                          : csecondary.withOpacity(1),
                      fontSize: selectedTags.contains("Exercise")
                          ? 21 // Change color if selected
                          : 18,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () => _selectTag("Other"),
                    child: ReusableText(
                      text: "# Other",
                      fontWeight: selectedTags.contains("Other")
                          ? FontWeight.bold // Change color if selected
                          : FontWeight.w200,
                      color: selectedTags.contains("Other")
                          ? Colors.blue // Change color if selected
                          : csecondary.withOpacity(1),
                      fontSize: selectedTags.contains("Other")
                          ? 21 // Change color if selected
                          : 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: ReusableButton(
                  backgroundColor: cprimary.withOpacity(1),
                  textColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  text: "Save",
                  onPressed: () {
                    _postToDo(context);
                  }),
            )
          ],
        ),
      ),
    );
  }
}

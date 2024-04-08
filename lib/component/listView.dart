import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:todo/bloc/Todo/to-do_event.dart';
import 'package:todo/bloc/Todo/to-do_bloc.dart';
import 'package:todo/bloc/Todo/to-do_state.dart';
import 'package:todo/constant/constant.dart';
import 'package:todo/model/to-do.dart';
import 'package:todo/reusableWedget/reusable_text.dart';
import 'package:todo/reusableWedget/snackBar.dart';

class CustomeListView extends StatefulWidget {
  final String status;

  const CustomeListView({Key? key, required this.status}) : super(key: key);

  @override
  State<CustomeListView> createState() => _CustomeListViewState();
}

class _CustomeListViewState extends State<CustomeListView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ToDoBloc, ToDoState>(
      listener: (context, state) {
        if (state is ToDoDeleted) {
          showSnackBar(context, text: "deleted");
        }
      },
      builder: (context, state) {
        return BlocBuilder<ToDoBloc, ToDoState>(builder: (context, state) {
          if (state is ToDoLoaded) {
            List<Todo> data = state.myData
                .where((todo) => todo.status == widget.status)
                .toList();
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (_, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    ReusableText(
                                      text: data[index].title,
                                      fontWeight: FontWeight.w600,
                                      color: csecondary.withOpacity(1),
                                      fontSize: 21,
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                  "Confirm Permanent Delete"),
                                              content: Text(
                                                  "Are you sure you want to permanently delete this task?"),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: Text("No"),
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop(); // Close the dialog
                                                  },
                                                ),
                                                TextButton(
                                                  child: Text("Yes"),
                                                  onPressed: () {
                                                    // Dispatch an event to delete the item permanently
                                                    BlocProvider.of<ToDoBloc>(
                                                            context)
                                                        .add(
                                                      PermanentDeleteToDoRequested(
                                                        todoId:
                                                            data[index].id ??
                                                                UniqueKey()
                                                                    .toString(),
                                                      ),
                                                    );
                                                    Navigator.of(context)
                                                        .pop(); // Close the dialog
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                ReusableText(
                                  text: data[index].description,
                                  fontWeight: FontWeight.w200,
                                  color: csecondary.withOpacity(1),
                                  fontSize: 18,
                                ),
                                Row(
                                  children: [
                                    for (String tag in data[index].tags)
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: ReusableText(
                                          text: "#${tag}",
                                          fontWeight: FontWeight.w100,
                                          color: cprimary.withOpacity(1),
                                          fontSize: 14,
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                            IconButton(
                              icon: Icon(Octicons.kebab_vertical),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Select Status'),
                                    content: DropdownButtonFormField<String>(
                                      value: data[index]
                                          .status
                                          .toLowerCase(), // Initial value from the current status
                                      onChanged: (String? newValue) {
                                        if (newValue != null) {
                                          BlocProvider.of<ToDoBloc>(context)
                                              .add(
                                            UpdateToDoStatusRequested(
                                              todoId: data[index].id ??
                                                  UniqueKey().toString(),
                                              newStatus: newValue,
                                            ),
                                          );
                                          Navigator.of(context)
                                              .pop(); // Close the dialog
                                        }
                                      },
                                      items: [
                                        'To-Do',
                                        'Doing',
                                        'Done',
                                        'Delete'
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Divider(), // Add a line separator
                    ],
                  );
                });
          } else {
            return Container();
          }
        });
      },
    );
  }
}

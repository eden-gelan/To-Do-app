import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/Data%20provider/todo_provider.dart';
import 'package:todo/bloc/Todo/to-do_bloc.dart';
import 'package:todo/bloc/Todo/to-do_event.dart';
import 'package:todo/repo/to-do_repo.dart';
import 'package:todo/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late final ToDoRepository toDoRepository;

  MyApp() {
    final ToDoDataProvider dataProvider =
        ToDoDataProvider(); // Create an instance of ToDoDataProvider
    toDoRepository = ToDoRepository(
        dataProvider: dataProvider); // Pass dataProvider as an argument
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: toDoRepository,
      child: BlocProvider(
        create: (context) =>
            ToDoBloc(toDoRepository: toDoRepository)..add(ToDoload()),
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,
          ),
          initialRoute: RouterClass.onboading,
          getPages: RouterClass.routes,
        ),
      ),
    );
  }
}

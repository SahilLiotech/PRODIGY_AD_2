import "package:flutter/material.dart";
import "package:to_do_list/to_do_list.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:const ColorScheme.light().copyWith(
          primary: Colors.orange,
          secondary: Colors.orangeAccent,
          surface: Colors.orange.shade100,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: const ColorScheme.dark().copyWith(primary: Colors.black,secondary: Colors.grey,surface: Colors.blueGrey)
      ),
      home: const ToDoList(),
    );
  }
}

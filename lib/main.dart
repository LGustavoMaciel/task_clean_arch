import 'package:flutter/material.dart';
import 'package:task_clean_arch/app/presentation/pages/task_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF303151).withOpacity(0.2)),
        useMaterial3: true,
      ),
      home: TaskPage(),
    );
  }
}

import 'package:expense_tracker/screens/home/views/home_screen.dart';
import 'package:flutter/material.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expense Tracker",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
            background: Colors.grey.shade100,
            onBackground: Colors.black,
            primary: const Color(0xFF00B2B7),
            secondary: const Color(0xFFE064F7),
            tertiary: const Color(0xFFFF8D6C),
            outline: Colors.grey),
      ),
      home: const HomeScreen(),
    );
  }
}

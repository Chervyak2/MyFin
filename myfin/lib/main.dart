import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'new.dart';
import 'expenses.dart';
import 'incomes.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(
        onTabChange: (index) {
          // Здесь вы можете обработать изменение индекса
          if (kDebugMode) {
            print('Tab changed to index $index');
          }
        },
        screens: const [
          HomeScreen(),
          NewScreen(),
          ExpensesScreen(),
          IncomesScreen(),
        ],
      ),
    );
  }
}


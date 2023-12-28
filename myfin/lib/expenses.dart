import 'package:flutter/material.dart';
import 'date_widget.dart';
//TODO: Expenses views

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: DateWidget('assets/images/pdrb8.gif'),
    ));
  }
}

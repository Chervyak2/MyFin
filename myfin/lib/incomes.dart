import 'package:flutter/material.dart';
import 'package:myfin/date_widget.dart';
//TODO: Incomes views

class IncomesScreen extends StatelessWidget {
  const IncomesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: DateWidget('assets/images/pdrb4.gif'),
    ));
  }
}

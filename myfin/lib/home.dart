import 'package:flutter/material.dart';
import 'package:myfin/date_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: DateWidget('assets/images/pdrcq.gif'),
    ));
  }
}

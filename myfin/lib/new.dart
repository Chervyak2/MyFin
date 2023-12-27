import 'package:flutter/material.dart';
import 'package:myfin/date_widget.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: DateWidget('assets/images/pdrb4.gif'),
    ));
  }
}

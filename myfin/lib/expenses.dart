import 'package:flutter/material.dart';
import 'date_widget.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            DateWidget(),
            Center(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ExpansionCategoryTile(),
                          // Add other widgets as needed
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ExpansionTile ExpansionCategoryTile() {
    return ExpansionTile(
      title: Text("Category1"),
      backgroundColor: Colors.black,
      textColor: Colors.white, // Assuming whiteColor is defined
      childrenPadding: EdgeInsets.only(left: 20),
      leading: Icon(Icons.favorite_border),
      children: List.generate(
        3,
        (index) => Column(
          children: [
            ListTile(
              textColor: Colors.white,
              title: Text("Record1"),
              subtitle: Text("100.oo dollars"),
              onTap: () {
                print("tapped");
              },
            ),
          ],
        ),
      ),
    );
  }
}

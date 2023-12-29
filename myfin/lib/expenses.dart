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
            const DateWidget(),
            Center(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          expansionCategoryTile(),
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

  ExpansionTile expansionCategoryTile() {
    return ExpansionTile(
      title: const Text("Category1"),
      backgroundColor: Colors.black,
      textColor: Colors.white, // Assuming whiteColor is defined
      childrenPadding: const EdgeInsets.only(left: 20),
      leading: const Icon(Icons.favorite_border),
      children: List.generate(
        3,
        (index) => Column(
          children: [
            ListTile(
              textColor: Colors.white,
              title: const Text("Record1"),
              subtitle: const Text("100.oo dollars"),
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

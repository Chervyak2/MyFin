import 'package:flutter/material.dart';
import 'date_widget.dart';

class ExpensesScreen extends StatelessWidget {
  ExpensesScreen({super.key});
  double price = 0.0;
  double priceTotal = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: DateWidget(),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  expansionCategoryTile(
                      "Category1", "Description 1"), //Description from new.dart
                  expansionCategoryTile("NIGGERS", "Description 2"),
                  expansionCategoryTile("Category3", "Description 3"),
                  expansionCategoryTile("Category4", "Description 4"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ExpansionTile expansionCategoryTile(String categoryName, String recordName) {
    return ExpansionTile(
      title: Text('$categoryName:'),
      subtitle: Text('${countTotal(price).toStringAsFixed(2)}\$'),
      collapsedTextColor: Colors.white,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      childrenPadding: const EdgeInsets.only(left: 20),
      leading: const Icon(Icons.favorite_border),
      children: List.generate(
        3,
        (index) => Column(
          children: [
            recordListTile(recordName, price.toDouble()),
          ],
        ),
      ),
    );
  }

  ListTile recordListTile(String recordName, double price) {
    return ListTile(
      textColor: Colors.white,
      title: Text(recordName),
      subtitle: Text('$price\$'),
    );
  }

  double countTotal(double price) {
    priceTotal += price;
    return priceTotal;
  }
}

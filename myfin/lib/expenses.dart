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
                  expansionCategoryTile("Category1"),
                  expansionCategoryTile("NIGGERS"),
                  expansionCategoryTile("Category3"),
                  expansionCategoryTile("Category4"),
                  // Add other widgets as needed
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ExpansionTile expansionCategoryTile(String categoryName) {
    return ExpansionTile(
      title: Text('$categoryName:'),
      subtitle: Text('price total here'),
      collapsedTextColor: Colors.white,
      backgroundColor: Colors.black,
      textColor: Colors.white, // Assuming whiteColor is defined
      childrenPadding: const EdgeInsets.only(left: 20),
      leading: const Icon(Icons.favorite_border),
      children: List.generate(
        3,
        (index) => Column(
          children: [
            recordListTile('Records', price.toDouble()),
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
      onTap: () {
        print("tapped");
      },
      // onLongPress: () {
      //   showMenu(
      //     context: context,
      //     position: RelativeRect.fromLTRB(0, 0, 0, 0),
      //     items: [
      //       PopupMenuItem(
      //         child: Text('EDITING'),
      //         value: 1,
      //       ),
      //       PopupMenuItem(
      //         child: Text('DELETING'),
      //         value: 2,
      //       ),
      //     ],
      //     elevation: 8,
      //   ).then((value) {
      //     if (value == 1) {
      //       // Handle option 1
      //     } else if (value == 2) {
      //       // Handle option 2
      //     }
      //   });
      // },
    );
  }

  double countTotal(double price) {
    priceTotal += price;
    return priceTotal;
  }
}

import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(getMonthGif()),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 16,
              left: 16,
              child: buildDateInfo(),
            ),
            // Add other elements of your screen as needed
          ],
        ),
      ),
    );
  }

  Widget buildDateInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.calendar_today,
              color: Colors.white,
            ),
            const SizedBox(width: 8),
            Text(
              _getCurrentDate(),
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        // Add additional date-related information here if needed
      ],
    );
  }

  String _getCurrentDate() {
    DateTime now = DateTime.now();
    String monthName = _getMonthName(now.month);

    String daySuffix = _getDaySuffix(now.day);

    return '$monthName ${now.day}$daySuffix \n${now.year}';
  }

  String getMonthGif() {
    DateTime now = DateTime.now();
    if (now.month == 12 || now.month == 1 || now.month == 2) {
      return 'assets/images/WinterHome.gif';
    }
    if (now.month == 3 || now.month == 4 || now.month == 5) {
      return 'assets/images/Spring.gif';
    }
    if (now.month == 6 || now.month == 7 || now.month == 8) {
      return 'assets/images/Summer.gif';
    }
    if (now.month == 9 || now.month == 10 || now.month == 11) {
      return 'assets/images/Autumn.gif';
    }
    return 'Unknown';
  }

  String _getMonthName(int month) {
    const monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return monthNames[month - 1];
  }

  String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
}

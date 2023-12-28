import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  final String imagePath;

  const DateWidget(this.imagePath, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: _buildDateInfo(),
          ),
          // Add other elements of your screen as needed
        ],
      ),
    );
  }

  Widget _buildDateInfo() {
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

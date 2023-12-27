import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  final String imagePath;
  const DateWidget(this.imagePath, {super.key});

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
                image: AssetImage(imagePath), // Замените на свою картинку
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: Column(
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
              ],
            ),
          ),
          // Добавьте остальные элементы вашего экрана
        ],
      ),
    );
  }

  String _getCurrentDate() {
    DateTime now = DateTime.now();
    String monthName = now.month.toString();
    switch (monthName) {
      case '1':
        monthName = 'January';
        break;
      case '2':
        monthName = 'February';
        break;
      case '3':
        monthName = 'March';
        break;
      case '4':
        monthName = 'April';
        break;
      case '5':
        monthName = 'May';
        break;
      case '6':
        monthName = 'June';
        break;
      case '7':
        monthName = 'July';
        break;
      case '8':
        monthName = 'August';
        break;
      case '9':
        monthName = 'September';
        break;
      case '10':
        monthName = 'October';
        break;
      case '11':
        monthName = 'November';
        break;
      case '12':
        monthName = 'December';
        break;
    }
    if (now.day % 10 == 1) {
      String formattedDate = '$monthName ${now.day}st \n${now.year}';
      return formattedDate;
    }
    if (now.day % 10 == 2) {
      String formattedDate = '$monthName ${now.day}nd \n${now.year}';
      return formattedDate;
    }
    if (now.day % 10 == 3) {
      String formattedDate = '$monthName ${now.day}rd \n${now.year}';
      return formattedDate;
    }
    String formattedDate = '$monthName ${now.day}th  \n ${now.year}';
    return formattedDate;
  }
}

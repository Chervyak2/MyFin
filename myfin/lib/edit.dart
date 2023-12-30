import 'package:flutter/material.dart';
import 'package:myfin/date_widget.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final _firstInfoController1 = TextEditingController();
  final _firstInfoController2 = TextEditingController();
  final _firstInfoController3 = TextEditingController();
  final _firstInfoController4 = TextEditingController(); // Добавлено здесь

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(20, 20, 20, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/WinterHome.gif'), // Замените на свою картинку
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
                      Text(
                        _getCurrentMonthYear(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      Text(
                        _getCurrentDay(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50, // Изменено здесь
              color: Color.fromRGBO(20, 20, 20, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.0), // Отступ слева
                    child: Text('Name:',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 24)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40), // Добавлено здесь
            FirstInfo(
                _firstInfoController1,
                _firstInfoController2,
                _firstInfoController3,
                _firstInfoController4), // Добавлено здесь
            Container(
              height: 60,
              width: 220,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius:
                    BorderRadius.circular(12), // Задайте радиус скругления
              ),
              child: Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text('CREATE',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 28)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String _getCurrentMonthYear() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MMMM yyyy').format(now);
    return formattedDate;
  }

  String _getCurrentDay() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('d').format(now) + 'th';
    return formattedDate;
  }
}

class FirstInfo extends StatefulWidget {
  final TextEditingController controller1;
  final TextEditingController controller2;
  final TextEditingController controller3;
  final TextEditingController controller4;
  FirstInfo(
      this.controller1, this.controller2, this.controller3, this.controller4);

  @override
  _FirstInfoState createState() =>
      _FirstInfoState(controller1, controller2, controller3, controller4);
}

class _FirstInfoState extends State<FirstInfo> {
  final TextEditingController controller1;
  final TextEditingController controller2;
  final TextEditingController controller3;
  final TextEditingController controller4;
  bool switchValue = true;

  _FirstInfoState(
      this.controller1, this.controller2, this.controller3, this.controller4);

  @override
  Widget build(BuildContext context) {
    double thirdScreenHeight = MediaQuery.of(context).size.height / 3 + 60;

    return Container(
      height: thirdScreenHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildTextField('Shopping', 'Category', controller1),
          SizedBox(height: 10),
          _buildTextField('Food', 'Description', controller2),
          SizedBox(height: 10),
          _buildTextField('\$30.00', 'Amount', controller3),
          SizedBox(height: 10),
          _buildTextField('24.11.2023', 'Date', controller4),
          SizedBox(height: 10),
          _buildSwitch('Type'),
        ],
      ),
    );
  }

  Widget _buildTextField(
      String hint, String info, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.only(right: 10.0, left: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(info, style: TextStyle(color: Colors.white, fontSize: 18.0)),
          Container(
            width: 260.0,
            height: 45.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                keyboardType: info == 'Amount'
                    ? TextInputType.numberWithOptions(decimal: true)
                    : null, // Добавлено здесь
                inputFormatters: info == 'Amount'
                    ? <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))
                      ]
                    : null, // Добавлено здесь
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Color.fromARGB(255, 44, 44, 44),
                  contentPadding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                ),
                style: TextStyle(fontSize: 18.0, color: Colors.white),
                textAlignVertical: TextAlignVertical.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitch(String info) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0), // Добавлен отступ слева
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(info, style: TextStyle(color: Colors.white, fontSize: 18.0)),
          Transform.scale(
            scale: 1 / 1.8, // Уменьшение размера в 1.8 раза
            child: Switch(
              value: switchValue,
              onChanged: (value) {
                setState(() {
                  switchValue = value;
                });
              },
              activeColor:
                  const Color.fromARGB(255, 184, 118, 81), // Цвет ползунка
              activeTrackColor:
                  const Color.fromARGB(255, 26, 26, 26), // Цвет полосы
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 110.0), // Отступ справа
            child: Text(
              switchValue
                  ? 'Expense'
                  : 'Income', // Изменен текст в зависимости от состояния переключателя
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

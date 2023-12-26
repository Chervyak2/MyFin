import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:myfin/homepage.dart';
import 'package:flutter/foundation.dart';
import 'home.dart';
import 'new.dart';
import 'expenses.dart';
import 'incomes.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email, String password) {

    print('Entered Email: $email');
    print('Entered Password: $password');
    // Пример условий для проверки корректности ввода
    if (isValidEmail(email) && isValidPassword(password)) {
      // Корректный ввод - переход на домашнюю страницу
      Get.off(() => HomePage(
        onTabChange: (newIndex) => onTabChange(newIndex),
        screens: const [
          HomeScreen(),
          NewScreen(),
          ExpensesScreen(),
          IncomesScreen(),
        ],
      ));
    } else {
      // Некорректный ввод - показать сообщение об ошибке
      Get.snackbar("Ошибка", "Некорректный ввод логина или пароля");
    }
  }

  bool isValidEmail(String email) {
    bool isValid = email.contains('@') && email.contains('.');
    print('Email: $email, Validation result: $isValid');
    return isValid;
  }

  bool isValidPassword(String password) {
    bool result = password.length >= 6;
    print('Password: $password, Validation result: $result');
    return result;
  }

  void onTabChange(int newIndex) {
    if (kDebugMode) {
      print('Tab changed to index $newIndex');
    }
    // Обработка изменения индекса, если это необходимо
    // Например, можно сохранить индекс в переменной класса LoginController
    // currentIndex.value = newIndex;
  }
}
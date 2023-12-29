import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
User? currentUser = auth.currentUser;

//collections
const usersCollection = "users";
const expensesCategoriesCollection = 'expense_categories';
const incomesCategoriesCollection = 'income_categories';
const expensesCollection = 'expenses';
const incomesCollection = 'incomes';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

//UUID is a package that generates unique string IDs
//UUID.V4 is used to generate various unique ids.

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category { food, travel, liesure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.work: Icons.work,
  Category.liesure: Icons.movie
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.dateTime,
      required this.category})
      : id = uuid.v4();

  //Properties Describing a Single Expense
  final String id;
  final String title;
  final double amount;
  final DateTime dateTime;
  final Category category;

  String get formattedDate {
    return formatter.format(dateTime);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList(); //Alternative Constructor!
  //This Constructor filters out the expenses based on the category!!

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}

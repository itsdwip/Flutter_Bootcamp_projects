import 'package:expense_tracker/data/theme_colors.dart';
import 'package:expense_tracker/components/expense_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'WORK',
      amount: 100,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'BOOK',
      amount: 100,
      date: DateTime.now(),
      category: Category.education,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'EXPENSE TRACKER',
        ),
        backgroundColor: background2,
        foregroundColor: primary,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Text('Chart'),
            Expanded(child: ExpenseList(expenses: _registeredExpenses)),
          ],
        ),
      ),
    );
  }
}

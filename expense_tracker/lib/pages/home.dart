import 'package:expense_tracker/data/theme_colors.dart';
import 'package:expense_tracker/components/expense_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/pages/add_new_expense.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Expense> _registeredExpenses = [];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return NewExpense(
          onAddExpense: _addExpense,
        );
      },
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddExpenseOverlay,
        child: const Icon(Icons.add),
      ),
      backgroundColor: background,
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
            Expanded(child: ExpenseList(expenses: _registeredExpenses)),
          ],
        ),
      ),
    );
  }
}

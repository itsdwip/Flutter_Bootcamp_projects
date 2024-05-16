import "dart:io";

import "package:expense_tracker/core.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

class NewExpense extends StatefulWidget {
  const NewExpense({
    super.key,
    required this.onAddExpense,
  });

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _tittleController = TextEditingController();
  final _amountController = TextEditingController();
  Category _selectedCategory = Category.utilities;
  DateTime? _selectedDate;
  void _datePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(3000),
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _showDialog() {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Invalid Input'),
            content: const Text(
                'Please Make sure that You entered valid Title, Amount, Date '),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Okay'))
            ],
          );
        },
      );
    } else {
      (
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog.adaptive(
              title: const Text('Invalid Input'),
              content: const Text(
                  'Please Make sure that You entered valid Title, Amount, Date '),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Okay'))
              ],
            );
          },
        ),
      );
    }
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_tittleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      _showDialog();
      return;
    }
    widget.onAddExpense(
      Expense(
          title: _tittleController.text,
          amount: enteredAmount,
          date: _selectedDate!,
          category: _selectedCategory,
          categoryIcons: categoryIcons),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _tittleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              16,
              48,
              16,
              MediaQuery.of(context).viewInsets.bottom + 16,
            ),
            child: Column(
              children: [
                TextFieldBlueprint(
                  enteredTittle: _tittleController,
                  hintText: 'Title',
                  keyboardType: TextInputType.text,
                  prefixText: '',
                ),
                const Gap(10),
                TextFieldBlueprint(
                  enteredTittle: _amountController,
                  prefixText: '₹ ',
                  hintText: 'Amount',
                  keyboardType: const TextInputType.numberWithOptions(),
                ),
                const Gap(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: DropdownButton(
                          isDense: true,
                          borderRadius: BorderRadius.circular(30),
                          isExpanded: true,
                          menuMaxHeight: double.infinity,
                          value: _selectedCategory,
                          items: Category.values
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e.name.toUpperCase(),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (value == null) {
                              return;
                            }
                            setState(() {
                              _selectedCategory = value;
                            });
                          },
                        ),
                      ),
                      const Gap(5),
                      Text(
                        _selectedDate == null
                            ? 'No Date Selected'
                            : formattedIntlDate.format(_selectedDate!),
                      ),
                      IconButton(
                        onPressed: _datePicker,
                        icon: const Icon(Icons.calendar_month_outlined),
                      )
                    ],
                  ),
                ),
                if (width >= 600)
                  Row(
                    children: [
                      Expanded(
                        child: LongElevatedButton(
                          buttonTxt: 'save',
                          onTap: _submitExpenseData,
                        ),
                      ),
                      Expanded(
                        child: LongElevatedButton(
                          buttonTxt: 'cancel',
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  )
                else
                  Column(
                    children: [
                      LongElevatedButton(
                        buttonTxt: 'save',
                        onTap: _submitExpenseData,
                      ),
                      const Gap(10),
                      LongElevatedButton(
                        buttonTxt: 'cancel',
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

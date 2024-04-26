import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:expense_tracker/models/expense.dart';

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

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_tittleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog.adaptive(
            title: Text('Invalid Input'),
            content: Text(
                'Please Make sure that You entered valid Title, Amount, Date '),
          );
        },
      );
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
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextFieldStyle(
            enteredTittle: _tittleController,
            label: 'Title',
            keyboardStyle: TextInputType.text,
            prefixText: '',
          ),
          const Gap(10),
          Row(
            children: [
              Expanded(
                child: TextFieldStyle(
                  enteredTittle: _amountController,
                  label: 'Amount',
                  keyboardStyle: const TextInputType.numberWithOptions(),
                  prefixText: '₹',
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
              )
            ],
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 100,
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
              const Gap(30),
              ElevatedButton.icon(
                onPressed: _submitExpenseData,
                icon: const Icon(Icons.done_rounded),
                label: const Text('Save'),
              ),
              const Gap(10),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.cancel_outlined),
                label: const Text('cancel'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TextFieldStyle extends StatelessWidget {
  const TextFieldStyle({
    super.key,
    required TextEditingController enteredTittle,
    required this.label,
    required this.keyboardStyle,
    required this.prefixText,
  }) : _enteredTittle = enteredTittle;

  final TextEditingController _enteredTittle;
  final String label;
  final TextInputType keyboardStyle;
  final String prefixText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _enteredTittle,
      keyboardType: keyboardStyle,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        label: Text(label),
        prefixText: prefixText,
      ),
    );
  }
}

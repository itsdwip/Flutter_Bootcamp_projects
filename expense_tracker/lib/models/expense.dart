import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category {
  loan,
  utilities,
  insurance,
  taxes,
  education,
  food,
  gas,
  rent,
  fees,
  internet,
  transportation,
  fun,
  work,
  entertainment,
}

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}

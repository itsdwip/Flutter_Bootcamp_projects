import "package:expense_tracker/core.dart";

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return Dismissible(
          direction: DismissDirection.endToStart,
          key: ValueKey(
            expenses[index],
          ),
          background: Card(
            color: Theme.of(context).colorScheme.error,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.delete),
                ],
              ),
            ),
          ),
          onDismissed: (direction) => onRemoveExpense(
            expenses[index],
          ),
          child: ExpenseListItem(
            expenses[index],
          ),
        );
      },
    );
  }
}

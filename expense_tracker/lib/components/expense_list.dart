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
    final width = MediaQuery.of(context).size.width;
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return Dismissible(
          direction: width < 600
              ? DismissDirection.endToStart
              : DismissDirection.startToEnd,
          key: ValueKey(
            expenses[index],
          ),
          background: Card(
            color: Theme.of(context).colorScheme.error,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: width < 600
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: const [
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

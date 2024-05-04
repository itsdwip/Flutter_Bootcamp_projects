import 'package:expense_tracker/core.dart';

class TextFieldBlueprint extends StatelessWidget {
  const TextFieldBlueprint({
    super.key,
    required TextEditingController enteredTittle,
    required this.hintText,
    required this.keyboardType,
    required this.prefixText,
  }) : _enteredTittle = enteredTittle;

  final TextEditingController _enteredTittle;
  final String hintText;
  final TextInputType keyboardType;
  final String prefixText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: _enteredTittle,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blueGrey.shade300,
              ),
            ),
            filled: true,
            hintText: hintText,
            prefixText: prefixText),
      ),
    );
  }
}

import 'package:expense_tracker/core.dart';

class LongElevatedButton extends StatelessWidget {
  const LongElevatedButton({
    super.key,
    required this.onTap,
    required this.buttonTxt,
  });

  final void Function() onTap;
  final String buttonTxt;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          ),
          onPressed: onTap,
          child: Text(
            buttonTxt,
          ),
        ),
      ),
    );
  }
}

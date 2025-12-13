import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    super.key,
    required this.text,
    this.condensed = false,
    this.onPressed,
    this.darkMode = false,
  });
  final String text;
  final void Function()? onPressed;
  final bool condensed;
  final bool darkMode;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          border: Border.all(color: darkMode ? Colors.white : Colors.black, width: 1.5),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: darkMode ? Colors.white : Colors.black,
              fontSize: condensed ? 14 : 18,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

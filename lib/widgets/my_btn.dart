import 'package:flutter/material.dart';

class MyBtn extends StatelessWidget {
  const MyBtn({
    super.key, required this.color, required this.title, required this.OnPressed,
  });

  final Color color;
  final String title;
  final VoidCallback OnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Material(
        elevation: 5,
        color: color,
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(
          onPressed: OnPressed,
          minWidth: 100,
          height: 42,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          ),
      ),
    );
  }
}
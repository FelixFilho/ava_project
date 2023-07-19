import 'package:flutter/material.dart';

Widget Button(String text, VoidCallback onPressed) {
  return SizedBox(
    width: double.maxFinite,
    child: OutlinedButton(
      style: const ButtonStyle(
        side: MaterialStatePropertyAll(
          BorderSide(color: Colors.black),
        ),
        // fixedSize: MaterialStatePropertyAll(Size.fromWidth(200)),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.green),
      child: const Center(
        child: LoginFields(),
      ),
    );
  }
}

class LoginFields extends StatelessWidget {
  const LoginFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        loginButton('Login', () {}),
        loginButton('Cadastrar', () {}),
      ],
    );
  }

  Widget loginButton(String text, VoidCallback onPressed) {
    return OutlinedButton(
      style: const ButtonStyle(
        side: MaterialStatePropertyAll(
          BorderSide(color: Colors.white),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

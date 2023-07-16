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
        OutlinedButton(
          style: ButtonStyle(
            side: MaterialStatePropertyAll(
              BorderSide(color: Colors.white),
            ),
          ),
          onPressed: () {},
          child: Text(
            'Login',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}

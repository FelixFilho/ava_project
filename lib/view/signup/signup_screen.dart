import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../utils/services/sqlite_database.dart';
import '../components/button.dart';
import '../components/input_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: const Color(0xFFFFFDFD),
        child: Center(
          child: signupFields(),
        ),
      ),
    );
  }

  void registerUser(String name, String email, String password) async {
    final SQLiteService _sqlService = GetIt.instance.get();

    await _sqlService.insertUser(
      _nameController.text,
      _emailController.text,
      _passwordController.text,
    );
  }

  Widget signupFields() {
    return SizedBox(
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Text(
              'Sign Up',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const SizedBox(height: 120),
            InputField(labelText: 'Nome', controller: _nameController),
            const SizedBox(height: 16),
            InputField(labelText: 'E-mail', controller: _emailController),
            const SizedBox(height: 16),
            InputField(labelText: 'Senha', controller: _passwordController),
            const SizedBox(height: 16),
            InputField(
              labelText: 'Confirmar Senha',
              controller: _confirmPasswordController,
            ),
            const SizedBox(height: 40),
            Button('Sign Up', () => Navigator.pushNamed(context, '/address')),
          ],
        ),
      ),
    );
  }
}

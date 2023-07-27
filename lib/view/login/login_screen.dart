import 'package:ava_project/core/cubit/session_cubit/session_cubit.dart';
import 'package:ava_project/core/cubit/session_cubit/session_state.dart';
import 'package:ava_project/utils/services/sqlite_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../components/button.dart';
import '../components/input_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFFFFDFD),
        child: const Center(
          child: InputFields(),
        ),
      ),
    );
  }
}

class InputFields extends StatefulWidget {
  const InputFields({super.key});

  @override
  State<InputFields> createState() => InputFieldsState();
}

class InputFieldsState extends State<InputFields> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void login() async {
    final SQLiteService _sqlService = GetIt.instance.get();

    var response = await _sqlService.login(
      _emailController.text,
      _passwordController.text,
    );

    response.fold(
      (l) => ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(l))),
      (user) {
        context.read<SessionCubit>().signIn(user);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SessionCubit, SessionState>(
      listener: (context, state) {
        if (state is SessionStateLoggedIn) {
          Navigator.pushNamed(context, '/address');
        }

        if (state is SessionStateLoggedOut) {
          Navigator.popUntil(context, (route) => route.isFirst);
        }
      },
      child: SizedBox(
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Text(
                'Olá!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(
                'Logue na aplicação para continuar',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
              ),
              const SizedBox(height: 120),
              InputField(labelText: 'E-mail', controller: _emailController),
              const SizedBox(height: 16),
              InputField(labelText: 'Senha', controller: _passwordController),
              const SizedBox(height: 40),
              Button('Login', () {
                login();
              }),
              Button(
                  'Sign Up', () => Navigator.of(context).pushNamed('/signup')),
            ],
          ),
        ),
      ),
    );
  }
}

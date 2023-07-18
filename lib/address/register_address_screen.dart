import 'package:flutter/material.dart';

class RegisterAddressScreen extends StatefulWidget {
  const RegisterAddressScreen({super.key});

  @override
  State<RegisterAddressScreen> createState() => _RegisterAddressScreenState();
}

class _RegisterAddressScreenState extends State<RegisterAddressScreen> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Address Screen'),
      ),
      body: addressFields(),
    );
  }

  Widget addressFields() {
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
              'Olá!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              'Logue na aplicação para continuar',
              style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
            ),
            const SizedBox(height: 120),
            inputField('Nome', _controller),
            const SizedBox(height: 16),
            inputField('E-mail', _controller),
            const SizedBox(height: 16),
            inputField('Senha', _controller),
            const SizedBox(height: 16),
            inputField('Confirmar Senha', _controller),
            const SizedBox(height: 40),
            loginButton('Login', () {}),
          ],
        ),
      ),
    );
  }

  Widget inputField(String labelText, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(fontSize: 14, color: Colors.grey.shade600),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Colors.blueGrey.shade200),
        ),
        contentPadding: const EdgeInsets.all(8),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        // constraints: BoxConstraints(maxWidth: 200),
      ),
    );
  }

  Widget loginButton(String text, VoidCallback onPressed) {
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
}

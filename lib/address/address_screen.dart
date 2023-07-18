import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController _controller = TextEditingController();
  String result = '';

  _consultCep() async {
    String cep = _controller.text;
    String baseUrl = 'https://viacep.com.br/ws/${cep}/json/';
    final Uri uri = Uri.parse(baseUrl);

    http.Response response;

    response = await http.get(uri);

    Map<String, dynamic> viacepResponse = jsonDecode(response.body);

    String logradouro = viacepResponse['logradouro'];
    String bairro = viacepResponse['bairro'];
    String localidade = viacepResponse['localidade'];

    setState(() {
      result = '$logradouro $bairro $localidade';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
              ),
              Text('Result: $result'),
              ElevatedButton(onPressed: _consultCep, child: Text('Consult')),
            ],
          ),
        ),
      ),
    );
  }
}

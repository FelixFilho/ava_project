import 'dart:convert';

import 'package:ava_project/core/cubit/session_cubit/session_cubit.dart';
import 'package:ava_project/view/components/button.dart';
import 'package:ava_project/view/components/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    String baseUrl = 'https://viacep.com.br/ws/$cep/json/';
    final Uri uri = Uri.parse(baseUrl);

    http.Response response;

    response = await http.get(uri);

    Map<String, dynamic> viacepResponse = jsonDecode(response.body);

    String logradouro = viacepResponse['logradouro'];
    String complemento = viacepResponse['complemento'];
    String bairro = viacepResponse['bairro'];
    String localidade = viacepResponse['localidade'];
    String estado = viacepResponse['uf'];

    setState(() {
      result = '$logradouro $bairro $localidade $estado';
      _logradouroController.text = logradouro;
      _complementoController.text = complemento;
      _bairroController.text = bairro;
      _cidadeController.text = localidade;
      _estadoController.text = estado;
    });
  }

  final TextEditingController _logradouroController = TextEditingController();
  final TextEditingController _complementoController = TextEditingController();
  final TextEditingController _bairroController = TextEditingController();
  final TextEditingController _cidadeController = TextEditingController();
  final TextEditingController _estadoController = TextEditingController();

  @override
  void dispose() {
    _logradouroController.dispose();
    // _complementoController.dispose();
    _bairroController.dispose();
    _cidadeController.dispose();
    _estadoController.dispose();
    super.dispose();
  }

  //  CEP, Rua,  Complemento, Bairro, Localidade, Estado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address Screen'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                InputField(
                    labelText: 'Logradouro', controller: _logradouroController),
                const SizedBox(height: 16),
                InputField(
                    labelText: 'Complemento',
                    controller: _complementoController),
                const SizedBox(height: 16),
                InputField(labelText: 'Bairro', controller: _bairroController),
                const SizedBox(height: 16),
                InputField(labelText: 'Cidade', controller: _cidadeController),
                const SizedBox(height: 16),
                InputField(labelText: 'Estado', controller: _estadoController),
                const SizedBox(height: 16),
                Text('Result: $result'),
                Button('Consult', _consultCep),
                Button('Register Address',
                    () => Navigator.pushNamed(context, '/register-address')),
                Button(
                  'Log Out',
                  () => context.read<SessionCubit>().signOut(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

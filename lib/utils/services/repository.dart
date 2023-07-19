// import 'package:ava_project/services/viacep.dart';
// import 'package:http/http.dart' as http;

// class ViaCepService {
//   static Future<Viacep> fetchCep({required String cep}) async {
//     final response = await http.get('https://viacep.com.br/ws/$cep/json/');
//     if (response.statusCode == 200) {
//       return Viacep.fromJson(response.body);
//     } else {
//       throw Exception('Requisição inválida!');
//     }
//   }
// }



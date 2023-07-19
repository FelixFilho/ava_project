// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Address {
  String? id;
  String? cep;
  String? logradouro;
  String? complemento;
  String? bairro;
  String? localidade;
  String? uf;

  Address({
    required this.id,
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
  });

  Address copyWith({
    String? id,
    String? cep,
    String? logradouro,
    String? complemento,
    String? bairro,
    String? localidade,
    String? uf,
  }) {
    return Address(
      id: id ?? this.id,
      cep: cep ?? this.cep,
      logradouro: logradouro ?? this.logradouro,
      complemento: complemento ?? this.complemento,
      bairro: bairro ?? this.bairro,
      localidade: localidade ?? this.localidade,
      uf: uf ?? this.uf,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      id: map['id'] != null ? map['id'] as String : null,
      cep: map['cep'] != null ? map['cep'] as String : null,
      logradouro:
          map['logradouro'] != null ? map['logradouro'] as String : null,
      complemento:
          map['complemento'] != null ? map['complemento'] as String : null,
      bairro: map['bairro'] != null ? map['bairro'] as String : null,
      localidade:
          map['localidade'] != null ? map['localidade'] as String : null,
      uf: map['uf'] != null ? map['uf'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Address(id: $id, cep: $cep, logradouro: $logradouro, complemento: $complemento, bairro: $bairro, localidade: $localidade, uf: $uf)';
  }

  @override
  bool operator ==(covariant Address other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.cep == cep &&
        other.logradouro == logradouro &&
        other.complemento == complemento &&
        other.bairro == bairro &&
        other.localidade == localidade &&
        other.uf == uf;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        cep.hashCode ^
        logradouro.hashCode ^
        complemento.hashCode ^
        bairro.hashCode ^
        localidade.hashCode ^
        uf.hashCode;
  }
}

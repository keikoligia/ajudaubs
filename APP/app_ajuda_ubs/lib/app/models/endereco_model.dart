// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Endereco {
  late String idEndereco;
  late String cep;
  late String rua;
  late String numero;
  late String complemento;

  late String bairro;
  late String municipio;
  late String estado;

  Endereco.constructor1();

  Endereco({
    required this.idEndereco,
    required this.cep,
    required this.rua,
    required this.numero,
    required this.bairro,
    required this.complemento,
    required this.municipio,
    required this.estado,
  });

  factory Endereco.fromMap(Map<String, dynamic> map) {
    return Endereco(
      idEndereco: map['idEndereco'] as String,
      cep: map['cep'] as String,
      rua: map['rua'] as String,
      numero: map['numero'] as String,
      bairro: map['bairro'] as String,
      municipio: map['municipio'] as String,
      complemento: map['complemento'] as String,
      estado: map['estado'] as String,
    );
  }

  factory Endereco.fromJson(String source) =>
      Endereco.fromMap(json.decode(source) as Map<String, dynamic>);

  static Endereco end = Endereco(
      idEndereco: "222345678912345",
      cep: '13088652',
      rua: 'Rua Amadeu Gardini',
      numero: '249',
      bairro: 'Jardim Santana',
      complemento: 'complemento',
      municipio: 'Campinas',
      estado: 'SP');

  Map<String, dynamic> toMap() {

    return {
      'idEndereco': end.idEndereco,
      'cep': end.cep,
      'rua': end.rua,
      'numero': end.numero,
      'bairro': end.bairro,
      'municipio': end.municipio,
      'complemento': end.complemento,
      'estado': end.estado,
    };

    /*
    {
      "idEndereco":"412345678912345",
      "cep":"13088652",
      "rua":"Rua Amadeu Gardini",
      "numero":249,
      "bairro":"Jardim Santana",
      "municipio":"Campinas",
      "complemento":"",
      "estado":"SP"}
     */
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Endereco(idEndereco: $idEndereco, cep: $cep, rua: $rua, numero: $numero, bairro: $bairro, municipio: $municipio, estado: $estado)';
  }

  Endereco copyWith({
    String? idEndereco,
    String? cep,
    String? rua,
    String? numero,
    String? bairro,
    String? complemento,
    String? municipio,
    String? estado,
  }) {
    return Endereco(
      idEndereco: idEndereco ?? this.idEndereco,
      cep: cep ?? this.cep,
      rua: rua ?? this.rua,
      numero: numero ?? this.numero,
      bairro: bairro ?? this.bairro,
      municipio: municipio ?? this.municipio,
      complemento: complemento ?? this.complemento,
      estado: estado ?? this.estado,
    );
  }

  @override
  bool operator ==(covariant Endereco other) {
    if (identical(this, other)) return true;

    return other.idEndereco == idEndereco &&
        other.cep == cep &&
        other.rua == rua &&
        other.numero == numero &&
        other.bairro == bairro &&
        other.municipio == municipio &&
        other.complemento == complemento &&
        other.estado == estado;
  }

  @override
  int get hashCode {
    return idEndereco.hashCode ^
        cep.hashCode ^
        rua.hashCode ^
        numero.hashCode ^
        bairro.hashCode ^
        municipio.hashCode ^
        complemento.hashCode ^
        estado.hashCode;
  }
}

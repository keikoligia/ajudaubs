// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Endereco {
  late int idEndereco;
  late String cep;
  late String rua;
  late int numero;
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
    required this.municipio,
    required this.estado,
  });
  //late String complemento;

  factory Endereco.fromMap(Map<String, dynamic> map) {
    return Endereco(
      idEndereco: map['idEndereco'] as int,
      cep: map['cep'] as String,
      rua: map['rua'] as String,
      numero: map['numero'] as int,
      bairro: map['bairro'] as String,
      municipio: map['municipio'] as String,
      estado: map['estado'] as String,
    );
  }

  factory Endereco.fromJson(String source) =>
      Endereco.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idEndereco': idEndereco,
      'cep': cep,
      'rua': rua,
      'numero': numero,
      'bairro': bairro,
      'municipio': municipio,
      'estado': estado,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Endereco(idEndereco: $idEndereco, cep: $cep, rua: $rua, numero: $numero, bairro: $bairro, municipio: $municipio, estado: $estado)';
  }

  Endereco copyWith({
    int? idEndereco,
    String? cep,
    String? rua,
    int? numero,
    String? bairro,
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
        estado.hashCode;
  }
}

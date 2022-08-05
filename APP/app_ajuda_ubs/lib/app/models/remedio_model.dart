// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Remedio {
  final int idRemedio;
  final String nomeTecnico;
  final String nomeComercial;
  final String descricao;
  Remedio({
    required this.idRemedio,
    required this.nomeTecnico,
    required this.nomeComercial,
    required this.descricao,
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idRemedio': idRemedio,
      'nomeTecnico': nomeTecnico,
      'nomeComercial': nomeComercial,
      'descricao': descricao,
    };
  }

  @override
  String toString() {
    return 'Remedio(idRemedio: $idRemedio, nomeTecnico: $nomeTecnico, nomeComercial: $nomeComercial, descricao: $descricao)';
  }

  @override
  bool operator ==(covariant Remedio other) {
    if (identical(this, other)) return true;

    return other.idRemedio == idRemedio &&
        other.nomeTecnico == nomeTecnico &&
        other.nomeComercial == nomeComercial &&
        other.descricao == descricao;
  }

  @override
  int get hashCode {
    return idRemedio.hashCode ^
        nomeTecnico.hashCode ^
        nomeComercial.hashCode ^
        descricao.hashCode;
  }

  Remedio copyWith({
    int? idRemedio,
    String? nomeTecnico,
    String? nomeComercial,
    String? descricao,
  }) {
    return Remedio(
      idRemedio: idRemedio ?? this.idRemedio,
      nomeTecnico: nomeTecnico ?? this.nomeTecnico,
      nomeComercial: nomeComercial ?? this.nomeComercial,
      descricao: descricao ?? this.descricao,
    );
  }

  factory Remedio.fromMap(Map<String, dynamic> map) {
    return Remedio(
      idRemedio: map['idRemedio'] as int,
      nomeTecnico: map['nomeTecnico'] as String,
      nomeComercial: map['nomeComercial'] as String,
      descricao: map['descricao'] as String,
    );
  }

  factory Remedio.fromJson(String source) =>
      Remedio.fromMap(json.decode(source) as Map<String, dynamic>);
}

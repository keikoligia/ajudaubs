// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Remedio {
  final int receita;
  final String nomeTecnico;
  final String nomeComercial;
  final String descricao;
  Remedio({
    required this.receita,
    required this.nomeTecnico,
    required this.nomeComercial,
    required this.descricao,
  });

  Remedio copyWith({
    int? receita,
    String? nomeTecnico,
    String? nomeComercial,
    String? descricao,
  }) {
    return Remedio(
      receita: receita ?? this.receita,
      nomeTecnico: nomeTecnico ?? this.nomeTecnico,
      nomeComercial: nomeComercial ?? this.nomeComercial,
      descricao: descricao ?? this.descricao,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'receita': receita,
      'nomeTecnico': nomeTecnico,
      'nomeComercial': nomeComercial,
      'descricao': descricao,
    };
  }

  factory Remedio.fromMap(Map<String, dynamic> map) {
    return Remedio(
      receita: map['receita'] as int,
      nomeTecnico: map['nomeTecnico'] as String,
      nomeComercial: map['nomeComercial'] as String,
      descricao: map['descricao'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Remedio.fromJson(String source) =>
      Remedio.fromMap(json.decode(source)[0] as Map<String, dynamic>);

  @override
  String toString() {
    return 'Remedio(receita: $receita, nomeTecnico: $nomeTecnico, nomeComercial: $nomeComercial, descricao: $descricao)';
  }

  @override
  bool operator ==(covariant Remedio other) {
    if (identical(this, other)) return true;

    return other.receita == receita &&
        other.nomeTecnico == nomeTecnico &&
        other.nomeComercial == nomeComercial &&
        other.descricao == descricao;
  }

  @override
  int get hashCode {
    return receita.hashCode ^
        nomeTecnico.hashCode ^
        nomeComercial.hashCode ^
        descricao.hashCode;
  }
}

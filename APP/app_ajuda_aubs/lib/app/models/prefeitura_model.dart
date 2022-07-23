// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Prefeitura {
  final int idPrefeitura;
  final String municipio;
  final String estado;
  final int senha;
  final String foneOuvidoria;
  final String emailOuvidoria;

  Prefeitura({
    required this.idPrefeitura,
    required this.municipio,
    required this.estado,
    required this.senha,
    required this.foneOuvidoria,
    required this.emailOuvidoria,
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idPrefeitura': idPrefeitura,
      'municipio': municipio,
      'estado': estado,
      'senha': senha,
      'foneOuvidoria': foneOuvidoria,
      'emailOuvidoria': emailOuvidoria,
    };
  }

  Prefeitura copyWith({
    int? idPrefeitura,
    String? municipio,
    String? estado,
    int? senha,
    String? foneOuvidoria,
    String? emailOuvidoria,
  }) {
    return Prefeitura(
      idPrefeitura: idPrefeitura ?? this.idPrefeitura,
      municipio: municipio ?? this.municipio,
      estado: estado ?? this.estado,
      senha: senha ?? this.senha,
      foneOuvidoria: foneOuvidoria ?? this.foneOuvidoria,
      emailOuvidoria: emailOuvidoria ?? this.emailOuvidoria,
    );
  }

  factory Prefeitura.fromMap(Map<String, dynamic> map) {
    return Prefeitura(
      idPrefeitura: map['idPrefeitura'] as int,
      municipio: map['municipio'] as String,
      estado: map['estado'] as String,
      senha: map['senha'] as int,
      foneOuvidoria: map['foneOuvidoria'] as String,
      emailOuvidoria: map['emailOuvidoria'] as String,
    );
  }

  factory Prefeitura.fromJson(String source) =>
      Prefeitura.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Prefeitura(idPrefeitura: $idPrefeitura, municipio: $municipio, estado: $estado, senha: $senha, foneOuvidoria: $foneOuvidoria, emailOuvidoria: $emailOuvidoria)';
  }

  @override
  bool operator ==(covariant Prefeitura other) {
    if (identical(this, other)) return true;

    return other.idPrefeitura == idPrefeitura &&
        other.municipio == municipio &&
        other.estado == estado &&
        other.senha == senha &&
        other.foneOuvidoria == foneOuvidoria &&
        other.emailOuvidoria == emailOuvidoria;
  }

  @override
  int get hashCode {
    return idPrefeitura.hashCode ^
        municipio.hashCode ^
        estado.hashCode ^
        senha.hashCode ^
        foneOuvidoria.hashCode ^
        emailOuvidoria.hashCode;
  }
}

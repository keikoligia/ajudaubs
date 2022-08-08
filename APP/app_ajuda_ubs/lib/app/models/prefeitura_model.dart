// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Prefeitura {
  final String municipio;
  final String estado;
  final int senha;
  final String foneOuvidoria;
  final String emailOuvidoria;
  final String? site;

  Prefeitura({
    required this.municipio,
    required this.estado,
    required this.senha,
    required this.foneOuvidoria,
    required this.emailOuvidoria,
    required this.site,
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'municipio': municipio,
      'estado': estado,
      'senha': senha,
      'foneOuvidoria': foneOuvidoria,
      'emailOuvidoria': emailOuvidoria,
      'site': site,
    };
  }

  Prefeitura copyWith({
    String? municipio,
    String? estado,
    int? senha,
    String? foneOuvidoria,
    String? emailOuvidoria,
    String? site,
  }) {
    return Prefeitura(
        municipio: municipio ?? this.municipio,
        estado: estado ?? this.estado,
        senha: senha ?? this.senha,
        foneOuvidoria: foneOuvidoria ?? this.foneOuvidoria,
        emailOuvidoria: emailOuvidoria ?? this.emailOuvidoria,
        site: site ?? this.site);
  }

  factory Prefeitura.fromMap(Map<String, dynamic> map) {
    return Prefeitura(
      municipio: map['municipio'] as String,
      estado: map['estado'] as String,
      senha: map['senha'] as int,
      foneOuvidoria: map['foneOuvidoria'] as String,
      emailOuvidoria: map['emailOuvidoria'] as String,
      site: map['site'] as String,
    );
  }

  factory Prefeitura.fromJson(String source) =>
      Prefeitura.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Prefeitura(municipio: $municipio, estado: $estado, senha: $senha, foneOuvidoria: $foneOuvidoria, emailOuvidoria: $emailOuvidoria, , site: $site)';
  }

  @override
  bool operator ==(covariant Prefeitura other) {
    if (identical(this, other)) return true;

    return other.municipio == municipio &&
        other.estado == estado &&
        other.senha == senha &&
        other.foneOuvidoria == foneOuvidoria &&
        other.emailOuvidoria == emailOuvidoria &&
        other.site == site;
  }

  @override
  int get hashCode {
    return municipio.hashCode ^
        estado.hashCode ^
        senha.hashCode ^
        foneOuvidoria.hashCode ^
        emailOuvidoria.hashCode ^
        site.hashCode;
  }
}

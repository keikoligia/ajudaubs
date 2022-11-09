// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Prefeitura {
  final String nome;
  final String descricao;

  Prefeitura({
    required this.nome,
    required this.descricao,
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'descricao': descricao,
    };
  }

  Prefeitura copyWith({
    int? idTipoManifestacao,
    String? nome,
    String? descricao,
  }) {
    return Prefeitura(
      nome: nome ?? this.nome,
      descricao: descricao ?? this.descricao,
    );
  }

  factory Prefeitura.fromMap(Map<String, dynamic> map) {
    return Prefeitura(
      nome: map['nome'] as String,
      descricao: map['descricao'] as String,
    );
  }

  factory Prefeitura.fromJson(String source) =>
      Prefeitura.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Prefeitura(nome: $nome, descricao: $descricao)';

  @override
  bool operator ==(covariant Prefeitura other) {
    if (identical(this, other)) return true;

    return other.nome == nome && other.descricao == descricao;
  }

  @override
  int get hashCode => nome.hashCode ^ descricao.hashCode;
}

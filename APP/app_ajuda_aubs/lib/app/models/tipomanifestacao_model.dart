// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Prefeitura {
  final int idTipoManifestacao;
  final String nome;
  final String descricao;
  Prefeitura({
    required this.idTipoManifestacao,
    required this.nome,
    required this.descricao,
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idTipoManifestacao': idTipoManifestacao,
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
      idTipoManifestacao: idTipoManifestacao ?? this.idTipoManifestacao,
      nome: nome ?? this.nome,
      descricao: descricao ?? this.descricao,
    );
  }

  factory Prefeitura.fromMap(Map<String, dynamic> map) {
    return Prefeitura(
      idTipoManifestacao: map['idTipoManifestacao'] as int,
      nome: map['nome'] as String,
      descricao: map['descricao'] as String,
    );
  }

  factory Prefeitura.fromJson(String source) =>
      Prefeitura.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Prefeitura(idTipoManifestacao: $idTipoManifestacao, nome: $nome, descricao: $descricao)';

  @override
  bool operator ==(covariant Prefeitura other) {
    if (identical(this, other)) return true;

    return other.idTipoManifestacao == idTipoManifestacao &&
        other.nome == nome &&
        other.descricao == descricao;
  }

  @override
  int get hashCode =>
      idTipoManifestacao.hashCode ^ nome.hashCode ^ descricao.hashCode;
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Manifestacao {
  final int idManifestacao;
  final String idUbs;
  final String idPaciente;
  final int tipo;
  final String status;
  final String descricao;
  final String dataManifestacao;
  final String protocolo;

  Manifestacao({
    required this.idManifestacao,
    required this.idPaciente,
    required this.idUbs,
    required this.tipo,
    required this.status,
    required this.descricao,
    required this.dataManifestacao,
    required this.protocolo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idManifestacao': idManifestacao,
      'idPaciente': idPaciente,
      'idUbs': idUbs,
      'tipo': tipo,
      'status': status,
      'descricao': descricao,
      'dataManifestacao': dataManifestacao,
      'protocolo': descricao,
    };
  }

  @override
  String toString() {
    return 'Disponibilidade(idManifestacao: $idManifestacao, idPaciente: $idPaciente, idUbs: $idUbs, tipo: $tipo, status: $status, descricao: $descricao, dataManifestacao: $dataManifestacao, protocolo: $protocolo)';
  }

  factory Manifestacao.fromMap(Map<String, dynamic> map) {
    return Manifestacao(
      idManifestacao: map['idManifestacao'] as int,
      idPaciente: map['idPaciente'] as String,
      idUbs: map['idUbs'] as String,
      tipo: map['tipo'] as int,
      status: map['status'] as String,
      descricao: map['descricao'] as String,
      dataManifestacao: map['dataManifestacao'] as String,
      protocolo: map['protocolo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Manifestacao.fromJson(String source) =>
      Manifestacao.fromMap(json.decode(source) as Map<String, dynamic>);
}

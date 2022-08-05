// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Avaliacao {
  final int idAvaliacao;
  final String idUbs;
  final String idPaciente;
  final int avaliacao;

  Avaliacao({
    required this.idAvaliacao,
    required this.idUbs,
    required this.idPaciente,
    required this.avaliacao,
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idAvaliacao': idAvaliacao,
      'idUbs': idUbs,
      'idPaciente': idPaciente,
      'avaliacao': avaliacao,
    };
  }

  Avaliacao copyWith({
    int? idAvaliacao,
    String? idUbs,
    String? idPaciente,
    int? avaliacao,
  }) {
    return Avaliacao(
      idAvaliacao: idAvaliacao ?? this.idAvaliacao,
      idUbs: idUbs ?? this.idUbs,
      idPaciente: idPaciente ?? this.idPaciente,
      avaliacao: avaliacao ?? this.avaliacao,
    );
  }

  factory Avaliacao.fromMap(Map<String, dynamic> map) {
    return Avaliacao(
      idAvaliacao: map['idAvaliacao'] as int,
      idUbs: map['idUbs'] as String,
      idPaciente: map['idPaciente'] as String,
      avaliacao: map['avaliacao'] as int,
    );
  }

  factory Avaliacao.fromJson(String source) =>
      Avaliacao.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Avaliacao(idAvaliacao: $idAvaliacao, idUbs: $idUbs, idPaciente: $idPaciente, avaliacao: $avaliacao)';
  }

  @override
  bool operator ==(covariant Avaliacao other) {
    if (identical(this, other)) return true;
  
    return 
      other.idAvaliacao == idAvaliacao &&
      other.idUbs == idUbs &&
      other.idPaciente == idPaciente &&
      other.avaliacao == avaliacao;
  }

  @override
  int get hashCode {
    return idAvaliacao.hashCode ^
      idUbs.hashCode ^
      idPaciente.hashCode ^
      avaliacao.hashCode;
  }
}

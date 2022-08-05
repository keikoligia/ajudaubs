// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Disponibilidade {
  final int idDisponibilidade;
  final String idMedico;
  final String idUbs;
  final bool bloco;
  final String dataMarcada;
  final String disponivel;
  Disponibilidade({
    required this.idDisponibilidade,
    required this.idMedico,
    required this.idUbs,
    required this.bloco,
    required this.dataMarcada,
    required this.disponivel,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idDisponibilidade': idDisponibilidade,
      'idMedico': idMedico,
      'idUbs': idUbs,
      'bloco': bloco,
      'dataMarcada': dataMarcada,
      'disponivel': disponivel,
    };
  }

  @override
  String toString() {
    return 'Disponibilidade(idDisponibilidade: $idDisponibilidade, idMedico: $idMedico, idUbs: $idUbs, bloco: $bloco, dataMarcada: $dataMarcada, disponivel: $disponivel)';
  }

  @override
  bool operator ==(covariant Disponibilidade other) {
    if (identical(this, other)) return true;

    return other.idDisponibilidade == idDisponibilidade &&
        other.idMedico == idMedico &&
        other.idUbs == idUbs &&
        other.bloco == bloco &&
        other.dataMarcada == dataMarcada &&
        other.disponivel == disponivel;
  }

  @override
  int get hashCode {
    return idDisponibilidade.hashCode ^
        idMedico.hashCode ^
        idUbs.hashCode ^
        bloco.hashCode ^
        dataMarcada.hashCode ^
        disponivel.hashCode;
  }

  Disponibilidade copyWith({
    int? idDisponibilidade,
    String? idMedico,
    String? idUbs,
    bool? bloco,
    String? dataMarcada,
    String? disponivel,
  }) {
    return Disponibilidade(
      idDisponibilidade: idDisponibilidade ?? this.idDisponibilidade,
      idMedico: idMedico ?? this.idMedico,
      idUbs: idUbs ?? this.idUbs,
      bloco: bloco ?? this.bloco,
      dataMarcada: dataMarcada ?? this.dataMarcada,
      disponivel: disponivel ?? this.disponivel,
    );
  }

  factory Disponibilidade.fromMap(Map<String, dynamic> map) {
    return Disponibilidade(
      idDisponibilidade: map['idDisponibilidade'] as int,
      idMedico: map['idMedico'] as String,
      idUbs: map['idUbs'] as String,
      bloco: map['bloco'] as bool,
      dataMarcada: map['dataMarcada'] as String,
      disponivel: map['disponivel'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Disponibilidade.fromJson(String source) =>
      Disponibilidade.fromMap(json.decode(source) as Map<String, dynamic>);
}

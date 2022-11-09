import 'dart:convert';

class Consulta {
  final int idConsulta;
  final String idMedico;
  final String idPaciente;
  final int area;
  final int idDisponibilidade;
  final String descricao;

  Consulta(
      {required this.idConsulta,
      required this.idMedico,
      required this.idPaciente,
      required this.area,
      required this.idDisponibilidade,
      required this.descricao});


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idConsulta': idConsulta,
      'idMedico': idMedico,
      'idPaciente': idPaciente,
    };
  }

  factory Consulta.fromMap(Map<String, dynamic> map) {
    return Consulta(
      idConsulta: map['idConsulta'] as int,
      idMedico: map['idMedico'] as String,
      idPaciente: map['idPaciente'] as String,
      area: map['area'] as int,
      idDisponibilidade: map['idDisponibilidade'] as int,
      descricao: map['descricao'] as String,

    );
  }

  String toJson() => json.encode(toMap());

  factory Consulta.fromJson(String source) =>
      Consulta.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Consulta(idConsulta: $idConsulta, idMedico: $idMedico, idPaciente: $idPaciente)';

  @override
  bool operator ==(covariant Consulta other) {
    if (identical(this, other)) return true;

    return other.idConsulta == idConsulta &&
        other.idMedico == idMedico &&
        other.idPaciente == idPaciente;
  }

  @override
  int get hashCode =>
      idConsulta.hashCode ^ idMedico.hashCode ^ idPaciente.hashCode;
}

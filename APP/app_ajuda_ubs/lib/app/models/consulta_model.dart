// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Consulta {
  late int? idConsulta;
  late String idUbs;
  late String idMedico;
  late String idPaciente;
  late String area;
  late String dataMarcada;
  late int bloco;
  late String descricao;
  Consulta({
    required this.idConsulta,
    required this.idUbs,
    required this.idMedico,
    required this.idPaciente,
    required this.area,
    required this.dataMarcada,
    required this.bloco,
    required this.descricao,
  });

  /*
  
  idConsulta
int(11) AI PK
idUbs
char(11)
idMedico
varchar(20)
idPaciente
char(15)
area
varchar(100)
dataMarcada
date
bloco
int(11)
descricao
varchar(200)
  
   */

  Consulta.construtor();

  static List<Consulta> fromJsons(String str) {
    final list = json.decode(str);

    var users = <Consulta>[];

    for (int i = 0; i < list.length; i++) {
      users.add(Consulta.fromMap(list[i]));
    }

    return users;
  }

  Consulta copyWith({
    int? idConsulta,
    String? idUbs,
    String? idMedico,
    String? idPaciente,
    String? area,
    String? dataMarcada,
    int? bloco,
    String? descricao,
  }) {
    return Consulta(
      idConsulta: idConsulta ?? this.idConsulta,
      idUbs: idUbs ?? this.idUbs,
      idMedico: idMedico ?? this.idMedico,
      idPaciente: idPaciente ?? this.idPaciente,
      area: area ?? this.area,
      dataMarcada: dataMarcada ?? this.dataMarcada,
      bloco: bloco ?? this.bloco,
      descricao: descricao ?? this.descricao,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idConsulta': idConsulta.toString(),
      'idUbs': idUbs,
      'idMedico': idMedico,
      'idPaciente': idPaciente,
      'area': area,
      'dataMarcada': dataMarcada,
      'bloco': bloco.toString(),
      'descricao': descricao,
    };
  }

  factory Consulta.fromMap(Map<String, dynamic> map) {
    return Consulta(
      idConsulta: map['idConsulta'] as int,
      idUbs: map['idUbs'] as String,
      idMedico: map['idMedico'] as String,
      idPaciente: map['idPaciente'] as String,
      area: map['area'] as String,
      dataMarcada: map['dataMarcada'] as String,
      bloco: map['bloco'] as int,
      descricao: map['descricao'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Consulta.fromJson(String source) =>
      Consulta.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Consulta(idConsulta: $idConsulta, idUbs: $idUbs, idMedico: $idMedico, idPaciente: $idPaciente, area: $area, dataMarcada: $dataMarcada, bloco: $bloco, descricao: $descricao)';
  }

  @override
  bool operator ==(covariant Consulta other) {
    if (identical(this, other)) return true;

    return other.idConsulta == idConsulta &&
        other.idUbs == idUbs &&
        other.idMedico == idMedico &&
        other.idPaciente == idPaciente &&
        other.area == area &&
        other.dataMarcada == dataMarcada &&
        other.bloco == bloco &&
        other.descricao == descricao;
  }

  @override
  int get hashCode {
    return idConsulta.hashCode ^
        idUbs.hashCode ^
        idMedico.hashCode ^
        idPaciente.hashCode ^
        area.hashCode ^
        dataMarcada.hashCode ^
        bloco.hashCode ^
        descricao.hashCode;
  }
}

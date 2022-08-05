// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Horario {
  final int idHorario;
  final String dia;
  final String inicioHorario;
  final String fimHorario;
  final String incioAlmoco;
  final String fimAlmoco;

  Horario({
    required this.idHorario,
    required this.dia,
    required this.inicioHorario,
    required this.fimHorario,
    required this.incioAlmoco,
    required this.fimAlmoco,
  });

  //final String complemento;

  factory Horario.fromMap(Map<String, dynamic> map) {
    return Horario(
      idHorario: map['idHorario'] as int,
      dia: map['dia'] as String,
      inicioHorario: map['inicioHorario'] as String,
      fimHorario: map['fimHorario'] as String,
      incioAlmoco: map['incioAlmoco'] as String,
      fimAlmoco: map['fimAlmoco'] as String,
    );
  }

  factory Horario.fromJson(String source) =>
      Horario.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idHorario': idHorario,
      'dia': dia,
      'inicioHorario': inicioHorario,
      'fimHorario': fimHorario,
      'incioAlmoco': incioAlmoco,
      'fimAlmoco': fimAlmoco,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Horario(idHorario: $idHorario, dia: $dia, inicioHorario: $inicioHorario, fimHorario: $fimHorario, incioAlmoco: $incioAlmoco, fimAlmoco: $fimAlmoco)';
  }

  Horario copyWith({
    int? idHorario,
    String? dia,
    String? inicioHorario,
    String? fimHorario,
    String? incioAlmoco,
    String? fimAlmoco,
  }) {
    return Horario(
      idHorario: idHorario ?? this.idHorario,
      dia: dia ?? this.dia,
      inicioHorario: inicioHorario ?? this.inicioHorario,
      fimHorario: fimHorario ?? this.fimHorario,
      incioAlmoco: incioAlmoco ?? this.incioAlmoco,
      fimAlmoco: fimAlmoco ?? this.fimAlmoco,
    );
  }

  @override
  bool operator ==(covariant Horario other) {
    if (identical(this, other)) return true;

    return other.idHorario == idHorario &&
        other.dia == dia &&
        other.inicioHorario == inicioHorario &&
        other.fimHorario == fimHorario &&
        other.incioAlmoco == incioAlmoco &&
        other.fimAlmoco == fimAlmoco;
  }

  @override
  int get hashCode {
    return idHorario.hashCode ^
        dia.hashCode ^
        inicioHorario.hashCode ^
        fimHorario.hashCode ^
        incioAlmoco.hashCode ^
        fimAlmoco.hashCode;
  }
}

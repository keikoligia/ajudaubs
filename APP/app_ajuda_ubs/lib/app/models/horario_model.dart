// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Horario {
  late String dia;
  late String inicioHorario;
  late String fimHorario;
  late String incioAlmoco;
  late String fimAlmoco;
  late String idFuncionario;

  Horario.construtor1();

  Horario({
    required this.dia,
    required this.inicioHorario,
    required this.fimHorario,
    required this.incioAlmoco,
    required this.fimAlmoco,
    required this.idFuncionario,
  });

  Horario copyWith({
    String? dia,
    String? inicioHorario,
    String? fimHorario,
    String? incioAlmoco,
    String? fimAlmoco,
    String? idFuncionario,
  }) {
    return Horario(
      dia: dia ?? this.dia,
      inicioHorario: inicioHorario ?? this.inicioHorario,
      fimHorario: fimHorario ?? this.fimHorario,
      incioAlmoco: incioAlmoco ?? this.incioAlmoco,
      fimAlmoco: fimAlmoco ?? this.fimAlmoco,
      idFuncionario: idFuncionario ?? this.idFuncionario,
    );
  }

  factory Horario.fromJson(String source) =>
      Horario.fromMap(json.decode(source) as Map<String, dynamic>);

  static List<Horario> fromJsons(String str) {
    final list = json.decode(str);

    var users = <Horario>[];

    for (int i = 0; i < list.length; i++) {
      users.add(Horario.fromMap(list[i]));
    }

    return users;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dia': dia,
      'inicioHorario': inicioHorario,
      'fimHorario': fimHorario,
      'incioAlmoco': incioAlmoco,
      'fimAlmoco': fimAlmoco,
      'idFuncionario': idFuncionario,
    };
  }

  factory Horario.fromMap(Map<String, dynamic> map) {
    return Horario(
      dia: map['dia'] as String,
      inicioHorario: map['inicioHorario'] as String,
      fimHorario: map['fimHorario'] as String,
      incioAlmoco: map['incioAlmoco'] as String,
      fimAlmoco: map['fimAlmoco'] as String,
      idFuncionario: map['idFuncionario'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Horario(dia: $dia, inicioHorario: $inicioHorario, fimHorario: $fimHorario, incioAlmoco: $incioAlmoco, fimAlmoco: $fimAlmoco, idFuncionario: $idFuncionario)';
  }

  @override
  bool operator ==(covariant Horario other) {
    if (identical(this, other)) return true;

    return other.dia == dia &&
        other.inicioHorario == inicioHorario &&
        other.fimHorario == fimHorario &&
        other.incioAlmoco == incioAlmoco &&
        other.fimAlmoco == fimAlmoco &&
        other.idFuncionario == idFuncionario;
  }

  @override
  int get hashCode {
    return dia.hashCode ^
        inicioHorario.hashCode ^
        fimHorario.hashCode ^
        incioAlmoco.hashCode ^
        fimAlmoco.hashCode ^
        idFuncionario.hashCode;
  }
}

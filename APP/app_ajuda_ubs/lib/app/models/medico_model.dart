// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ajuda_ubs/app/models/consulta_model.dart';
import 'package:ajuda_ubs/app/models/funcionario_model.dart';

class Medico {
  late int dia;
  late String inicioHorario;
  late String fimHorario;
  late String incioAlmoco;
  late String fimAlmoco;
  late Funcionario medico;

  late List<DateTime> horarios;

  late DateTime inicioHorarioDate = DateTime.now();
  late DateTime fimHorarioDate = DateTime.now();
  late DateTime inicioAlmocoDate = DateTime.now();
  late DateTime fimAlmocoDate = DateTime.now();

  Medico(
    this.dia,
    this.inicioHorario,
    this.fimHorario,
    this.incioAlmoco,
    this.fimAlmoco,
    this.medico,
  ) {
    _getAllHorarios();
  }

  Medico copyWith({
    int? dia,
    String? inicioHorario,
    String? fimHorario,
    String? incioAlmoco,
    String? fimAlmoco,
    Funcionario? medico,
  }) {
    return Medico(
      dia ?? this.dia,
      inicioHorario ?? this.inicioHorario,
      fimHorario ?? this.fimHorario,
      incioAlmoco ?? this.incioAlmoco,
      fimAlmoco ?? this.fimAlmoco,
      medico ?? this.medico,
    );
  }

  List<DateTime> getHorarios(List<Consulta> consultas) {
    late List<DateTime> horarios = [];

    consultas.sort((Consulta a, Consulta b) => a.bloco.compareTo(b.bloco));

    inicioHorarioDate = DateTime(
        2022,
        9,
        dia,
        int.parse(inicioHorario.substring(0, 2)),
        int.parse(inicioHorario.substring(3, 5)));

    fimHorarioDate = DateTime(
        2022,
        9,
        dia,
        int.parse(fimHorario.substring(0, 2)),
        int.parse(fimHorario.substring(3, 5)));
    inicioAlmocoDate = DateTime(
        2022,
        9,
        dia,
        int.parse(incioAlmoco.substring(0, 2)),
        int.parse(incioAlmoco.substring(3, 5)));
    fimAlmocoDate = DateTime(2022, 9, dia, int.parse(fimAlmoco.substring(0, 2)),
        int.parse(fimAlmoco.substring(3, 5)));

    Duration dif = fimHorarioDate.difference(inicioHorarioDate) -
        fimAlmocoDate.difference(inicioAlmocoDate);

    late Duration hrsTrab = const Duration();
    late DateTime auxIniAlmoco = inicioHorarioDate;

    late List<DateTime> aux = [];
    late int index = 1;

    if (consultas.isNotEmpty) {
      if (consultas[0].bloco != index) {
        aux.add(auxIniAlmoco);
        horarios.add(auxIniAlmoco);
        index++;
      } else {
        consultas.removeAt(0);
        index++;
      }
    }

    while (hrsTrab.compareTo(dif) <= 0) {
      hrsTrab += const Duration(minutes: 15);
      auxIniAlmoco = auxIniAlmoco.add(const Duration(minutes: 15));
      aux.add(auxIniAlmoco);
      if (aux[aux.length - 1].compareTo(inicioAlmocoDate) < 0 ||
          aux[aux.length - 1].compareTo(fimAlmocoDate) >= 0) {
        //if (consultas.isNotEmpty && consultas[0].bloco != index) {
        if (consultas.isNotEmpty && consultas[0].bloco != index) {
          horarios.add(auxIniAlmoco);
          index++;
        } else if (consultas.isEmpty) {
          horarios.add(auxIniAlmoco);
        } else {
          consultas.removeAt(0);
          index++;
        }
      } else {
        hrsTrab -= const Duration(minutes: 15);
      }
    }

    horarios.removeLast();
    horarios.removeLast();
    return horarios;
  }

  void _getAllHorarios() {
    late List<DateTime> horarios = [];

    inicioHorarioDate = DateTime(
        2022,
        9,
        dia,
        int.parse(inicioHorario.substring(0, 2)),
        int.parse(inicioHorario.substring(3, 5)));

    fimHorarioDate = DateTime(
        2022,
        9,
        dia,
        int.parse(fimHorario.substring(0, 2)),
        int.parse(fimHorario.substring(3, 5)));
    inicioAlmocoDate = DateTime(
        2022,
        9,
        dia,
        int.parse(incioAlmoco.substring(0, 2)),
        int.parse(incioAlmoco.substring(3, 5)));
    fimAlmocoDate = DateTime(2022, 9, dia, int.parse(fimAlmoco.substring(0, 2)),
        int.parse(fimAlmoco.substring(3, 5)));

    Duration dif = fimHorarioDate.difference(inicioHorarioDate) -
        fimAlmocoDate.difference(inicioAlmocoDate);

    late Duration hrsTrab = const Duration();
    late DateTime auxIniAlmoco = inicioHorarioDate;

    late List<DateTime> aux = [];
    late int index = 1;

    aux.add(auxIniAlmoco);
    horarios.add(auxIniAlmoco);

    while (hrsTrab.compareTo(dif) <= 0) {
      hrsTrab += const Duration(minutes: 15);
      auxIniAlmoco = auxIniAlmoco.add(const Duration(minutes: 15));
      aux.add(auxIniAlmoco);
      if (aux[aux.length - 1].compareTo(inicioAlmocoDate) < 0 ||
          aux[aux.length - 1].compareTo(fimAlmocoDate) >= 0) {
        //if (consultas.isNotEmpty && consultas[0].bloco != index) {
        horarios.add(auxIniAlmoco);
      } else {
        hrsTrab -= const Duration(minutes: 15);
      }
    }

    horarios.removeLast();
    horarios.removeLast();
    this.horarios = horarios;
  }

  int getQtdHoras() {
    Duration dif = fimHorarioDate.difference(inicioHorarioDate);

    return dif.inHours ~/ 15;
  }

  @override
  String toString() {
    return 'Medico(dia: $dia, inicioHorario: $inicioHorario, fimHorario: $fimHorario, incioAlmoco: $incioAlmoco, fimAlmoco: $fimAlmoco, medico: $medico)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dia': dia,
      'inicioHorario': inicioHorario,
      'fimHorario': fimHorario,
      'incioAlmoco': incioAlmoco,
      'fimAlmoco': fimAlmoco,
      'medico': medico.toMap(),
    };
  }

  factory Medico.fromMap(Map<String, dynamic> map) {
    return Medico(
      map['dia'] as int,
      map['inicioHorario'] as String,
      map['fimHorario'] as String,
      map['incioAlmoco'] as String,
      map['fimAlmoco'] as String,
      Funcionario.fromMap(map['medico'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Medico.fromJson(String source) =>
      Medico.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant Medico other) {
    if (identical(this, other)) return true;

    return other.dia == dia &&
        other.inicioHorario == inicioHorario &&
        other.fimHorario == fimHorario &&
        other.incioAlmoco == incioAlmoco &&
        other.fimAlmoco == fimAlmoco &&
        other.medico == medico;
  }

  @override
  int get hashCode {
    return dia.hashCode ^
        inicioHorario.hashCode ^
        fimHorario.hashCode ^
        incioAlmoco.hashCode ^
        fimAlmoco.hashCode ^
        medico.hashCode;
  }
}

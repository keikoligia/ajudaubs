// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Funcionario {
  final String cpf;
  final String crm;
  final int cargo;
  final String nome;
  final String idUbs;
  final int idHorario;
  Funcionario({
    required this.cpf,
    required this.crm,
    required this.cargo,
    required this.nome,
    required this.idUbs,
    required this.idHorario,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cpf': cpf,
      'crm': crm,
      'cargo': cargo,
      'nome': nome,
      'idUbs': idUbs,
      'idHorario': idHorario,
    };
  }

  @override
  String toString() {
    return 'Funcionario(cpf: $cpf, crm: $crm, cargo: $cargo, nome: $nome, idUbs: $idUbs, idHorario: $idHorario)';
  }

  @override
  bool operator ==(covariant Funcionario other) {
    if (identical(this, other)) return true;

    return other.cpf == cpf &&
        other.crm == crm &&
        other.cargo == cargo &&
        other.nome == nome &&
        other.idUbs == idUbs &&
        other.idHorario == idHorario;
  }

  @override
  int get hashCode {
    return cpf.hashCode ^
        crm.hashCode ^
        cargo.hashCode ^
        nome.hashCode ^
        idUbs.hashCode ^
        idHorario.hashCode;
  }

  Funcionario copyWith({
    String? cpf,
    String? crm,
    int? cargo,
    String? nome,
    String? idUbs,
    int? idHorario,
  }) {
    return Funcionario(
      cpf: cpf ?? this.cpf,
      crm: crm ?? this.crm,
      cargo: cargo ?? this.cargo,
      nome: nome ?? this.nome,
      idUbs: idUbs ?? this.idUbs,
      idHorario: idHorario ?? this.idHorario,
    );
  }

  factory Funcionario.fromMap(Map<String, dynamic> map) {
    return Funcionario(
        cpf: map['cpf'] as String,
        crm: map['crm'] as String,
        cargo: map['cargo'] as int,
        nome: map['nome'] as String,
        idUbs: map['idUbs'] as String,
        idHorario: map['idHorario'] as int);
  }

  factory Funcionario.fromJson(String source) =>
      Funcionario.fromMap(json.decode(source) as Map<String, dynamic>);
}

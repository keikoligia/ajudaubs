// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Funcionario {
  final String cpf;
  final String crm;
  final String cargo;
  final String nome;
  final String idUbs;

  Funcionario({
    required this.cpf,
    required this.crm,
    required this.cargo,
    required this.nome,
    required this.idUbs,
  });

  Funcionario copyWith({
    String? cpf,
    String? crm,
    String? cargo,
    String? nome,
    String? idUbs,
  }) {
    return Funcionario(
      cpf: cpf ?? this.cpf,
      crm: crm ?? this.crm,
      cargo: cargo ?? this.cargo,
      nome: nome ?? this.nome,
      idUbs: idUbs ?? this.idUbs,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cpf': cpf,
      'crm': crm,
      'cargo': cargo,
      'nome': nome,
      'idUbs': idUbs,
    };
  }

  factory Funcionario.fromMap(Map<String, dynamic> map) {
    return Funcionario(
      cpf: map['cpf'] as String,
      crm: map['crm'] as String,
      cargo: map['cargo'] as String,
      nome: map['nome'] as String,
      idUbs: map['idUbs'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Funcionario.fromJson(String source) =>
      Funcionario.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Funcionario(cpf: $cpf, crm: $crm, cargo: $cargo, nome: $nome, idUbs: $idUbs)';
  }

  @override
  bool operator ==(covariant Funcionario other) {
    if (identical(this, other)) return true;

    return other.cpf == cpf &&
        other.crm == crm &&
        other.cargo == cargo &&
        other.nome == nome &&
        other.idUbs == idUbs;
  }

  @override
  int get hashCode {
    return cpf.hashCode ^
        crm.hashCode ^
        cargo.hashCode ^
        nome.hashCode ^
        idUbs.hashCode;
  }

  static List<Funcionario> fromJsons(String str) {
    final list = json.decode(str);

    var users = <Funcionario>[];

    for (int i = 0; i < list.length; i++) {
      users.add(Funcionario.fromMap(list[i]));
    }

    return users;
  }
}

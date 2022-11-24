// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Paciente {
  late String cns;
  late String dataNascimento;
  late String nome;
  late String endereco;
  late String senha;
  late String telefone;
  late String email;
  late String idUbs;
  Paciente.constructor1();

  Paciente({
    required this.cns,
    required this.dataNascimento,
    required this.nome,
    required this.endereco,
    required this.senha,
    required this.telefone,
    required this.email,
    required this.idUbs,
  });

  Paciente copyWith({
    String? cns,
    String? dataNascimento,
    String? nome,
    String? endereco,
    String? senha,
    String? telefone,
    String? email,
    String? idUbs,
  }) {
    return Paciente(
      cns: cns ?? this.cns,
      dataNascimento: dataNascimento ?? this.dataNascimento,
      nome: nome ?? this.nome,
      endereco: endereco ?? this.endereco,
      senha: senha ?? this.senha,
      telefone: telefone ?? this.telefone,
      email: email ?? this.email,
      idUbs: idUbs ?? this.idUbs,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cns': cns,
      'dataNascimento': dataNascimento,
      'nome': nome,
      'endereco': endereco,
      'senha': senha,
      'telefone': telefone,
      'email': email,
      'idUbs': idUbs,
    };
  }

  factory Paciente.fromMap(Map<String, dynamic> json) => Paciente(
      cns: json["cns"],
      dataNascimento: json["dataNascimento"],
      nome: json["nome"],
      endereco: json["endereco"],
      senha: json["senha"],
      telefone: json["telefone"],
      email: json["email"],
      idUbs: json["idUbs"]);
  String toJson() => json.encode(toMap());

  factory Paciente.fromJson(String source) =>
      Paciente.fromMap(jsonDecode(source)[0] as Map<String, dynamic>);

  @override
  String toString() {
    return 'Paciente(cns: $cns, dataNascimento: $dataNascimento, nome: $nome, endereco: $endereco, senha: $senha, telefone: $telefone, email: $email, idUbs: $idUbs)';
  }

  @override
  bool operator ==(covariant Paciente other) {
    if (identical(this, other)) return true;

    return other.cns == cns &&
        other.dataNascimento == dataNascimento &&
        other.nome == nome &&
        other.endereco == endereco &&
        other.senha == senha &&
        other.telefone == telefone &&
        other.email == email &&
        other.idUbs == idUbs;
  }

  @override
  int get hashCode {
    return cns.hashCode ^
        dataNascimento.hashCode ^
        nome.hashCode ^
        endereco.hashCode ^
        senha.hashCode ^
        telefone.hashCode ^
        email.hashCode ^
        idUbs.hashCode;
  }
}

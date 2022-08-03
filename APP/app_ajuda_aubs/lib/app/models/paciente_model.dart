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

  Paciente(
      {required this.cns,
      required this.dataNascimento,
      required this.nome,
      required this.endereco,
      required this.senha,
      required this.telefone,
      required this.email,
      required this.idUbs});

  // ignore: empty_constructor_bodies

  factory Paciente.fromJson(String str) {
    final jsonresponse = json.decode(str);
    return Paciente.fromMap(jsonresponse);
  }

  static Paciente pa = Paciente(cns: "222345678912345", dataNascimento: '2004-10-29T03:00:00.000Z', nome: 'Ligia Keiko Carvalho', 
  endereco: '222345678912345', senha: 'Ligia123',  telefone: '19994974518', email: 'ligia@gmail.com', idUbs: '00000000002');

  String toJson() => json.encode(toMap());

  factory Paciente.fromMap(Map<String, dynamic> json) => Paciente(
      cns: json["cns"],
      dataNascimento: json["dataNascimento"],
      nome: json["nome"],
      endereco: json["endereco"],
      senha: json["senha"],
      telefone: json["telefone"],
      email: json["email"],
      idUbs: json["idUbs"]);

  Map<String, dynamic> toMap() => {
        "cns": cns,
        "dataNascimento": dataNascimento,
        "nome": nome,
        "endereco": endereco,
        "senha": senha,
        "telefone": telefone,
        "email": email,
        "idUbs": idUbs,
      };
}

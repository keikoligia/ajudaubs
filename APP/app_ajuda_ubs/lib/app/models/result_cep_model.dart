import 'dart:convert';

class ResultCep {
  final String cep;
  final String logradouro;
  final String complemento;
  final String bairro;
  final String cidade;
  final String uf;

  const ResultCep(
      {required this.cep,
      required this.logradouro,
      required this.complemento,
      required this.bairro,
      required this.cidade,
      required this.uf});

  factory ResultCep.fromJson(String str) => ResultCep.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResultCep.fromMap(Map<String, dynamic> json) => ResultCep(
        cep: json["cep"],
        logradouro: json["logradouro"],
        complemento: '',
        bairro: json["bairro"],
        cidade: json["localidade"],
        uf: json["uf"],
      );

  Map<String, dynamic> toMap() => {
        "cep": cep,
        "logradouro": logradouro,
        "complemento": complemento,
        "bairro": bairro,
        "cidade": cidade,
        "uf": uf
      };
}

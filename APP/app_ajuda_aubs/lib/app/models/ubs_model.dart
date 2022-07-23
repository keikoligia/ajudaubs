// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UBS {
  final String cnes;
  final String nome;
  final int endereco;
  final String senha;
  final String telefone;
  final int idPrefeitura;
  final String horario;
  final String email;

  UBS({
    required this.cnes,
    required this.nome,
    required this.endereco,
    required this.senha,
    required this.telefone,
    required this.idPrefeitura,
    required this.horario,
    required this.email,
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cnes': cnes,
      'nome': nome,
      'endereco': endereco,
      'senha': senha,
      'telefone': telefone,
      'idPrefeitura': idPrefeitura,
      'horario': horario,
      'email': email,
    };
  }

  @override
  String toString() {
    return 'UBS(cnes: $cnes, nome: $nome, endereco: $endereco, senha: $senha, telefone: $telefone, idPrefeitura: $idPrefeitura, horario: $horario, email: $email)';
  }

  @override
  bool operator ==(covariant UBS other) {
    if (identical(this, other)) return true;

    return other.cnes == cnes &&
        other.nome == nome &&
        other.endereco == endereco &&
        other.senha == senha &&
        other.telefone == telefone &&
        other.idPrefeitura == idPrefeitura &&
        other.horario == horario &&
        other.email == email;
  }

  @override
  int get hashCode {
    return cnes.hashCode ^
        nome.hashCode ^
        endereco.hashCode ^
        senha.hashCode ^
        telefone.hashCode ^
        idPrefeitura.hashCode ^
        horario.hashCode ^
        email.hashCode;
  }

  UBS copyWith({
    String? cnes,
    String? nome,
    int? endereco,
    String? senha,
    String? telefone,
    int? idPrefeitura,
    String? horario,
    String? email,
  }) {
    return UBS(
      cnes: cnes ?? this.cnes,
      nome: nome ?? this.nome,
      endereco: endereco ?? this.endereco,
      senha: senha ?? this.senha,
      telefone: telefone ?? this.telefone,
      idPrefeitura: idPrefeitura ?? this.idPrefeitura,
      horario: horario ?? this.horario,
      email: email ?? this.email,
    );
  }

  factory UBS.fromMap(Map<String, dynamic> map) {
    return UBS(
      cnes: map['cnes'] as String,
      nome: map['nome'] as String,
      endereco: map['endereco'] as int,
      senha: map['senha'] as String,
      telefone: map['telefone'] as String,
      idPrefeitura: map['idPrefeitura'] as int,
      horario: map['horario'] as String,
      email: map['email'] as String,
    );
  }

  factory UBS.fromJson(String source) =>
      UBS.fromMap(json.decode(source) as Map<String, dynamic>);
}

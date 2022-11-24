// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UBS {
  final String cnes;
  late final String nome;
  final String endereco;
  final String senha;
  final String telefone;
  final String idPrefeitura;
  final String horario;
  final String email;
  final double latitude;
  final double longitude;
  final String fotoUrl;
  final String vinculo;

  UBS({
    required this.cnes,
    required this.nome,
    required this.endereco,
    required this.senha,
    required this.telefone,
    required this.idPrefeitura,
    required this.horario,
    required this.email,
    required this.latitude,
    required this.longitude,
    required this.fotoUrl,
    required this.vinculo,
  });

  static List<UBS> fromJsons(String str) {
    final list = json.decode(str);

    var users = <UBS>[];

    for (int i = 0; i < list.length; i++) {
      users.add(UBS.fromMap(list[i]));
    }

    return users;
  }

  UBS copyWith({
    String? cnes,
    String? nome,
    String? endereco,
    String? senha,
    String? telefone,
    String? idPrefeitura,
    String? horario,
    String? email,
    double? latitude,
    double? longitude,
    String? fotoUrl,
    String? vinculo,
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
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      fotoUrl: fotoUrl ?? this.fotoUrl,
      vinculo: vinculo ?? this.vinculo,
    );
  }

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
      'latitude': latitude,
      'longitude': longitude,
      'fotoUrl': fotoUrl,
      'vinculo': vinculo,
    };
  }

  factory UBS.fromMap(Map<String, dynamic> map) {
    return UBS(
      cnes: map['cnes'] as String,
      nome: map['nome'] as String,
      endereco: map['endereco'] as String,
      senha: map['senha'] as String,
      telefone: map['telefone'] as String,
      idPrefeitura: map['idPrefeitura'] as String,
      horario: map['horario'] as String,
      email: map['email'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      fotoUrl: map['fotoUrl'] as String,
      vinculo: map['vinculo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UBS.fromJson(String source) =>
      UBS.fromMap(json.decode(source)[0] as Map<String, dynamic>);

  @override
  String toString() {
    return 'UBS(cnes: $cnes, nome: $nome, endereco: $endereco, senha: $senha, telefone: $telefone, idPrefeitura: $idPrefeitura, horario: $horario, email: $email, latitude: $latitude, longitude: $longitude, fotoUrl: $fotoUrl, vinculo: $vinculo)';
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
        other.email == email &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.fotoUrl == fotoUrl &&
        other.vinculo == vinculo;
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
        email.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        fotoUrl.hashCode ^
        vinculo.hashCode;
  }
}

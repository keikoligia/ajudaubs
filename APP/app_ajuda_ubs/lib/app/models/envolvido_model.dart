// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/*create table Envolvido(
idEnvolvido int primary key auto_increment,
nomeEnvolvido varchar(100) not null,
cargoEnvolvido varchar(100) not null,
constraint fkEnvolvidoCargo FOREIGN key (cargoEnvolvido) references CargoArea (nomeCargo)
);*/

class Envolvido {
  late String nomeEnvolvido;
  late String cargoEnvolvido;
  late String idManifestacao;
  Envolvido({
    required this.nomeEnvolvido,
    required this.cargoEnvolvido,
    required this.idManifestacao,
  });

  static List<Envolvido> fromJsons(String str) {
    final list = json.decode(str);

    var users = <Envolvido>[];

    for (int i = 0; i < list.length; i++) {
      users.add(Envolvido.fromMap(list[i]));
    }

    return users;
  }

  Envolvido copyWith({
    String? nomeEnvolvido,
    String? cargoEnvolvido,
    String? idManifestacao,
  }) {
    return Envolvido(
      nomeEnvolvido: nomeEnvolvido ?? this.nomeEnvolvido,
      cargoEnvolvido: cargoEnvolvido ?? this.cargoEnvolvido,
      idManifestacao: idManifestacao ?? this.idManifestacao,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nomeEnvolvido': nomeEnvolvido,
      'cargoEnvolvido': cargoEnvolvido,
      'idManifestacao': idManifestacao,
    };
  }

  factory Envolvido.fromMap(Map<String, dynamic> map) {
    return Envolvido(
        nomeEnvolvido: map['nomeEnvolvido'] as String,
        cargoEnvolvido: map['cargoEnvolvido'] as String,
        idManifestacao: map['idManifestacao'] as String);
  }

  String toJson() => json.encode(toMap());

  factory Envolvido.fromJson(String source) =>
      Envolvido.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Envolvido(nomeEnvolvido: $nomeEnvolvido, cargoEnvolvido: $cargoEnvolvido, idManifestacao: $idManifestacao)';

  @override
  bool operator ==(covariant Envolvido other) {
    if (identical(this, other)) return true;

    return other.nomeEnvolvido == nomeEnvolvido &&
        other.cargoEnvolvido == cargoEnvolvido &&
        other.idManifestacao == idManifestacao;
  }

  @override
  int get hashCode =>
      nomeEnvolvido.hashCode ^
      cargoEnvolvido.hashCode ^
      idManifestacao.hashCode;
}

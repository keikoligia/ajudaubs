import 'dart:convert';

class CargoArea {
  final String nomeCargo;
  final String nomeArea;
  final String descricaoArea;
  CargoArea({
    required this.nomeCargo,
    required this.nomeArea,
    required this.descricaoArea,
  });

  CargoArea copyWith({
    String? nomeCargo,
    String? nomeArea,
    String? descricaoArea,
  }) {
    return CargoArea(
      nomeCargo: nomeCargo ?? this.nomeCargo,
      nomeArea: nomeArea ?? this.nomeArea,
      descricaoArea: descricaoArea ?? this.descricaoArea,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nomeCargo': nomeCargo,
      'nomeArea': nomeArea,
      'descricaoArea': descricaoArea,
    };
  }

  factory CargoArea.fromMap(Map<String, dynamic> map) {
    return CargoArea(
      nomeCargo: map['nomeCargo'] as String,
      nomeArea: map['nomeArea'] as String,
      descricaoArea: map['descricaoArea'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CargoArea.fromJson(String source) =>
      CargoArea.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CargoArea(nomeCargo: $nomeCargo, nomeArea: $nomeArea, descricaoArea: $descricaoArea)';

  @override
  bool operator ==(covariant CargoArea other) {
    if (identical(this, other)) return true;

    return other.nomeCargo == nomeCargo &&
        other.nomeArea == nomeArea &&
        other.descricaoArea == descricaoArea;
  }

  static List<CargoArea> fromJsons(String str) {
    final list = json.decode(str);

    var users = <CargoArea>[];

    for (int i = 0; i < list.length; i++) {
      users.add(CargoArea.fromMap(list[i]));
    }

    return users;
  }

  @override
  int get hashCode =>
      nomeCargo.hashCode ^ nomeArea.hashCode ^ descricaoArea.hashCode;
}

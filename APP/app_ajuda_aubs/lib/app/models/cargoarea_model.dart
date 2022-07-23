// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CargoArea {
  final int idCargoArea;
  final String nomeCargo;
  final String nomeArea;

  CargoArea(
    this.idCargoArea,
    this.nomeCargo,
    this.nomeArea,
  );

  CargoArea copyWith({
    int? idCargoArea,
    String? nomeCargo,
    String? nomeArea,
  }) {
    return CargoArea(
      idCargoArea ?? this.idCargoArea,
      nomeCargo ?? this.nomeCargo,
      nomeArea ?? this.nomeArea,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idCargoArea': idCargoArea,
      'nomeCargo': nomeCargo,
      'nomeArea': nomeArea,
    };
  }

  factory CargoArea.fromMap(Map<String, dynamic> map) {
    return CargoArea(
      map['idCargoArea'] as int,
      map['nomeCargo'] as String,
      map['nomeArea'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CargoArea.fromJson(String source) =>
      CargoArea.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CargoArea(idCargoArea: $idCargoArea, nomeCargo: $nomeCargo, nomeArea: $nomeArea)';

  @override
  bool operator ==(covariant CargoArea other) {
    if (identical(this, other)) return true;

    return other.idCargoArea == idCargoArea &&
        other.nomeCargo == nomeCargo &&
        other.nomeArea == nomeArea;
  }

  @override
  int get hashCode =>
      idCargoArea.hashCode ^ nomeCargo.hashCode ^ nomeArea.hashCode;
}

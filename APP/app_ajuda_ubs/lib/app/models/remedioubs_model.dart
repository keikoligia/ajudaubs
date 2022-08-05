import 'dart:convert';

class RemedioUbs {
  final int idRemedioUbs;
  final int idRemedio;
  final String idUbs;
  final int quantidade;
  final String dataValidade;
  final String dataLote;

  RemedioUbs({
    required this.idRemedioUbs,
    required this.idRemedio,
    required this.idUbs,
    required this.quantidade,
    required this.dataValidade,
    required this.dataLote,
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idRemedioUbs': idRemedioUbs,
      'idRemedio': idRemedio,
      'idUbs': idUbs,
      'quantidade': quantidade,
      'dataValidade': dataValidade,
      'dataLote': dataLote,
    };
  }

  @override
  String toString() {
    return 'RemedioUbs(idRemedioUbs: $idRemedioUbs, idRemedio: $idRemedio,  idUbs: $idUbs, quantidade: $quantidade, dataValidade: $dataValidade, dataLote: $dataLote)';
  }

  factory RemedioUbs.fromMap(Map<String, dynamic> map) {
    return RemedioUbs(
      idRemedioUbs: map['idRemedioUbs'] as int,
      idRemedio: map['idRemedio'] as int,
      idUbs: map['idUbs'] as String,
      quantidade: map['quantidade'] as int,
      dataValidade: map['dataValidade'] as String,
      dataLote: map['dataLote'] as String,
    );
  }

  factory RemedioUbs.fromJson(String source) =>
      RemedioUbs.fromMap(json.decode(source) as Map<String, dynamic>);
}

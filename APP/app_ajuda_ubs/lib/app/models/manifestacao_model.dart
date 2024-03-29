// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Manifestacao {
  late String protocolo;
  late String idUbs;
  late String codigoAcesso;
  late String? idPaciente;
  late String tipo;
  late String status;
  late String? imagem1;
  late String? imagem2;
  late String? imagem3;
  late String descricao;
  late String dataManifestacao;

  Manifestacao({
    required this.protocolo,
    required this.idUbs,
    required this.codigoAcesso,
    required this.idPaciente,
    required this.tipo,
    required this.status,
    required this.imagem1,
    required this.imagem2,
    required this.imagem3,
    required this.descricao,
    required this.dataManifestacao,
  });

  Manifestacao.constructor();

  Manifestacao copyWith({
    String? protocolo,
    String? idUbs,
    String? codigoAcesso,
    String? idPaciente,
    String? tipo,
    String? status,
    String? imagem1,
    String? imagem2,
    String? imagem3,
    String? descricao,
    String? dataManifestacao,
  }) {
    return Manifestacao(
      protocolo: protocolo ?? this.protocolo,
      idUbs: idUbs ?? this.idUbs,
      codigoAcesso: codigoAcesso ?? this.codigoAcesso,
      idPaciente: idPaciente ?? this.idPaciente,
      tipo: tipo ?? this.tipo,
      status: status ?? this.status,
      imagem1: imagem1 ?? this.imagem1,
      imagem2: imagem2 ?? this.imagem2,
      imagem3: imagem3 ?? this.imagem3,
      descricao: descricao ?? this.descricao,
      dataManifestacao: dataManifestacao ?? this.dataManifestacao,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'protocolo': protocolo,
      'idUbs': idUbs,
      'codigoAcesso': codigoAcesso,
      'idPaciente': idPaciente,
      'tipo': tipo,
      'status': status,
      'imagem1': imagem1,
      'imagem2': imagem2,
      'imagem3': imagem3,
      'descricao': descricao,
      'dataManifestacao': dataManifestacao,
    };
  }

  factory Manifestacao.fromMap(Map<String, dynamic> map) {
    return Manifestacao(
      protocolo: map['protocolo'] as String,
      idUbs: map['idUbs'] as String,
      codigoAcesso: map['codigoAcesso'] as String,
      idPaciente: map['idPaciente'] as String?,
      tipo: map['tipo'] as String,
      status: map['status'] as String,
      imagem1: map['imagem1'] as String?,
      imagem2: map['imagem2'] as String?,
      imagem3: map['imagem3'] as String?,
      descricao: map['descricao'] as String,
      dataManifestacao: map['dataManifestacao'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Manifestacao.fromJson(String source) =>
      Manifestacao.fromMap(json.decode(source) as Map<String, dynamic>);

  static List<Manifestacao> fromJsons(String str) {
    final list = json.decode(str);

    var users = <Manifestacao>[];

    for (int i = 0; i < list.length; i++) {
      users.add(Manifestacao.fromMap(list[i]));
    }

    return users;
  }

  @override
  String toString() {
    return 'Manifestacao(protocolo: $protocolo, idUbs: $idUbs, codigoAcesso: $codigoAcesso, idPaciente: $idPaciente, tipo: $tipo, status: $status, imagem1: $imagem1, imagem2: $imagem2, imagem3: $imagem3, descricao: $descricao, dataManifestacao: $dataManifestacao)';
  }

  @override
  bool operator ==(covariant Manifestacao other) {
    if (identical(this, other)) return true;

    return other.protocolo == protocolo &&
        other.idUbs == idUbs &&
        other.codigoAcesso == codigoAcesso &&
        other.idPaciente == idPaciente &&
        other.tipo == tipo &&
        other.status == status &&
        other.imagem1 == imagem1 &&
        other.imagem2 == imagem2 &&
        other.imagem3 == imagem3 &&
        other.descricao == descricao &&
        other.dataManifestacao == dataManifestacao;
  }

  @override
  int get hashCode {
    return protocolo.hashCode ^
        idUbs.hashCode ^
        codigoAcesso.hashCode ^
        idPaciente.hashCode ^
        tipo.hashCode ^
        status.hashCode ^
        imagem1.hashCode ^
        imagem2.hashCode ^
        imagem3.hashCode ^
        descricao.hashCode ^
        dataManifestacao.hashCode;
  }
}

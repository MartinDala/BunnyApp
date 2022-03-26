class listing {
  int? id;
  String? nome;
  String? raca;
  int? ninhada;
  String? cor;
  int? adicionadoPor;
  String? sexo;
  String? tipoSanguineo;
  int? paiId;
  int? maeId;
  String? status;
  String? dataNascimento;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  listing(
      {this.id,
      this.nome,
      this.raca,
      this.ninhada,
      this.cor,
      this.adicionadoPor,
      this.sexo,
      this.tipoSanguineo,
      this.paiId,
      this.maeId,
      this.status,
      this.dataNascimento,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  listing.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    raca = json['raca'];
    ninhada = json['ninhada'];
    cor = json['cor'];
    adicionadoPor = json['adicionado_por'];
    sexo = json['sexo'];
    tipoSanguineo = json['tipo_sanguineo'];
    paiId = json['pai_id'];
    maeId = json['mae_id'];
    status = json['status'];
    dataNascimento = json['data_nascimento'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['raca'] = this.raca;
    data['ninhada'] = this.ninhada;
    data['cor'] = this.cor;
    data['adicionado_por'] = this.adicionadoPor;
    data['sexo'] = this.sexo;
    data['tipo_sanguineo'] = this.tipoSanguineo;
    data['pai_id'] = this.paiId;
    data['mae_id'] = this.maeId;
    data['status'] = this.status;
    data['data_nascimento'] = this.dataNascimento;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

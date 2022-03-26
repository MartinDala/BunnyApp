class AddCoelho {
  String? sexo;
  String? nome;
  String? cor;
  String? adicionadoPor;
  String? dataNascimento;
  String? ninhada;
  String? raca;
  String? status;
  String? paiId;
  String? maeId;
  String? tipoSanguineo;

  AddCoelho(
      {this.sexo,
      this.nome,
      this.cor,
      this.adicionadoPor,
      this.dataNascimento,
      this.ninhada,
      this.raca,
      this.status,
      this.paiId,
      this.maeId,
      this.tipoSanguineo});

  AddCoelho.fromJson(Map<String, dynamic> json) {
    sexo = json['sexo'];
    nome = json['nome'];
    cor = json['cor'];
    adicionadoPor = json['adicionado_por'];
    dataNascimento = json['data_nascimento'];
    ninhada = json['ninhada'];
    raca = json['raca'];
    status = json['status'];
    paiId = json['pai_id'];
    maeId = json['mae_id'];
    tipoSanguineo = json['tipo_sanguineo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sexo'] = this.sexo;
    data['nome'] = this.nome;
    data['cor'] = this.cor;
    data['adicionado_por'] = this.adicionadoPor;
    data['data_nascimento'] = this.dataNascimento;
    data['ninhada'] = this.ninhada;
    data['raca'] = this.raca;
    data['status'] = this.status;
    data['pai_id'] = this.paiId;
    data['mae_id'] = this.maeId;
    data['tipo_sanguineo'] = this.tipoSanguineo;
    return data;
  }
}

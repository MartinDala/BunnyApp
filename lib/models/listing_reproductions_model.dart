class listingreproduction {
  int? id;
  String? nomePai;
  String? nomeMae;
  String? dataColocarNinho;
  String? dataDesmame;
  String? dataProximoCruzamento;
  String? dataRemoverNinho;
  String? dataNascimento;

  listingreproduction(
      {this.id,
      this.nomePai,
      this.nomeMae,
      this.dataColocarNinho,
      this.dataDesmame,
      this.dataProximoCruzamento,
      this.dataRemoverNinho,
      this.dataNascimento});

  listingreproduction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomePai = json['nome_pai'];
    nomeMae = json['nome_mae'];
    dataColocarNinho = json['DataColocarNinho'];
    dataDesmame = json['DataDesmame'];
    dataProximoCruzamento = json['DataProximoCruzamento'];
    dataRemoverNinho = json['DataRemoverNinho'];
    dataNascimento = json['DataNascimento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome_pai'] = this.nomePai;
    data['nome_mae'] = this.nomeMae;
    data['DataColocarNinho'] = this.dataColocarNinho;
    data['DataDesmame'] = this.dataDesmame;
    data['DataProximoCruzamento'] = this.dataProximoCruzamento;
    data['DataRemoverNinho'] = this.dataRemoverNinho;
    data['DataNascimento'] = this.dataNascimento;
    return data;
  }
}

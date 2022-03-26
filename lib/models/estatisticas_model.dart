class estatisticas {
  int? totalCoelhos;
  int? totalAtivos;
  int? totalVendidos;
  int? totalImaturos;
  int? totalAbatidos;
  int? totalMortos;
  int? totalAVenda;
  int? totalPreferidos;

  estatisticas(
      {this.totalCoelhos,
      this.totalAtivos,
      this.totalVendidos,
      this.totalImaturos,
      this.totalAbatidos,
      this.totalMortos,
      this.totalAVenda,
      this.totalPreferidos});

  estatisticas.fromJson(Map<String, dynamic> json) {
    totalCoelhos = json['Total Coelhos'];
    totalAtivos = json['Total ativos'];
    totalVendidos = json['Total Vendidos'];
    totalImaturos = json['Total Imaturos'];
    totalAbatidos = json['Total abatidos'];
    totalMortos = json['Total mortos'];
    totalAVenda = json['Total a venda'];
    totalPreferidos = json['Total preferidos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Total Coelhos'] = this.totalCoelhos;
    data['Total ativos'] = this.totalAtivos;
    data['Total Vendidos'] = this.totalVendidos;
    data['Total Imaturos'] = this.totalImaturos;
    data['Total abatidos'] = this.totalAbatidos;
    data['Total mortos'] = this.totalMortos;
    data['Total a venda'] = this.totalAVenda;
    data['Total preferidos'] = this.totalPreferidos;
    return data;
  }
}

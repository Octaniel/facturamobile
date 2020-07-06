class ProdutoResumo {
	int id;
	String nome;
	String modelo;
	String descricaoTipoProduto;
	double precoVenda;
	bool status;
	String unidade;
	int quantidade;
	String marca;
	String codigo;
	String descTaxa;
  double valorInalteravel;
  bool emPromocao;
	int valorTaxa;

	ProdutoResumo({this.id, this.nome, this.modelo="", this.descricaoTipoProduto, this.precoVenda, this.status, this.unidade, this.quantidade, this.marca="", this.codigo, this.descTaxa="", this.valorInalteravel, this.emPromocao, this.valorTaxa=0});

	ProdutoResumo.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		nome = json['nome'];
		modelo = json['modelo'];
		descricaoTipoProduto = json['descricaoTipoProduto'];
		precoVenda = json['precoVenda'];
		status = json['status'];
		unidade = json['unidade'];
		quantidade = json['quantidade'];
		marca = json['marca'];
		codigo = json['codigo'];
		descTaxa = json['descTaxa'];
    valorInalteravel = json['valorInalteravel'];
    emPromocao = json['emPromocao'];
		valorTaxa = json['valorTaxa'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['nome'] = this.nome;
		data['modelo'] = this.modelo;
		data['descricaoTipoProduto'] = this.descricaoTipoProduto;
		data['precoVenda'] = this.precoVenda;
		data['status'] = this.status;
		data['unidade'] = this.unidade;
		data['quantidade'] = this.quantidade;
		data['marca'] = this.marca;
		data['codigo'] = this.codigo;
		data['descTaxa'] = this.descTaxa;
    data['valorInalteravel'] = this.valorInalteravel;
    data['emPromocao'] = this.emPromocao;
		data['valorTaxa'] = this.valorTaxa;
		return data;
	}
}

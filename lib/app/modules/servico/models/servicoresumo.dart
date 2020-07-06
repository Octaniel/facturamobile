class ServicoResumo {
	int id;
	String nome;
	String descTipoServico;
	double precoVenda;
	bool status;
	String descTaxa;
	String descMotivoIsencao;
	String codigoMotivoIsencao;
	int valorTaxa;

	ServicoResumo({this.id, this.nome, this.descTipoServico, this.precoVenda, this.status, this.descTaxa, this.descMotivoIsencao, this.codigoMotivoIsencao, this.valorTaxa});

	ServicoResumo.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		nome = json['nome'];
		descTipoServico = json['descTipoServico'];
		precoVenda = json['precoVenda'];
		status = json['status'];
		descTaxa = json['descTaxa'];
		descMotivoIsencao = json['descMotivoIsencao'];
		codigoMotivoIsencao = json['codigoMotivoIsencao'];
		valorTaxa = json['valorTaxa'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['nome'] = this.nome;
		data['descTipoServico'] = this.descTipoServico;
		data['precoVenda'] = this.precoVenda;
		data['status'] = this.status;
		data['descTaxa'] = this.descTaxa;
		data['descMotivoIsencao'] = this.descMotivoIsencao;
		data['codigoMotivoIsencao'] = this.codigoMotivoIsencao;
		data['valorTaxa'] = this.valorTaxa;
		return data;
	}
}

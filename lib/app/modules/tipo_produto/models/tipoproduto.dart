class TipoProduto {
	int id;
	String descricao;
	String dataCriacao;
	String dataAlteracao;
	int usuarioCriouId;
	int usuarioAlterouId;
	String natureza;

	TipoProduto({this.id, this.descricao, this.dataCriacao, this.dataAlteracao, this.usuarioCriouId, this.usuarioAlterouId, this.natureza});

	TipoProduto.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		descricao = json['descricao'];
		dataCriacao = json['dataCriacao'];
		dataAlteracao = json['dataAlteracao'];
		usuarioCriouId = json['usuarioCriouId'];
		usuarioAlterouId = json['usuarioAlterouId'];
		natureza = json['natureza'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['descricao'] = this.descricao;
		data['dataCriacao'] = this.dataCriacao;
		data['dataAlteracao'] = this.dataAlteracao;
		data['usuarioCriouId'] = this.usuarioCriouId;
		data['usuarioAlterouId'] = this.usuarioAlterouId;
		data['natureza'] = this.natureza;
		return data;
	}
}

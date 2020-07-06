class Cliente {
	int id;
	String nome;
	String nif;
	String dataCriacao;
	String dataAlteracao;
	int usuarioCriouId;
	int usuarioAlterouId;

	Cliente({this.id, this.nome, this.nif, this.dataCriacao, this.dataAlteracao, this.usuarioCriouId, this.usuarioAlterouId});

	Cliente.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		nome = json['nome'];
		nif = json['nif'];
		dataCriacao = json['dataCriacao'];
		dataAlteracao = json['dataAlteracao'];
		usuarioCriouId = json['usuarioCriouId'];
		usuarioAlterouId = json['usuarioAlterouId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['nome'] = this.nome;
		data['nif'] = this.nif;
		data['dataCriacao'] = this.dataCriacao;
		data['dataAlteracao'] = this.dataAlteracao;
		data['usuarioCriouId'] = this.usuarioCriouId;
		data['usuarioAlterouId'] = this.usuarioAlterouId;
		return data;
	}
}

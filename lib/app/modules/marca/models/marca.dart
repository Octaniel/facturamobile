class Marca {
	int id;
	String nome;
	String dataCriacao;
	String dataAlteracao;
	int usuarioCriouId;
	int usuarioAlterouId;

	Marca({this.id, this.nome, this.dataCriacao, this.dataAlteracao, this.usuarioCriouId, this.usuarioAlterouId});

	Marca.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		nome = json['nome'];
		dataCriacao = json['dataCriacao'];
		dataAlteracao = json['dataAlteracao'];
		usuarioCriouId = json['usuarioCriouId'];
		usuarioAlterouId = json['usuarioAlterouId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['nome'] = this.nome;
		data['dataCriacao'] = this.dataCriacao;
		data['dataAlteracao'] = this.dataAlteracao;
		data['usuarioCriouId'] = this.usuarioCriouId;
		data['usuarioAlterouId'] = this.usuarioAlterouId;
		return data;
	}
}

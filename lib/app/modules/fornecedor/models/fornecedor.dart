class Fornecedor {
	int id;
	String nome;
	String nif;
	String endereco;
	String email;
	String telefone;
	String dataCriacao;
	String dataAlteracao;
	int usuarioCriouId;
	int usuarioAlterouId;

	Fornecedor({this.id, this.nome, this.nif, this.endereco, this.email, this.telefone, this.dataCriacao, this.dataAlteracao, this.usuarioCriouId, this.usuarioAlterouId});

	Fornecedor.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		nome = json['nome'];
		nif = json['nif'];
		endereco = json['endereco'];
		email = json['email'];
		telefone = json['telefone'];
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
		data['endereco'] = this.endereco;
		data['email'] = this.email;
		data['telefone'] = this.telefone;
		data['dataCriacao'] = this.dataCriacao;
		data['dataAlteracao'] = this.dataAlteracao;
		data['usuarioCriouId'] = this.usuarioCriouId;
		data['usuarioAlterouId'] = this.usuarioAlterouId;
		return data;
	}
}

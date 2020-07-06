class Empresa {
	int id;
	String nome;
	String numeroCertificacao;
	String nif;
	String email;
	String endereco;
	String telefone;
	String dataCertificacao;
	String dataCriacao;
	String dataAlteracoa;

	Empresa({this.id, this.nome, this.numeroCertificacao, this.nif, this.email, this.endereco, this.telefone, this.dataCertificacao, this.dataCriacao, this.dataAlteracoa});

	Empresa.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		nome = json['nome'];
		numeroCertificacao = json['numeroCertificacao'];
		nif = json['nif'];
		email = json['email'];
		endereco = json['endereco'];
		telefone = json['telefone'];
		dataCertificacao = json['dataCertificacao'];
		dataCriacao = json['dataCriacao'];
		dataAlteracoa = json['dataAlteracoa'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['nome'] = this.nome;
		data['numeroCertificacao'] = this.numeroCertificacao;
		data['nif'] = this.nif;
		data['email'] = this.email;
		data['endereco'] = this.endereco;
		data['telefone'] = this.telefone;
		data['dataCertificacao'] = this.dataCertificacao;
		data['dataCriacao'] = this.dataCriacao;
		data['dataAlteracoa'] = this.dataAlteracoa;
		return data;
	}
}

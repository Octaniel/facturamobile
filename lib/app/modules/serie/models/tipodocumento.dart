class TipoDocumento {
	int id;
	String descricao;
	String sigla;

	TipoDocumento({this.id, this.descricao, this.sigla});

	TipoDocumento.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		descricao = json['descricao'];
		sigla = json['sigla'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['descricao'] = this.descricao;
		data['sigla'] = this.sigla;
		return data;
	}
}

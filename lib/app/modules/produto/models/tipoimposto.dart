class TipoImposto {
	int id;
	String descricao;
	String sigla;

	TipoImposto({this.id, this.descricao, this.sigla});

	TipoImposto.fromJson(Map<String, dynamic> json) {
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

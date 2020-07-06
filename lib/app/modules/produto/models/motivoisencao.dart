class MotivoIsencao {
	int id;
	String descricao;
	String codigo;

	MotivoIsencao({this.id, this.descricao, this.codigo});

	MotivoIsencao.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		descricao = json['descricao'];
		codigo = json['codigo'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['descricao'] = this.descricao;
		data['codigo'] = this.codigo;
		return data;
	}
}

class ProdutoMins {
	String nomeProduto;
	int quatidadeProduto;

	ProdutoMins({this.nomeProduto, this.quatidadeProduto});

	ProdutoMins.fromJson(Map<String, dynamic> json) {
		nomeProduto = json['nomeProduto'];
		quatidadeProduto = json['quatidadeProduto'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['nomeProduto'] = this.nomeProduto;
		data['quatidadeProduto'] = this.quatidadeProduto;
		return data;
	}
}

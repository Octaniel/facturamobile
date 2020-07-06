import 'package:facturamobile/app/modules/produto/models/tipoimposto.dart';

class Taxa {
	int id;
	TipoImposto tipoImposto;
	String descricao;
	int valor;

	Taxa({this.id, this.tipoImposto, this.descricao, this.valor});

	Taxa.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		tipoImposto = json['tipoImposto'] != null ? new TipoImposto.fromJson(json['tipoImposto']) : null;
		descricao = json['descricao'];
		valor = json['valor'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		if (this.tipoImposto != null) {
      data['tipoImposto'] = this.tipoImposto.toJson();
    }
		data['descricao'] = this.descricao;
		data['valor'] = this.valor;
		return data;
	}
}

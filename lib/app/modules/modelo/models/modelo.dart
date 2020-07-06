
import 'package:facturamobile/app/modules/marca/models/marca.dart';

class Modelo {
	int id;
	String nome;
	Marca marca;
	String dataCriacao;
	String dataAlteracao;
	int usuarioCriouId;
	int usuarioAlterouId;

	Modelo({this.id, this.nome, this.marca, this.dataCriacao, this.dataAlteracao, this.usuarioCriouId, this.usuarioAlterouId});

	Modelo.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		nome = json['nome'];
		marca = json['marca'] != null ? new Marca.fromJson(json['marca']) : null;
		dataCriacao = json['dataCriacao'];
		dataAlteracao = json['dataAlteracao'];
		usuarioCriouId = json['usuarioCriouId'];
		usuarioAlterouId = json['usuarioAlterouId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['nome'] = this.nome;
		if (this.marca != null) {
      data['marca'] = this.marca.toJson();
    }
		data['dataCriacao'] = this.dataCriacao;
		data['dataAlteracao'] = this.dataAlteracao;
		data['usuarioCriouId'] = this.usuarioCriouId;
		data['usuarioAlterouId'] = this.usuarioAlterouId;
		return data;
	}
}

import 'package:facturamobile/app/modules/produto/models/produto.dart';

class Promocao {
	int id;
	String dataInicio;
	String dataFim;
	double valor;
	String dataCriacao;
	String dataAlteracao;
  bool status;
  Produto produto;
	int usuarioCriouId;
	int usuarioAlterouId;

	Promocao({this.id, this.dataInicio, this.dataFim, this.valor, this.dataCriacao, this.dataAlteracao, this.status, this.produto, this.usuarioCriouId, this.usuarioAlterouId});

	Promocao.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		dataInicio = json['dataInicio'];
		dataFim = json['dataFim'];
		valor = json['valor'];
		dataCriacao = json['dataCriacao'];
		dataAlteracao = json['dataAlteracao'];
    status = json['status'];
    produto = json['produto'] != null ? new Produto.fromJson(json['produto']) : null;
		usuarioCriouId = json['usuarioCriouId'];
		usuarioAlterouId = json['usuarioAlterouId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['dataInicio'] = this.dataInicio;
		data['dataFim'] = this.dataFim;
		data['valor'] = this.valor;
		data['dataCriacao'] = this.dataCriacao;
		data['dataAlteracao'] = this.dataAlteracao;
    data['status'] = this.status;
    if (this.produto != null) {
      data['produto'] = this.produto.toJson();
    }
		data['usuarioCriouId'] = this.usuarioCriouId;
		data['usuarioAlterouId'] = this.usuarioAlterouId;
		return data;
	}
}

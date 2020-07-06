import 'package:facturamobile/app/modules/fornecedor/models/fornecedor.dart';
import 'package:facturamobile/app/modules/produto/models/produto.dart';

class Compra {
	int id;
	double valor;
	String observacao;
	Fornecedor fornecedor;
	List<Produto> produtos;
	String data;
	String dataCriacao;
	String dataAlteracao;
	int usuarioCriouId;
	int usuarioAlterouId;

	Compra({this.id, this.valor, this.observacao, this.fornecedor, this.produtos, this.data, this.dataCriacao, this.dataAlteracao, this.usuarioCriouId, this.usuarioAlterouId});

	Compra.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		valor = json['valor'];
		observacao = json['observacao'];
		fornecedor = json['fornecedor'] != null ? new Fornecedor.fromJson(json['fornecedor']) : null;
		if (json['produtos'] != null) {
			produtos = new List<Produto>();
			json['produtos'].forEach((v) { produtos.add(new Produto.fromJson(v)); });
		}
		data = json['data'];
		dataCriacao = json['dataCriacao'];
		dataAlteracao = json['dataAlteracao'];
		usuarioCriouId = json['usuarioCriouId'];
		usuarioAlterouId = json['usuarioAlterouId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['valor'] = this.valor;
		data['observacao'] = this.observacao;
		if (this.fornecedor != null) {
      data['fornecedor'] = this.fornecedor.toJson();
    }
		if (this.produtos!= null) {
      data['produtos'] = this.produtos.map((v) => v.toJson()).toList();
    }
		data['data'] = this.data;
		data['dataCriacao'] = this.dataCriacao;
		data['dataAlteracao'] = this.dataAlteracao;
		data['usuarioCriouId'] = this.usuarioCriouId;
		data['usuarioAlterouId'] = this.usuarioAlterouId;
		return data;
	}
}

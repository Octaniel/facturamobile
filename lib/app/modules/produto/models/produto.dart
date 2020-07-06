import 'package:facturamobile/app/modules/modelo/models/modelo.dart';
import 'package:facturamobile/app/modules/promocao/models/promocao.dart';
import 'package:facturamobile/app/modules/tipo_produto/models/tipoproduto.dart';

import 'motivoisencao.dart';
import "taxa.dart";

class Produto {
	int id;
	String nome;
	int stock;
	TipoProduto tipoProduto;
	Taxa taxa;
	MotivoIsencao motivoIsencao;
	double precoVenda;
	String descricao;
	bool status;
	String natureza;
	String unidade;
	String validade;
	String dataCriacao;
	String dataAlteracao;
	int usuarioCriouId;
	int usuarioAlterouId;
	int quantidadeItem;
	bool emPromocao;
  double valorInalteravel;
	Modelo modelo;
	String codigo;
	int stockMinimo;
	int quantidadeMaximaVenda;

	Produto({this.id, this.nome, this.stock, this.tipoProduto, this.taxa, this.motivoIsencao, this.precoVenda, this.descricao, this.status=false, this.natureza, this.unidade, this.validade, this.dataCriacao, this.dataAlteracao, this.usuarioCriouId, this.usuarioAlterouId, this.quantidadeItem, this.emPromocao, this.valorInalteravel, this.modelo, this.codigo, this.stockMinimo, this.quantidadeMaximaVenda});

	Produto.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		nome = json['nome'];
		stock = json['stock'];
		tipoProduto = json['tipoProduto'] != null ? new TipoProduto.fromJson(json['tipoProduto']) : null;
		taxa = json['taxa'] != null ? new Taxa.fromJson(json['taxa']) : null;
		motivoIsencao = json['motivoIsencao'] != null ? new MotivoIsencao.fromJson(json['motivoIsencao']) : null;
		precoVenda = json['precoVenda'];
		descricao = json['descricao'];
		status = json['status'];
		natureza = json['natureza'];
		unidade = json['unidade'];
		validade = json['validade'];
		dataCriacao = json['dataCriacao'];
		dataAlteracao = json['dataAlteracao'];
		usuarioCriouId = json['usuarioCriouId'];
		usuarioAlterouId = json['usuarioAlterouId'];
		quantidadeItem = json['quantidadeItem'];
		emPromocao = json['emPromocao'];
    valorInalteravel = json['valorInalteravel'];
		modelo = json['modelo'] != null ? new Modelo.fromJson(json['modelo']) : null;
		codigo = json['codigo'];
		stockMinimo = json['stockMinimo'];
		quantidadeMaximaVenda = json['quantidadeMaximaVenda'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['nome'] = this.nome;
		data['stock'] = this.stock;
		if (this.tipoProduto != null) {
      data['tipoProduto'] = this.tipoProduto.toJson();
    }
		if (this.taxa != null) {
      data['taxa'] = this.taxa.toJson();
    }
		if (this.motivoIsencao != null) {
      data['motivoIsencao'] = this.motivoIsencao.toJson();
    }
		data['precoVenda'] = this.precoVenda;
		data['descricao'] = this.descricao;
		data['status'] = this.status;
		data['natureza'] = this.natureza;
		data['unidade'] = this.unidade;
		data['validade'] = this.validade;
		data['dataCriacao'] = this.dataCriacao;
		data['dataAlteracao'] = this.dataAlteracao;
		data['usuarioCriouId'] = this.usuarioCriouId;
		data['usuarioAlterouId'] = this.usuarioAlterouId;
		data['quantidadeItem'] = this.quantidadeItem;
		data['emPromocao'] = this.emPromocao;
    data['valorInalteravel'] = this.valorInalteravel;
		if (this.modelo != null) {
      data['modelo'] = this.modelo.toJson();
    }
		data['codigo'] = this.codigo;
		data['stockMinimo'] = this.stockMinimo;
		data['quantidadeMaximaVenda'] = this.quantidadeMaximaVenda;
		return data;
	}
}
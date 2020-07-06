import 'package:facturamobile/app/modules/compra/models/produtomins.dart';

class CompraResumo {
	int id;
	String nomeFornecedor;
	List<ProdutoMins> produtoMins;
	double valor;
	String data;
	String dataCriacao;

	CompraResumo({this.id, this.nomeFornecedor, this.produtoMins, this.valor, this.data, this.dataCriacao});

	CompraResumo.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		nomeFornecedor = json['nomeFornecedor'];
		if (json['produtoMins'] != null) {
			produtoMins = new List<ProdutoMins>();
			json['produtoMins'].forEach((v) { produtoMins.add(new ProdutoMins.fromJson(v)); });
		}
		valor = json['valor'];
		data = json['data'];
		dataCriacao = json['dataCriacao'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['nomeFornecedor'] = this.nomeFornecedor;
		if (this.produtoMins!= null) {
      data['produtoMins'] = this.produtoMins.map((v) => v.toJson()).toList();
    }
		data['valor'] = this.valor;
		data['data'] = this.data;
		data['dataCriacao'] = this.dataCriacao;
		return data;
	}
}

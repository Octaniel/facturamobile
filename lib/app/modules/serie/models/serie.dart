
import 'package:facturamobile/app/modules/serie/models/tipodocumento.dart';

class Serie {
	int id;
	TipoDocumento tipoDocumento;
	String numero;
	String numeroAutorizacao;
	String dataCriacao;
	String dataAlteracao;
	int usuarioCriouId;
	int usuarioAlterouId;
	int ano;
	bool preDefinida;

	Serie({this.id, this.tipoDocumento, this.numero, this.numeroAutorizacao, this.dataCriacao, this.dataAlteracao, this.usuarioCriouId, this.usuarioAlterouId, this.ano, this.preDefinida});

	Serie.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		tipoDocumento = json['tipoDocumento'] != null ? new TipoDocumento.fromJson(json['tipoDocumento']) : null;
		numero = json['numero'];
		numeroAutorizacao = json['numeroAutorizacao'];
		dataCriacao = json['dataCriacao'];
		dataAlteracao = json['dataAlteracao'];
		usuarioCriouId = json['usuarioCriouId'];
		usuarioAlterouId = json['usuarioAlterouId'];
		ano = json['ano'];
		preDefinida = json['preDefinida'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		if (this.tipoDocumento != null) {
      data['tipoDocumento'] = this.tipoDocumento.toJson();
    }
		data['numero'] = this.numero;
		data['numeroAutorizacao'] = this.numeroAutorizacao;
		data['dataCriacao'] = this.dataCriacao;
		data['dataAlteracao'] = this.dataAlteracao;
		data['usuarioCriouId'] = this.usuarioCriouId;
		data['usuarioAlterouId'] = this.usuarioAlterouId;
		data['ano'] = this.ano;
		data['preDefinida'] = this.preDefinida;
		return data;
	}
}

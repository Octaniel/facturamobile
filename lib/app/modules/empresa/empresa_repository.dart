import 'dart:convert';

import 'package:facturamobile/app/modules/empresa/models/empresa.dart';
import 'package:facturamobile/app/res/app_theme.dart';
import 'package:facturamobile/app/res/fatura_http.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EmpresaRepository extends Disposable {
  final http = FaturaHttp();
  Future<List<Object>> criar(Empresa empresa) async {
    List<Object> olist = List();
    var encode = jsonEncode(empresa);
    var post = await http.post("${faturaUrl}empresa",
        body: encode,
        headers: <String, String>{"Content-Type": "application/json"});
    if (post.statusCode == 201)
      olist.insert(0, true);
    else {
      List decode = jsonDecode(post.body);
      olist.insert(0, false);
      decode.forEach((f) {
        olist.insert(1, f["mensagemUsuario"]);
      });
    }
    return olist;
  }

  Future<List<Empresa>> read() async {
    final response = await http.get("${faturaUrl}empresa?&page=0&size=10000",
        headers: <String, String>{"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      List<Empresa> clienteList = List();
      var decode = await jsonDecode(response.body);
      List decode2 = await decode["content"];
      decode2.forEach((f) {
        var cliente = Empresa.fromJson(f);
        clienteList.add(cliente);
      });
      return clienteList;
    }
    return List<Empresa>();
  }

  

  Future<List<Object>> atualizar(Empresa empresa) async {
    List<Object> olist = List();
    var encode = jsonEncode(empresa);
    var post = await http.put("${faturaUrl}empresa/${empresa.id}",
        body: encode,
        headers: <String, String>{"Content-Type": "application/json"});
    print(post.statusCode);
    if (post.statusCode == 200)
      olist.insert(0, true);
    else {
      List decode = jsonDecode(post.body);
      olist.insert(0, false);
      decode.forEach((f) {
        olist.insert(1, f["mensagemUsuario"]);
      });
    }
    return olist;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}

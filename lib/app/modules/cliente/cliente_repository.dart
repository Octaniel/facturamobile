import 'dart:convert';

import 'package:facturamobile/app/modules/cliente/models/cliente.dart';
import 'package:facturamobile/app/res/app_theme.dart';
import 'package:facturamobile/app/res/fatura_http.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ClienteRepository extends Disposable {

 final http = FaturaHttp();

  Future<List<Cliente>> read(int idEmpresa) async {
    final response =
        await http.get("${faturaUrl}cliente?idEmpresa=$idEmpresa&page=0&size=10000",headers: <String,String>{
          "Content-Type":"application/json"
        });
        if(response.statusCode==200){
          List<Cliente> clienteList = List();
          var decode = await jsonDecode(response.body);
          List decode2 = await decode["content"];
          decode2.forEach((f){
            var cliente = Cliente.fromJson(f);
            clienteList.add(cliente);
          });
          return clienteList;
        }
    return List<Cliente>();
  }

  Future<List<Object>> criar(Cliente cliente)async{
    List<Object> olist=List();
    var encode = jsonEncode(cliente);
    var post = await http.post("${faturaUrl}cliente",body: encode,headers: <String,String>{
          "Content-Type":"application/json"
        });
    if(post.statusCode==201) olist.insert(0,true);
    else{
      List decode = jsonDecode(post.body);
    olist.insert(0,false);
    decode.forEach((f){
      olist.insert(1,f["mensagemUsuario"]);
    });
    }
    return olist;
  }

  Future<List<Object>> atualizar(Cliente cliente)async{
    List<Object> olist=List();
    var encode = jsonEncode(cliente);
    var post = await http.put("${faturaUrl}cliente/${cliente.id}",body: encode,headers: <String,String>{
          "Content-Type":"application/json"
        });
        print(post.statusCode);
    if(post.statusCode==200) olist.insert(0,true);
    else{
      List decode = jsonDecode(post.body);
    olist.insert(0,false);
    decode.forEach((f){
      olist.insert(1,f["mensagemUsuario"]);
    });
    }
    return olist;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}

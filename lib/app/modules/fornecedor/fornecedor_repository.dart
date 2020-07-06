import 'dart:convert';

import 'package:facturamobile/app/modules/fornecedor/models/fornecedor.dart';
import 'package:facturamobile/app/res/app_theme.dart';
import 'package:facturamobile/app/res/fatura_http.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FornecedorRepository extends Disposable {
  
 final http = FaturaHttp();

  Future<List<Fornecedor>> read(int idEmpresa) async {
    final response =
        await http.get("${faturaUrl}fornecedor?idEmpresa=$idEmpresa&page=0&size=10000",headers: <String,String>{
          "Content-Type":"application/json"
        });
        if(response.statusCode==200){
          List<Fornecedor> clienteList = List();
          var decode = await jsonDecode(response.body);
          List decode2 = await decode["content"];
          decode2.forEach((f){
            var cliente = Fornecedor.fromJson(f);
            clienteList.add(cliente);
          });
          return clienteList;
        }
    return List<Fornecedor>();
  }

  Future<List<Object>> criar(Fornecedor fornecedor)async{
    List<Object> olist=List();
    var encode = jsonEncode(fornecedor);
    var post = await http.post("${faturaUrl}fornecedor",body: encode,headers: <String,String>{
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

  Future<List<Object>> atualizar(Fornecedor fornecedor)async{
    List<Object> olist=List();
    var encode = jsonEncode(fornecedor);
    var post = await http.put("${faturaUrl}fornecedor/${fornecedor.id}",body: encode,headers: <String,String>{
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

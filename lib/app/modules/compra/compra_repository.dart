import 'dart:convert';

import 'package:facturamobile/app/modules/compra/models/compra.dart';
import 'package:facturamobile/app/modules/compra/models/compraresumo.dart';
import 'package:facturamobile/app/res/app_theme.dart';
import 'package:facturamobile/app/res/fatura_http.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CompraRepository extends Disposable {
 
 final http = FaturaHttp();

  Future<List<CompraResumo>> read(int idEmpresa) async {
    final response =
        await http.get("${faturaUrl}compra?idEmpresa=$idEmpresa&page=0&size=10000",headers: <String,String>{
          "Content-Type":"application/json"
        });
        if(response.statusCode==200){
          List<CompraResumo> produtoList = List();
          var decode = await jsonDecode(response.body);
          List decode2 = await decode["content"];
          decode2.forEach((f){
            var cliente = CompraResumo.fromJson(f);
            produtoList.add(cliente);
          });
          return produtoList;
        }
    return List<CompraResumo>();
  }

  Future<Compra> readbyId(int idProduto) async {
    final response =
        await http.get("${faturaUrl}compra/$idProduto",headers: <String,String>{
          "Content-Type":"application/json"
        });
        if(response.statusCode==200){
          var decode = await jsonDecode(response.body);
            return Compra.fromJson(decode);
        }
    return Compra();
  }

  Future<List<Object>> criar(Compra produto)async{
    List<Object> olist=List();
    var encode = jsonEncode(produto);
    var post = await http.post("${faturaUrl}compra",body: encode,headers: <String,String>{
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

  Future<List<Object>> atualizar(Compra produto)async{
    List<Object> olist=List();
    var encode = jsonEncode(produto);
    var post = await http.put("${faturaUrl}compra/${produto.id}",body: encode,headers: <String,String>{
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

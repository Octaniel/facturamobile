import 'dart:convert';

import 'package:facturamobile/app/modules/produto/models/produto.dart';
import 'package:facturamobile/app/modules/produto/models/produtoresumo.dart';
import 'package:facturamobile/app/modules/produto/models/taxa.dart';
import 'package:facturamobile/app/res/app_theme.dart';
import 'package:facturamobile/app/res/fatura_http.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProdutoRepository extends Disposable {
 
 final http = FaturaHttp();

  Future<List<ProdutoResumo>> read(int idEmpresa) async {
    final response =
        await http.get("${faturaUrl}produto?idEmpresa=$idEmpresa&page=0&size=10000&natureza=PRODUTO",headers: <String,String>{
          "Content-Type":"application/json"
        });
        if(response.statusCode==200){
          List<ProdutoResumo> produtoList = List();
          var decode = await jsonDecode(response.body);
          List decode2 = await decode["content"];
          decode2.forEach((f){
            var cliente = ProdutoResumo.fromJson(f);
            produtoList.add(cliente);
          });
          return produtoList;
        }
    return List<ProdutoResumo>();
  }

   Future<List<Taxa>> readTaxa(int idEmpresa) async {
    final response =
        await http.get("${faturaUrl}produto/taxa",headers: <String,String>{
          "Content-Type":"application/json"
        });
        if(response.statusCode==200){
          List<Taxa> produtoList = List();
          List decode = await jsonDecode(response.body);
          decode.forEach((f){
            var cliente = Taxa.fromJson(f);
            produtoList.add(cliente);
          });
          return produtoList;
        }
    return List<Taxa>();
  }

  Future<Produto> readbyId(int idProduto) async {
    final response =
        await http.get("${faturaUrl}produto/$idProduto",headers: <String,String>{
          "Content-Type":"application/json"
        });
        if(response.statusCode==200){
          var decode = await jsonDecode(response.body);
            return Produto.fromJson(decode);
        }
    return Produto();
  }

  Future<List<Object>> criar(Produto produto)async{
    List<Object> olist=List();
    var encode = jsonEncode(produto);
    var post = await http.post("${faturaUrl}produto",body: encode,headers: <String,String>{
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

  Future<List<Object>> atualizar(Produto produto)async{
    List<Object> olist=List();
    var encode = jsonEncode(produto);
    var post = await http.put("${faturaUrl}produto/${produto.id}",body: encode,headers: <String,String>{
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

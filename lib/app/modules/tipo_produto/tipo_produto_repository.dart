import 'dart:convert';

import 'package:facturamobile/app/res/app_theme.dart';
import 'package:facturamobile/app/res/fatura_http.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'models/tipoproduto.dart';
class TipoProdutoRepository extends Disposable {
final http = FaturaHttp();

  Future<List<TipoProduto>> read(int idEmpresa,String natureza) async {
    final response =
        await http.get("${faturaUrl}tipoProduto/listar?idEmpresa=$idEmpresa&natureza=$natureza",headers: <String,String>{
          "Content-Type":"application/json"
        });
        if(response.statusCode==200){
          List<TipoProduto> produtoList = List();
          List decode = await jsonDecode(response.body);
          decode.forEach((f){
            var cliente = TipoProduto.fromJson(f);
            produtoList.add(cliente);
          });
          return produtoList;
        }
    return List<TipoProduto>();
  }

  Future<List<Object>> criar(TipoProduto fornecedor)async{
    List<Object> olist=List();
    var encode = jsonEncode(fornecedor);
    var post = await http.post("${faturaUrl}tipoProduto",body: encode,headers: <String,String>{
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

  Future<List<Object>> atualizar(TipoProduto fornecedor)async{
    List<Object> olist=List();
    var encode = jsonEncode(fornecedor);
    var post = await http.put("${faturaUrl}tipoProduto/${fornecedor.id}",body: encode,headers: <String,String>{
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

  @override
  void dispose() {}
}

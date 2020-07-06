import 'dart:convert';

import 'package:facturamobile/app/modules/modelo/models/modelo.dart';
import 'package:facturamobile/app/res/app_theme.dart';
import 'package:facturamobile/app/res/fatura_http.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ModeloRepository extends Disposable {

final http = FaturaHttp();

 Future<List<Modelo>> read(int idEmpresa) async {
    final response =
        await http.get("${faturaUrl}modelo/listar?idEmpresa=$idEmpresa",headers: <String,String>{
          "Content-Type":"application/json"
        });
        if(response.statusCode==200){
          List<Modelo> clienteList = List();
          List decode2 = await jsonDecode(response.body);
          decode2.forEach((f){
            var cliente = Modelo.fromJson(f);
            clienteList.add(cliente);
          });
          return clienteList;
        }
    return List<Modelo>();
  }

  Future<List<Object>> criar(Modelo fornecedor)async{
    List<Object> olist=List();
    var encode = jsonEncode(fornecedor);
    var post = await http.post("${faturaUrl}modelo",body: encode,headers: <String,String>{
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

  Future<List<Object>> atualizar(Modelo fornecedor)async{
    List<Object> olist=List();
    var encode = jsonEncode(fornecedor);
    var post = await http.put("${faturaUrl}modelo/${fornecedor.id}",body: encode,headers: <String,String>{
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

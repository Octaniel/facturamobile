import 'dart:convert';

import 'package:facturamobile/app/res/app_theme.dart';
import 'package:facturamobile/app/res/fatura_http.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class SegurancaRepository extends Disposable {
  final storage = FlutterSecureStorage();

  Future<bool> fetchPost(String senha, String email) async {
    String login =
        "username=$email&password=$senha&grant_type=password";
    final response = await http.post("${faturaUrl}oauth/token",
        headers: <String, String>{
             "Content-Type":"application/x-www-form-urlencoded",
            "Authorization": "Basic YW5ndWxhcjpAbmd1bEByMA==",
            "bmobile": " ",
          },
        body: login);
    
    if (response.statusCode == 200) {
          var decode = jsonDecode(response.body);
          storage.write(key: "nomeUsuario", value: decode["nome"]);
          storage.write(key: "idUsuario", value: decode["idUsuario"].toString());
          storage.write(key: "idEmpresa", value: decode["empresa"]["id"].toString());
          storage.write(key: "access_token", value: decode["access_token"]);
    storage.write(key: "date_expires_in", value: DateTime.now().toString());
    storage.write(
        key: "expires_in", value: decode["expires_in"].toString());
    storage.write(
        key: "refresh_token", value: decode["refresh_token"].toString());
      return true;
    }
    return false;
  }

  Future<bool> logout()async{
  final httpfat = FaturaHttp();
  var response = await httpfat.delete("${faturaUrl}tokens/revoke");
  if(response.statusCode==204){
   await storage.deleteAll();
    return true;
  }
    return false;
  }

  Future accsessTokenExpirado() async {
    var read = await storage.read(key: "date_expires_in");
    var read1 = await storage.read(key: "expires_in");
    if(read==null) return true;
    var date = DateTime.parse(read);
    int i = int.parse(read1);
    date = date.add(Duration(seconds: i));
    if (date.isAfter(DateTime.now())) {
      return false;
    }
    return true;
  }

  Future refreshToken() async {
    var read1 = await storage.read(key: "refresh_token");
    var response = await http.post("${faturaUrl}oauth/token",
       headers: <String, String>{
             "Content-Type":"application/x-www-form-urlencoded",
            "Authorization": "Basic YW5ndWxhcjpAbmd1bEByMA==",
          },
        body: <String, String>{
          "grant_type": "refresh_token",
          "refresh_token": read1==null?"":read1
        });
        if(response.statusCode==200){
          var decode = jsonDecode(response.body);
    storage.write(key: "access_token", value: decode["access_token"]);
    storage.write(key: "date_expires_in", value: DateTime.now().toString());
    storage.write(
        key: "expires_in", value: decode["expires_in"].toString());
        }
  }

  Future verificarERenovarToken()async{
    if(await accsessTokenExpirado()){
      await refreshToken();
      if(await accsessTokenExpirado()){
        return false;
      }
    }
    return true;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}

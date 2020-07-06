import 'package:facturamobile/app/modules/marca/marca_repository.dart';
import 'package:facturamobile/app/modules/marca/models/marca.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobx/mobx.dart';

part 'marca_controller.g.dart';

class MarcaController = _MarcaControllerBase with _$MarcaController;

abstract class _MarcaControllerBase with Store {
 final repository = MarcaRepository();
final storage = FlutterSecureStorage();

@observable
var marca = Marca();

final List<String> items = <String>['Octaniel', 'Augusta', 'José'];
final List<String> item = <String>['','1', '2', '3'];

@observable
String selectedItem;
@observable
String valueDrop;

@action
  Future<List<Object>> create()async {
    var read = await storage.read(key: "idUsuario");
    marca.usuarioCriouId = int.parse(read);
    marca.usuarioAlterouId = int.parse(read);
   return await repository.criar(marca);
  }
  @action
  Future<List<Marca>> read()async{
    var read = await storage.read(key: "idEmpresa");
   return await repository.read(int.parse(read));
  }

  @action
  Future<List<Object>> update()async{
    var read = await storage.read(key: "idUsuario");
    marca.usuarioCriouId = int.parse(read);
    marca.usuarioAlterouId = int.parse(read);
    marca.dataAlteracao = null;
    marca.dataCriacao = null;
   return await repository.atualizar(marca);
  }

}

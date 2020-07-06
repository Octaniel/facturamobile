import 'package:facturamobile/app/modules/cliente/cliente_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobx/mobx.dart';

import 'models/cliente.dart';

part 'cliente_controller.g.dart';

class ClienteController = _ClienteControllerBase with _$ClienteController;

abstract class _ClienteControllerBase with Store {

final repository = ClienteRepository();
final storage = FlutterSecureStorage();

  @observable
  String nome="";
  @observable
  String nif="";
  @observable
  int id;

  @action
  Future<List<Object>> create()async {
    var read = await storage.read(key: "idUsuario");
    var cliente = Cliente(nome: nome,nif: nif,usuarioAlterouId: int.parse(read),usuarioCriouId: int.parse(read));
   return await repository.criar(cliente);
  }
  @action
  Future<List<Cliente>> read()async{
    var read = await storage.read(key: "idEmpresa");
   return await repository.read(int.parse(read));
  }

  @action
  Future<List<Object>> update()async{
    var read = await storage.read(key: "idUsuario");
    var cliente = Cliente(id: id,nome: nome,nif: nif,usuarioAlterouId: int.parse(read),usuarioCriouId: int.parse(read));
   return await repository.atualizar(cliente);
  }

  @action
  void setId(int id){
    this.id=id;
  }

  @action
  void setNome(String nome){
    this.nome = nome;
  }

  @action
  void setNif(String nif){
    this.nif = nif;
  }
}

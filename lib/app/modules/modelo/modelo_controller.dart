import 'package:facturamobile/app/modules/marca/marca_repository.dart';
import 'package:facturamobile/app/modules/marca/models/marca.dart';
import 'package:facturamobile/app/modules/modelo/modelo_repository.dart';
import 'package:facturamobile/app/modules/modelo/models/modelo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobx/mobx.dart';

part 'modelo_controller.g.dart';

class ModeloController = _ModeloControllerBase with _$ModeloController;

abstract class _ModeloControllerBase with Store {
   final repository = ModeloRepository();
   final repositoryMarca = MarcaRepository();
final storage = FlutterSecureStorage();

@observable
var modelo = Modelo();

List<String> marcas = List();
final List<int> marcasId = List();

@observable
String selectedItem;
@observable
int selectedItemId;

@action
  Future<List<Object>> create()async {
    var read = await storage.read(key: "idUsuario");
    modelo.usuarioCriouId = int.parse(read);
    modelo.usuarioAlterouId = int.parse(read);
    modelo.marca = Marca(id: selectedItemId);
   return await repository.criar(modelo);
  }
  @action
  Future<List<Modelo>> read()async{
    var read = await storage.read(key: "idEmpresa");
   return await repository.read(int.parse(read));
  }

  @action
  Future readMarca()async{
    var read = await storage.read(key: "idEmpresa");
   List<Marca> list = await repositoryMarca.read(int.parse(read));
   print(list.length);
   marcas.clear();
   marcasId.clear();
   list.forEach((f){
     marcas.add(f.nome);
     marcasId.add(f.id);
   });
   return true;
  }

  @action
  Future<List<Object>> update()async{
    var read = await storage.read(key: "idUsuario");
    modelo.usuarioCriouId = int.parse(read);
    modelo.usuarioAlterouId = int.parse(read);
    modelo.marca.id = selectedItemId;
    modelo.dataAlteracao = null;
    modelo.dataCriacao = null;
   return await repository.atualizar(modelo);
  }

}

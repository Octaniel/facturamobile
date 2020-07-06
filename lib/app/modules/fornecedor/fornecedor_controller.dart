import 'package:facturamobile/app/modules/fornecedor/fornecedor_repository.dart';
import 'package:facturamobile/app/modules/fornecedor/models/fornecedor.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobx/mobx.dart';

part 'fornecedor_controller.g.dart';

class FornecedorController = _FornecedorControllerBase
    with _$FornecedorController;

abstract class _FornecedorControllerBase with Store {
 final repository = FornecedorRepository();
final storage = FlutterSecureStorage();

@observable
var fornecedor = Fornecedor();

final List<String> items = <String>['Octaniel', 'Augusta', 'José'];
final List<String> item = <String>['','1', '2', '3'];

@observable
String selectedItem;
@observable
String valueDrop;

@action
  Future<List<Object>> create()async {
    var read = await storage.read(key: "idUsuario");
    fornecedor.usuarioCriouId = int.parse(read);
    fornecedor.usuarioAlterouId = int.parse(read);
   return await repository.criar(fornecedor);
  }
  @action
  Future<List<Fornecedor>> read()async{
    var read = await storage.read(key: "idEmpresa");
   return await repository.read(int.parse(read));
  }

  @action
  Future<List<Object>> update()async{
    var read = await storage.read(key: "idUsuario");
    fornecedor.usuarioCriouId = int.parse(read);
    fornecedor.usuarioAlterouId = int.parse(read);
   return await repository.atualizar(fornecedor);
  }

}

import 'package:facturamobile/app/modules/empresa/empresa_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobx/mobx.dart';

import 'models/empresa.dart';

part 'empresa_controller.g.dart';

class EmpresaController = _EmpresaControllerBase with _$EmpresaController;

abstract class _EmpresaControllerBase with Store {
  final repository = EmpresaRepository();
final storage = FlutterSecureStorage();

  @observable
  var empresa = Empresa();

@action
  Future<List<Object>> create()async {
   return await repository.criar(empresa);
  }
  @action
  Future<List<Empresa>> read()async{
   return await repository.read();
  }

  @action
  Future<List<Object>> update()async{
   return await repository.atualizar(empresa);
  }
 
}

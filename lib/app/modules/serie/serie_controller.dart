import 'package:facturamobile/app/modules/serie/models/tipodocumento.dart';
import 'package:facturamobile/app/modules/serie/serie_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobx/mobx.dart';

import 'models/serie.dart';

part 'serie_controller.g.dart';

class SerieController = _SerieControllerBase with _$SerieController;

abstract class _SerieControllerBase with Store {
 final repository = SerieRepository();
final storage = FlutterSecureStorage();

@observable
var date = DateTime.now();

@observable
var serie = Serie();

List<String> tiposDocumento = List();
final List<int> tiposDocumentoId = List();

@observable
String selectedItem;
@observable
int selectedItemId;

@action
  Future<List<Object>> create()async {
    var read = await storage.read(key: "idUsuario");
    serie.usuarioCriouId = int.parse(read);
    serie.usuarioAlterouId = int.parse(read);
    serie.tipoDocumento = TipoDocumento(id: selectedItemId);
    serie.ano = date.year;
   return await repository.criar(serie);
  }
  @action
  Future<List<Serie>> read()async{
    var read = await storage.read(key: "idEmpresa");
   return await repository.read(int.parse(read));
  }

  @action
  Future readTipoDocumento()async{
   List<TipoDocumento> list = await repository.readTipoDocumento();
   tiposDocumento.clear();
   tiposDocumentoId.clear();
   list.forEach((f){
     tiposDocumento.add(f.descricao);
     tiposDocumentoId.add(f.id);
   });
   return true;
  }

  @action
  Future<List<Object>> update()async{
    var read = await storage.read(key: "idUsuario");
    serie.usuarioCriouId = int.parse(read);
    serie.usuarioAlterouId = int.parse(read);
    serie.tipoDocumento.id = selectedItemId;
    serie.dataAlteracao = null;
    serie.dataCriacao = null;
    serie.ano = date.year;
   return await repository.atualizar(serie);
  }

}

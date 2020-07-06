import 'package:facturamobile/app/modules/tipo_produto/models/tipoproduto.dart';
import 'package:facturamobile/app/modules/tipo_produto/tipo_produto_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobx/mobx.dart';

part 'tipo_produto_controller.g.dart';

class TipoProdutoController = _TipoProdutoControllerBase
    with _$TipoProdutoController;

abstract class _TipoProdutoControllerBase with Store {
 final repository = TipoProdutoRepository();
final storage = FlutterSecureStorage();

@observable
var tipoProduto = TipoProduto();

@action
  Future<List<Object>> create(String natureza)async {
    var read = await storage.read(key: "idUsuario");
    tipoProduto.usuarioCriouId = int.parse(read);
    tipoProduto.usuarioAlterouId = int.parse(read);
    tipoProduto.natureza = natureza;
   return await repository.criar(tipoProduto);
  }
  @action
  Future<List<TipoProduto>> read(String natureza)async{
    var read = await storage.read(key: "idEmpresa");
   return await repository.read(int.parse(read),natureza);
  }

  @action
  Future<List<Object>> update()async{
    var read = await storage.read(key: "idUsuario");
    tipoProduto.usuarioCriouId = int.parse(read);
    tipoProduto.usuarioAlterouId = int.parse(read);
    tipoProduto.dataAlteracao = null;
    tipoProduto.dataCriacao = null;
   return await repository.atualizar(tipoProduto);
  }

}

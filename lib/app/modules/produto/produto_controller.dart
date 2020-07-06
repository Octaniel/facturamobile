import 'package:facturamobile/app/modules/modelo/modelo_repository.dart';
import 'package:facturamobile/app/modules/modelo/models/modelo.dart';
import 'package:facturamobile/app/modules/produto/produto_repository.dart';
import 'package:facturamobile/app/modules/tipo_produto/models/tipoproduto.dart';
import 'package:facturamobile/app/modules/tipo_produto/tipo_produto_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobx/mobx.dart';

import 'models/produto.dart';
import 'models/produtoresumo.dart';

part 'produto_controller.g.dart';

class ProdutoController = _ProdutoControllerBase with _$ProdutoController;

abstract class _ProdutoControllerBase with Store {
 final repository = ProdutoRepository();
 final repositoryTipoProduto = TipoProdutoRepository();
 final repositoryModelo = ModeloRepository();
final storage = FlutterSecureStorage();

@observable
var produto = Produto();

List<String> tipoProduto = List();
final List<int> tipoProdutoId = List();

List<String> modelos = List();
final List<int> modelosId = List();

@observable
String selectedItem;
@observable
int selectedItemId;

@observable
String selectedItemM;
@observable
int selectedItemMId;
@observable
bool value=false;

@action
  Future<List<Object>> create()async {
    var read = await storage.read(key: "idUsuario");
    produto.usuarioCriouId = int.parse(read);
    produto.usuarioAlterouId = int.parse(read);
    produto.tipoProduto = TipoProduto(id: selectedItemId);
    produto.modelo = Modelo(id: selectedItemMId);
    produto.natureza = "PRODUTO";
   return await repository.criar(produto);
  }

  @action
  Future<List<ProdutoResumo>> read()async{
    var read = await storage.read(key: "idEmpresa");
   return await repository.read(int.parse(read));
  }

  @action
  Future readTipoProduto()async{
    await readModelo();
    var read = await storage.read(key: "idEmpresa");
   List<TipoProduto> list = await repositoryTipoProduto.read(int.parse(read),"PRODUTO");
   tipoProduto.clear();
   tipoProdutoId.clear();
   list.forEach((f){
     tipoProduto.add(f.descricao);
     tipoProdutoId.add(f.id);
   });
   return true;
  }

  @action
  Future readModelo()async{
    var read = await storage.read(key: "idEmpresa");
   List<Modelo> list = await repositoryModelo.read(int.parse(read));
   modelos.clear();
   modelosId.clear();
   list.forEach((f){
     modelos.add(f.nome);
     modelosId.add(f.id);
   });
   return true;
  }


  @action
  Future<Produto> readbyId(int idProduto)async{
    await readTipoProduto();
   return await repository.readbyId(idProduto);
  }

  @action
  Future<List<Object>> update()async{
    var read = await storage.read(key: "idUsuario");
    produto.usuarioCriouId = int.parse(read);
    produto.usuarioAlterouId = int.parse(read);
    produto.tipoProduto.id = selectedItemId;
    produto.modelo.id = selectedItemMId;
   return await repository.atualizar(produto);
  }

}

import 'package:facturamobile/app/modules/modelo/modelo_repository.dart';
import 'package:facturamobile/app/modules/modelo/models/modelo.dart';
import 'package:facturamobile/app/modules/produto/models/motivoisencao.dart';
import 'package:facturamobile/app/modules/produto/models/produto.dart';
import 'package:facturamobile/app/modules/produto/models/produtoresumo.dart';
import 'package:facturamobile/app/modules/produto/models/taxa.dart';
import 'package:facturamobile/app/modules/produto/produto_repository.dart';
import 'package:facturamobile/app/modules/servico/servico_repository.dart';
import 'package:facturamobile/app/modules/tipo_produto/models/tipoproduto.dart';
import 'package:facturamobile/app/modules/tipo_produto/tipo_produto_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobx/mobx.dart';

import 'models/servicoresumo.dart';

part 'servico_controller.g.dart';

class ServicoController = _ServicoControllerBase with _$ServicoController;

abstract class _ServicoControllerBase with Store {
  final repository = ServicoRepository();
 final repositoryTipoProduto = TipoProdutoRepository();
final storage = FlutterSecureStorage();

@observable
var produto = Produto();

List<String> tipoProduto = List();
final List<int> tipoProdutoId = List();

List<String> taxas = List();
final List<int> taxasId = List();


List<String> motivosIsencao = List();
final List<int> motivosIsencaoId = List();

@observable
String selectedItem;
@observable
int selectedItemId;

@observable
String selectedItemT;
@observable
int selectedItemTId;


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
    produto.taxa = Taxa(id: selectedItemTId);
    produto.motivoIsencao = MotivoIsencao(id: selectedItemMId);
    produto.natureza = "SERVICO";
   return await repository.criar(produto);
  }

  @action
  Future<List<ServicoResumo>> read()async{
    var read = await storage.read(key: "idEmpresa");
   return await repository.read(int.parse(read));
  }

  @action
  Future readTipoProduto()async{
    await readTaxa();
    var read = await storage.read(key: "idEmpresa");
   List<TipoProduto> list = await repositoryTipoProduto.read(int.parse(read),"SERVICO");
   tipoProduto.clear();
   tipoProdutoId.clear();
   list.forEach((f){
     tipoProduto.add(f.descricao);
     tipoProdutoId.add(f.id);
   });
   return true;
  }

  @action
  Future readTaxa()async{
   await readMotivoIsencao();
   List<Taxa> list = await repository.readTaxa();
   taxas.clear();
   taxasId.clear();
   list.forEach((f){
     taxas.add(f.descricao);
     taxasId.add(f.id);
   });
   return true;
  }

   @action
  Future readMotivoIsencao()async{
   List<MotivoIsencao> list = await repository.readMotivoIsencao();
   motivosIsencao.clear();
   motivosIsencaoId.clear();
   list.forEach((f){
     motivosIsencao.add(f.descricao);
     motivosIsencaoId.add(f.id);
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
    produto.taxa.id = selectedItemTId;
    produto.motivoIsencao.id = selectedItemMId;
   return await repository.atualizar(produto);
  }

}

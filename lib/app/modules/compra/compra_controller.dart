import 'package:facturamobile/app/modules/compra/compra_repository.dart';
import 'package:facturamobile/app/modules/compra/models/compra.dart';
import 'package:facturamobile/app/modules/compra/models/compraresumo.dart';
import 'package:facturamobile/app/modules/fornecedor/fornecedor_repository.dart';
import 'package:facturamobile/app/modules/fornecedor/models/fornecedor.dart';
import 'package:facturamobile/app/modules/produto/models/produto.dart';
import 'package:facturamobile/app/modules/produto/models/produtoresumo.dart';
import 'package:facturamobile/app/modules/produto/produto_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobx/mobx.dart';

part 'compra_controller.g.dart';

class CompraController = _CompraControllerBase with _$CompraController;

abstract class _CompraControllerBase with Store {
  final repository = CompraRepository();
  final repositoryProduto = ProdutoRepository();
 final repositoryFornecedor = FornecedorRepository();
final storage = FlutterSecureStorage();

@observable
var compra = Compra();

@observable
int i = 0;

void seti(){
  i++;
}

List<Produto> produtos = List();
final List<int> produtosId = List();

List<String> fornecedores = List();
final List<int> fornecedoresId = List();

@observable
String selectedItem;
@observable
int selectedItemId;

@observable
String selectedItemF;
@observable
int selectedItemFId;
@observable
bool value=false;

@action
  Future<List<Object>> create()async {
    var read = await storage.read(key: "idUsuario");
    compra.usuarioCriouId = int.parse(read);
    compra.usuarioAlterouId = int.parse(read);
    compra.produtos = produtos;
    compra.fornecedor = Fornecedor(id: selectedItemFId);
   return await repository.criar(compra);
  }

  @action
  Future<List<CompraResumo>> read()async{
    var read = await storage.read(key: "idEmpresa");
   return await repository.read(int.parse(read));
  }

  @action
  Future readProduto()async{
    await readFornecedor();
    var read = await storage.read(key: "idEmpresa");
   List<ProdutoResumo> list = await repositoryProduto.read(int.parse(read));
   produtos.clear();
   produtosId.clear();
   list.forEach((f){
     produtos.add(Produto(id: f.id,nome:f.nome));
     produtosId.add(f.id);
   });
   return true;
  }

  @action
  Future readFornecedor()async{
    var read = await storage.read(key: "idEmpresa");
   List<Fornecedor> list = await repositoryFornecedor.read(int.parse(read));
   fornecedores.clear();
   fornecedoresId.clear();
   list.forEach((f){
     fornecedores.add(f.nome);
     fornecedoresId.add(f.id);
   });
   return true;
  }


  @action
  Future<Compra> readbyId(int idProduto)async{
    await readProduto();
   return await repository.readbyId(idProduto);
  }

  @action
  Future<List<Object>> update()async{
    var read = await storage.read(key: "idUsuario");
    compra.usuarioCriouId = int.parse(read);
    compra.usuarioAlterouId = int.parse(read);
    compra.produtos = produtos;
    compra.fornecedor.id = selectedItemFId;
   return await repository.atualizar(compra);
  }

}

import 'package:facturamobile/app/modules/produto/models/produto.dart';
import 'package:facturamobile/app/modules/produto/models/produtoresumo.dart';
import 'package:facturamobile/app/modules/produto/produto_repository.dart';
import 'package:facturamobile/app/modules/promocao/models/promocao.dart';
import 'package:facturamobile/app/modules/promocao/promocao_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobx/mobx.dart';

part 'promocao_controller.g.dart';

class PromocaoController = _PromocaoControllerBase with _$PromocaoController;

abstract class _PromocaoControllerBase with Store {
  final repository = PromocaoRepository();
  final repositoryProduto = ProdutoRepository();
final storage = FlutterSecureStorage();

@observable
var promocao = Promocao();

List<String> produtos = List();
final List<int> produtosId = List();

@observable
String selectedItem;
@observable
int selectedItemId;

@action
  Future<List<Object>> create()async {
    var read = await storage.read(key: "idUsuario");
    promocao.usuarioCriouId = int.parse(read);
    promocao.usuarioAlterouId = int.parse(read);
    promocao.produto = Produto(id: selectedItemId);
    promocao.status = true;
    promocao.dataInicio = formatDate(promocao.dataInicio, false);
    promocao.dataFim = formatDate(promocao.dataFim, false);
   return await repository.criar(promocao);
  }
  @action
  Future<List<Promocao>> read()async{
    var read = await storage.read(key: "idEmpresa");
   return await repository.read(int.parse(read));
  }

  @action
  Future readProduto()async{
    var read = await storage.read(key: "idEmpresa");
   List<ProdutoResumo> list = await repositoryProduto.read(int.parse(read));
   produtos.clear();
   produtosId.clear();
   list.forEach((f){
     produtos.add(f.nome);
     produtosId.add(f.id);
   });
   return true;
  }

  @action
  Future<List<Object>> update()async{
    var read = await storage.read(key: "idUsuario");
    promocao.usuarioCriouId = int.parse(read);
    promocao.usuarioAlterouId = int.parse(read);
    promocao.dataAlteracao = null;
    promocao.dataCriacao = null;
    promocao.produto.id = selectedItemId;
    promocao.dataInicio = formatDate(promocao.dataInicio, false);
    promocao.dataFim = formatDate(promocao.dataFim, false);
   return await repository.atualizar(promocao);
  }

  String formatDate(String st, bool time) {
    var date = DateTime.parse(st);
    var day = date.day.toString();
    var month = date.month.toString();
    var hour = date.hour.toString();
    var minute = date.minute.toString();
    var second = date.second.toString();
    if (date.day.toString().length == 1) day = "0" + day;
    if (date.month.toString().length == 1) month = "0" + month;
    if (date.hour.toString().length == 1) hour = "0" + hour;
    if (date.minute.toString().length == 1) minute = "0" + minute;
    if (date.second.toString().length == 1) second = "0" + second;
    if (time)
      return "$day/$month/${date.year} $hour:$minute:$second";
    else
      return "${date.year}-$month-$day";
  }

}

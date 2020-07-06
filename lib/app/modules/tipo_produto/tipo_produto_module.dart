import 'package:facturamobile/app/modules/tipo_produto/tipo_produto_repository.dart';
import 'package:facturamobile/app/modules/tipo_produto/tipo_produto_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:facturamobile/app/modules/tipo_produto/tipo_produto_page.dart';

class TipoProdutoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TipoProdutoRepository()),
        Bind((i) => TipoProdutoController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => TipoProdutoPage(args)),
      ];

  static Inject get to => Inject<TipoProdutoModule>.of();
}

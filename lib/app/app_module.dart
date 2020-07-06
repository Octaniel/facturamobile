import 'package:facturamobile/app/app_controller.dart';
import 'package:facturamobile/app/modules/cliente/cliente_module.dart';
import 'package:facturamobile/app/modules/compra/compra_module.dart';
import 'package:facturamobile/app/modules/empresa/empresa_module.dart';
import 'package:facturamobile/app/modules/fornecedor/fornecedor_module.dart';
import 'package:facturamobile/app/modules/marca/marca_module.dart';
import 'package:facturamobile/app/modules/modelo/modelo_module.dart';
import 'package:facturamobile/app/modules/produto/produto_module.dart';
import 'package:facturamobile/app/modules/promocao/promocao_module.dart';
import 'package:facturamobile/app/modules/seguranca/seguranca_module.dart';
import 'package:facturamobile/app/modules/serie/serie_module.dart';
import 'package:facturamobile/app/modules/servico/servico_module.dart';
import 'package:facturamobile/app/modules/splash/splash_module.dart';
import 'package:facturamobile/app/modules/tipo_produto/tipo_produto_module.dart';
import 'package:facturamobile/app/modules/venda/venda_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:facturamobile/app/app_widget.dart';
import 'package:facturamobile/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: SplashModule()),
        Router("/cliente", module: ClienteModule()),
        Router("/login", module: SegurancaModule()),
        Router("/home", module: HomeModule()),
        Router("/empresa", module: EmpresaModule()),
        Router("/fornecedor", module: FornecedorModule()),
        Router("/produto", module: ProdutoModule()),
        Router("/marca", module: MarcaModule()),
        Router("/modelo", module: ModeloModule()),
        Router("/promocao", module: PromocaoModule()),
        Router("/serie", module: SerieModule()),
        Router("/tipoProduto", module: TipoProdutoModule()),
        Router("/servico", module: ServicoModule()),
        Router("/compra", module: CompraModule()),
        Router("/venda", module: VendaModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}

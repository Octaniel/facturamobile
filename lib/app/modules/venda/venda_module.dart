import 'package:facturamobile/app/modules/venda/venda_repository.dart';
import 'package:facturamobile/app/modules/venda/venda_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:facturamobile/app/modules/venda/venda_page.dart';

class VendaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => VendaRepository()),
        Bind((i) => VendaController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => VendaPage()),
      ];

  static Inject get to => Inject<VendaModule>.of();
}

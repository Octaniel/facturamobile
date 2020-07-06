import 'package:facturamobile/app/modules/compra/compra_repository.dart';
import 'package:facturamobile/app/modules/compra/compra_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:facturamobile/app/modules/compra/compra_page.dart';

class CompraModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CompraRepository()),
        Bind((i) => CompraController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => CompraPage(args)),
      ];

  static Inject get to => Inject<CompraModule>.of();
}

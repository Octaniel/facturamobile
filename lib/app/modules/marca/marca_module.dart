import 'package:facturamobile/app/modules/marca/marca_repository.dart';
import 'package:facturamobile/app/modules/marca/marca_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:facturamobile/app/modules/marca/marca_page.dart';

class MarcaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MarcaRepository()),
        Bind((i) => MarcaController())
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => MarcaPage(args,)),
      ];

  static Inject get to => Inject<MarcaModule>.of();
}

import 'package:facturamobile/app/modules/cliente/cliente_repository.dart';
import 'package:facturamobile/app/modules/cliente/cliente_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:facturamobile/app/modules/cliente/cliente_page.dart';

class ClienteModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ClienteRepository()),
        Bind((i) => ClienteController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ClientePage()),
      ];

  static Inject get to => Inject<ClienteModule>.of();
}

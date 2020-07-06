import 'package:facturamobile/app/modules/servico/servico_repository.dart';
import 'package:facturamobile/app/modules/servico/servico_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:facturamobile/app/modules/servico/servico_page.dart';

class ServicoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ServicoRepository()),
        Bind((i) => ServicoController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ServicoPage(args)),
      ];

  static Inject get to => Inject<ServicoModule>.of();
}


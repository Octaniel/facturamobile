import 'package:facturamobile/app/modules/seguranca/seguranca_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:facturamobile/app/modules/seguranca/seguranca_page.dart';

class SegurancaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SegurancaController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SegurancaPage()),
      ];

  static Inject get to => Inject<SegurancaModule>.of();
}

import 'package:facturamobile/app/modules/empresa/empresa_repository.dart';
import 'package:facturamobile/app/modules/empresa/empresa_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:facturamobile/app/modules/empresa/empresa_page.dart';

class EmpresaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => EmpresaRepository()),
        Bind((i) => EmpresaController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => EmpresaPage()),
      ];

  static Inject get to => Inject<EmpresaModule>.of();
}

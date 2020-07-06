import 'package:facturamobile/app/modules/fornecedor/fornecedor_repository.dart';
import 'package:facturamobile/app/modules/fornecedor/fornecedor_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:facturamobile/app/modules/fornecedor/fornecedor_page.dart';

class FornecedorModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FornecedorRepository()),
        Bind((i) => FornecedorController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => FornecedorPage()),
      ];

  static Inject get to => Inject<FornecedorModule>.of();
}

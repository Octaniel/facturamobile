import 'package:facturamobile/app/modules/modelo/modelo_repository.dart';
import 'package:facturamobile/app/modules/modelo/modelo_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:facturamobile/app/modules/modelo/modelo_page.dart';

class ModeloModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ModeloRepository()),
        Bind((i) => ModeloController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ModeloPage(args)),
      ];

  static Inject get to => Inject<ModeloModule>.of();
}

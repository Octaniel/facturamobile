import 'package:facturamobile/app/modules/promocao/promocao_repository.dart';
import 'package:facturamobile/app/modules/promocao/promocao_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:facturamobile/app/modules/promocao/promocao_page.dart';

class PromocaoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PromocaoRepository()),
        Bind((i) => PromocaoController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => PromocaoPage(args)),
      ];

  static Inject get to => Inject<PromocaoModule>.of();
}

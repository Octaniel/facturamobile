import 'package:facturamobile/app/modules/serie/serie_repository.dart';
import 'package:facturamobile/app/modules/serie/serie_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:facturamobile/app/modules/serie/serie_page.dart';

class SerieModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SerieRepository()),
        Bind((i) => SerieController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SeriePage(args)),
      ];

  static Inject get to => Inject<SerieModule>.of();
}

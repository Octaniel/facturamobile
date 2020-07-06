import 'package:facturamobile/app/modules/home/home_controller.dart';
import 'package:facturamobile/app/modules/home/navigation_home_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => NavigationHomeScreen()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}

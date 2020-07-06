import 'package:mobx/mobx.dart';

part 'venda_controller.g.dart';

class VendaController = _VendaControllerBase with _$VendaController;

abstract class _VendaControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}

import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:facturamobile/app/modules/empresa/empresa_controller.dart';
import 'package:facturamobile/app/modules/empresa/empresa_module.dart';

void main() {
  initModule(EmpresaModule());
  // EmpresaController empresa;
  //
  setUp(() {
    //     empresa = EmpresaModule.to.get<EmpresaController>();
  });

  group('EmpresaController Test', () {
    //   test("First Test", () {
    //     expect(empresa, isInstanceOf<EmpresaController>());
    //   });

    //   test("Set Value", () {
    //     expect(empresa.value, equals(0));
    //     empresa.increment();
    //     expect(empresa.value, equals(1));
    //   });
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../compra_controller.dart';

class CompraCadastroPage extends StatefulWidget {

  @override
  _CompraCadastroPageState createState() => _CompraCadastroPageState();
}

class _CompraCadastroPageState extends ModularState<CompraCadastroPage, CompraController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CompraCadastro'),
      ),
    );
  }
}

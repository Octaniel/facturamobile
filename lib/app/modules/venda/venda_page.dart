import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'venda_controller.dart';

class VendaPage extends StatefulWidget {
  final String title;
  const VendaPage({Key key, this.title = "Venda"}) : super(key: key);

  @override
  _VendaPageState createState() => _VendaPageState();
}

class _VendaPageState extends ModularState<VendaPage, VendaController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}

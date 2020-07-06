import 'package:facturamobile/app/modules/cliente/cliente_controller.dart';
import 'package:facturamobile/app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ClienteCadastroPage extends StatefulWidget {

  @override
  _ClienteCadastroState createState() => _ClienteCadastroState();
}

class _ClienteCadastroState
    extends ModularState<ClienteCadastroPage, ClienteController> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 10,
          child: Form(
            key: formKey,
            child: criarFormulario(),
          ),
        ),
      ),
    );
  }

  Widget criarFormulario() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: inputText(
              "Nome",
              (c) => c == null || c.isEmpty ? "Nome invalido" : null,
              (c) => controller.setNome(c),
              Icons.near_me,
              TextInputType.text,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: inputText(
              "Nif",
              (c) => c == null || c.isEmpty ? "Nif invalido" : c.length==9?null:"Nif deve ter exatamente 9 digitos",
              (c) => controller.setNif(c),
              Icons.last_page,
              TextInputType.number,
            ),
          ),
          Container(
            height: 40,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: button(
              validar,
              Text("Salvar"),
            ),
          ),
        ],
      ),
    );
  }

  void validar()async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      var list = await controller.create();
     if(list.elementAt(0)){
       Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text("                                     Cliente adicionado com sucesso"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
          shape: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.greenAccent,
      ),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    elevation: 10,
    behavior: SnackBarBehavior.floating,
        ),
      );
     }else{
       Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text("                 "+list.elementAt(1)),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
          shape: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
      ),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    elevation: 10,
    behavior: SnackBarBehavior.floating,
        ),
      );
     }
    }
  }
}

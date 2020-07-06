import 'package:facturamobile/app/modules/fornecedor/fornecedor_controller.dart';
import 'package:facturamobile/app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FornecedorCadastroPage extends StatefulWidget {
  static const String routeName = '/fornecedorCadastro';

  @override
  _FornecedorCadastroPageState createState() => _FornecedorCadastroPageState();
}

class _FornecedorCadastroPageState extends ModularState<FornecedorCadastroPage, FornecedorController> {
 final formKey = GlobalKey<FormState>();
 final textController = TextEditingController();

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
              margin: EdgeInsets.only(bottom: 20),
              child: inputText(
                "Nome",
                (c) => c == null || c.isEmpty ? "Nome invalido" : null,
                (c) => controller.fornecedor.nome = c,
                Icons.near_me,
                TextInputType.text,
                initialValue: controller.fornecedor.nome,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 25),
              child: inputText(
                "Nif",
                (c) => c == null || c.isEmpty
                    ? "Nif invalido"
                    : c.length == 9
                        ? null
                        : "Nif deve ter exatamente 9 digitos",
                (c) => controller.fornecedor.nif = c,
                Icons.last_page,
                TextInputType.number,
                initialValue: controller.fornecedor.nif,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: inputText(
                "Email",
                (c) => c == null || c.isEmpty ? "Email invalido" : null,
                (c) => controller.fornecedor.email = c,
                Icons.email,
                TextInputType.text,
                initialValue: controller.fornecedor.email,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: inputText(
                "Telefone",
                (c) => c == null || c.isEmpty ? "Telefone invalido" : null,
                (c) => controller.fornecedor.telefone = c,
                Icons.phone,
                TextInputType.text,
                initialValue: controller.fornecedor.telefone,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: inputText(
                "Endereço",
                (c) => c == null || c.isEmpty ? "Endereço invalido" : null,
                (c) => controller.fornecedor.endereco = c,
                Icons.panorama_vertical,
                TextInputType.text,
                initialValue: controller.fornecedor.endereco,
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
          content: Text("                                     Fornecedor adicionado com sucesso"),
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

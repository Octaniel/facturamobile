
import 'package:facturamobile/app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../empresa_controller.dart';

class EmpresaCadastroPage extends StatefulWidget {
  @override
  _EmpresaCadastroPageState createState() => _EmpresaCadastroPageState();
}

class _EmpresaCadastroPageState extends ModularState<EmpresaCadastroPage, EmpresaController> {
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
                (c) => controller.empresa.nome = c,
                Icons.near_me,
                TextInputType.text,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: inputText(
                "Número Certificação",
                (c) => c == null || c.isEmpty
                    ? "Número Certificação invalido"
                    : null,
                (c) => controller.empresa.numeroCertificacao = c,
                Icons.confirmation_number,
                TextInputType.text,
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
                (c) => controller.empresa.nif = c,
                Icons.last_page,
                TextInputType.number,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: inputText(
                "Email",
                (c) => c == null || c.isEmpty ? "Email invalido" : null,
                (c) => controller.empresa.email = c,
                Icons.email,
                TextInputType.text,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: inputText(
                "Telefone",
                (c) => c == null || c.isEmpty ? "Telefone invalido" : null,
                (c) => controller.empresa.telefone = c,
                Icons.phone,
                TextInputType.text,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: inputText(
                "Endereço",
                (c) => c == null || c.isEmpty ? "Endereço invalido" : null,
                (c) => controller.empresa.endereco = c,
                Icons.panorama_vertical,
                TextInputType.text,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: inputText(
                  "Data Certificação",
                  (c) => c == null || c.isEmpty
                      ? "Data Certificação invalida"
                      : null,
                  (c) {},
                  Icons.date_range,
                  TextInputType.text,
                  //initialValue: controller.empresa.dataCertificacao, 
                  controller: textController,
                  onTap: () async {
                var date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2050),
                  builder: (BuildContext context, Widget child) {
                    return Theme(
                      data: ThemeData.light(),
                      child: child,
                    );}
                );
                var day = date.day.toString();
                var month = date.month.toString();
                if(date.day.toString().length==1) day = "0"+day;
                if(date.month.toString().length==1) month = "0"+month;
                textController.text = "$day/$month/${date.year}";
                controller.empresa.dataCertificacao = "${date.year}-$month-$day";
              }),
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
          content: Text("                                     Empresa adicionada com sucesso"),
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

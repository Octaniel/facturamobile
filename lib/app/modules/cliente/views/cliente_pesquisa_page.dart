import 'package:facturamobile/app/modules/cliente/cliente_controller.dart';
import 'package:facturamobile/app/modules/cliente/models/cliente.dart';
import 'package:facturamobile/app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ClientePesquisaPage extends StatefulWidget {
  static const String routeName = '/clientePesquisa';

  @override
  _ClientePesquisaPageState createState() => _ClientePesquisaPageState();
}

class _ClientePesquisaPageState
    extends ModularState<ClientePesquisaPage, ClienteController> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 10,
          child: ListView(
            children: <Widget>[
              FutureBuilder<List>(
                future: controller.read(),
                builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    return criarTabela(snapshot.data, context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget criarTabela(List<Cliente> clist, BuildContext context) {
    return DataTable(
      columns: <DataColumn>[
        DataColumn(
            label: Text(
          'Nome',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        DataColumn(
            label: Text(
          'Nif',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        DataColumn(label: Text('')),
      ],
      rows: linhas(clist, context),
    );
  }

  List<DataRow> linhas(List<Cliente> clist, BuildContext context) {
    List<DataRow> listaLinhas = new List();
    clist.forEach((f) {
      var dataRow = DataRow(
        cells: <DataCell>[
          DataCell(Text(
            f.nome,
            style: TextStyle(fontSize: 15),
          )),
          DataCell(Text(
            f.nif,
            style: TextStyle(fontSize: 15),
          )),
          DataCell(
            Container(
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: button(
                () {
                  controller.setNome(f.nome);
                  controller.setNif(f.nif);
                  controller.setId(f.id);
                  show(context);
                },
                Icon(Icons.edit),
              ),
            ),
          ),
        ],
      );
      listaLinhas.add(dataRow);
    });
    return listaLinhas;
  }

  void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (co) => alert(co),
    );
  }

  Widget alert(BuildContext context) {
    return AlertDialog(
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Modular.to.pop();
            },
            child: Text("Cancelar"))
      ],
      title: Text("                       Edição Cliente"),
      elevation: 10,
      shape: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blue,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      content: criarFormulario(),
    );
  }

  Widget criarFormulario() {
    return Form(
      key: formKey,
      child: Container(
        width: 400,
        height: 300,
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 40)),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: inputText(
                "Nome",
                (c) => c == null || c.isEmpty ? "Nome invalido" : null,
                (c) => controller.setNome(c),
                Icons.near_me,
                TextInputType.text,
                initialValue: controller.nome,
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
                (c) => controller.setNif(c),
                Icons.last_page,
                TextInputType.number,
                initialValue: controller.nif,
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
      ),
    );
  }

  void validar() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      var list = await controller.update();
      if (list.elementAt(0)) {
        Modular.to.pop();
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(
                "                                     Cliente atualizado com sucesso"),
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
      } else {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text("                 " + list.elementAt(1)),
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

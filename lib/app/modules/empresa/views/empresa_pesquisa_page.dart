
import 'package:facturamobile/app/modules/empresa/models/empresa.dart';
import 'package:facturamobile/app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../empresa_controller.dart';

class EmpresaPesquisaPage extends StatefulWidget {
  @override
  _EmpresaPesquisaPageState createState() => _EmpresaPesquisaPageState();
}

class _EmpresaPesquisaPageState
    extends ModularState<EmpresaPesquisaPage, EmpresaController> {
  final formKey = GlobalKey<FormState>();
  final textController = TextEditingController();

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
                    return Container(
                      height: snapshot.data.length*50+60.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          criarTabela(snapshot.data, context)
                        ],
                        ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget criarTabela(List<Empresa> clist, BuildContext context) {
    return DataTable(
      columns: <DataColumn>[
        DataColumn(
            label: Text(
          'Nome',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        DataColumn(
            label: Text(
          'Número Cert.',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
         DataColumn(
            label: Text(
          'Nif',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        DataColumn(
            label: Text(
          'E-mail',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        DataColumn(
            label: Text(
          'Endereço',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        DataColumn(
            label: Text(
          'Telefone',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        DataColumn(
            label: Text(
          'Data Cert.',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        DataColumn(
            label: Text(
          'Data Cria.',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        DataColumn(label: Text('')),
      ],
      rows: linhas(clist, context),
    );
  }

  List<DataRow> linhas(List<Empresa> clist, BuildContext context) {
    List<DataRow> listaLinhas = new List();
    clist.forEach((f) {
      var dataCertificacao = formatDate(f.dataCertificacao, false);
      var dataCriacao = formatDate(f.dataCriacao, true);
      var dataRow = DataRow(
        cells: <DataCell>[
          DataCell(Text(
            f.nome,
            style: TextStyle(fontSize: 15),
          )),
          DataCell(Text(
            f.numeroCertificacao,
            style: TextStyle(fontSize: 15),
          )),
          DataCell(Text(
            f.nif,
            style: TextStyle(fontSize: 15),
          )),
          DataCell(Text(
            f.email,
            style: TextStyle(fontSize: 15),
          )),
          DataCell(Text(
            f.endereco,
            style: TextStyle(fontSize: 15),
          )),
          DataCell(Text(
            f.telefone,
            style: TextStyle(fontSize: 15),
          )),
          DataCell(Text(
            dataCertificacao,
            style: TextStyle(fontSize: 15),
          )),
          DataCell(Text(
            dataCriacao,
            style: TextStyle(fontSize: 15),
          )),
          DataCell(
            Container(
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: button(
                () {
                  controller.empresa = f;
                  var date = DateTime.parse(f.dataCertificacao);
                var day = date.day.toString();
                var month = date.month.toString();
                if(date.day.toString().length==1) day = "0"+day;
                if(date.month.toString().length==1) month = "0"+month;
                textController.text = "$day/$month/${date.year}";
                controller.empresa.dataCertificacao = "${date.year}-$month-$day";
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

  String formatDate(String st, bool time) {
    var date = DateTime.parse(st);
    var day = date.day.toString();
    var month = date.month.toString();
    var hour = date.hour.toString();
    var minute = date.minute.toString();
    var second = date.second.toString();
    if (date.day.toString().length == 1) day = "0" + day;
    if (date.month.toString().length == 1) month = "0" + month;
    if (date.hour.toString().length == 1) hour = "0" + hour;
    if (date.minute.toString().length == 1) minute = "0" + minute;
    if (date.second.toString().length == 1) second = "0" + second;
    if(time) return "$day/$month/${date.year} $hour:$minute:$second";
    else return "$day/$month/${date.year}";
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
      title: Text("                       Edição Empresa"),
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
        height: 500,
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: ListView(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 40)),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: inputText(
                "Nome",
                (c) => c == null || c.isEmpty ? "Nome invalido" : null,
                (c) => controller.empresa.nome = c,
                Icons.near_me,
                TextInputType.text,
                initialValue: controller.empresa.nome,
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
                initialValue: controller.empresa.numeroCertificacao,
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
                initialValue: controller.empresa.nif,
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
                initialValue: controller.empresa.email,
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
                initialValue: controller.empresa.telefone,
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
                initialValue: controller.empresa.endereco,
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
                  initialDate: DateTime.parse(controller.empresa.dataCertificacao),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2050),
                  builder: (BuildContext context, Widget child) {
                    return Theme(
                      data: ThemeData.light(),
                      child: child,
                    );}
                );
                if(date!=null){
                  var day = date.day.toString();
                var month = date.month.toString();
                if(date.day.toString().length==1) day = "0"+day;
                if(date.month.toString().length==1) month = "0"+month;
                textController.text = "$day/$month/${date.year}";
                controller.empresa.dataCertificacao = "${date.year}-$month-$day";
                }
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
                "                                     Empresa atualizado com sucesso"),
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

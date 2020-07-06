import 'dart:async';

import 'package:facturamobile/app/modules/compra/models/compraresumo.dart';
import 'package:facturamobile/app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../compra_controller.dart';

class CompraPesquisaPage extends StatefulWidget {
   final ModularArguments args;
  const CompraPesquisaPage(this.args,{Key key}) : super(key: key);
  @override
  _CompraPesquisaPageState createState() => _CompraPesquisaPageState();
}

class _CompraPesquisaPageState extends ModularState<CompraPesquisaPage, CompraController> {
var formKey = GlobalKey<FormState>();
  final textController = TextEditingController();
   bool scalf = false;
  BuildContext contex;

  @override
  void initState() {
    List<Object> list = widget.args?.data;
    if (list != null) {
      scalf = list.elementAt(0);
    }
    super.initState();
    Timer(Duration(milliseconds: 300), () => mostrarScalf());
  }

  Widget mostrarScalf() {
    if (scalf) {
      Scaffold.of(contex).showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Compra atualizado com sucesso"),
            ],
          ),
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
      scalf = false;
    }
    return Container();
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
                    contex = context;
                    return Container(
                      height: snapshot.data.length * 50 + 60.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[criarTabela(snapshot.data, context)],
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

  Widget criarTabela(List<CompraResumo> clist, BuildContext context) {
    return DataTable(
      columns: <DataColumn>[
        DataColumn(
            label: Text(
          'Nome do Fornecedor',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        DataColumn(
            label: Text(
          'Nome do Produto',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        DataColumn(
            label: Text(
          'Quantidade',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        DataColumn(
            label: Text(
          'Valor',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        DataColumn(
            label: Text(
          'Data',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        DataColumn(label: Text('')),
      ],
      rows: linhas(clist, context),
    );
  }

  List<DataRow> linhas(List<CompraResumo> clist, BuildContext context) {
    List<DataRow> listaLinhas = new List();
    
    clist.forEach((f) {
      String nome = "";
      int totalQuant = 0;
      f.produtoMins.forEach((element) {
        controller.i<f.produtoMins.length-1?nome+=element.nomeProduto+"\n":nome+=element.nomeProduto;
        totalQuant+=element.quatidadeProduto;
        controller.seti();
      });
      controller.i=0;
      var dataRow = DataRow(
        cells: <DataCell>[
          DataCell(Text(
            f.nomeFornecedor,
            style: TextStyle(fontSize: 15),   
          )),
          DataCell(Text(
            nome,
            style: TextStyle(fontSize: 15),
          )),
          DataCell(Text(
            totalQuant.toString(),
            style: TextStyle(fontSize: 15),
          )),
          DataCell(Text(
            f.valor.toString(),
            style: TextStyle(fontSize: 15),
          )),
          DataCell(Text(
            f.data,
            style: TextStyle(fontSize: 15),
          )),
          DataCell(
            Container(
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: button(
                () async {
                  controller.compra = await controller.readbyId(f.id);
                  var date = controller.compra.data!=null?DateTime.parse(controller.compra.data):null;
                  if(date!=null){
                  var day = date.day.toString();
                  var month = date.month.toString();
                  if (date.day.toString().length == 1) day = "0" + day;
                  if (date.month.toString().length == 1) month = "0" + month;
                  textController.text = "$day/$month/${date.year}";
                  }
                  else{
                    textController.text = null;
                  }
                  controller.selectedItem = nome;

                  controller.selectedItemF = controller.compra.fornecedor.nome;
                  controller.selectedItemFId = controller.fornecedoresId
                      .elementAt(controller.fornecedores
                          .indexOf(controller.selectedItemF));
                          
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
      child: alert(context),
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
      title: Text("                       Edição Compra"),
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
                "Valor",
                (c) => c == null || c.isEmpty ? "Valor invalido" : null,
                (c) => controller.compra.valor = double.parse(c),
                Icons.near_me,
                TextInputType.text,
                initialValue: controller.compra.valor.toString(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 25),
              child: inputText(
                "Observação",
                (c) => c == null || c.isEmpty ? "Observação invalido" : null,
                (c) => controller.compra.observacao = c,
                Icons.next_week,
                TextInputType.number,
                initialValue: controller.compra.observacao,
              ),
            ),
            Text(
              "Fornecedor:",
              style: TextStyle(fontSize: 13),
            ),
            Observer(builder: (_) {
              return DropdownButton<String>(
                hint: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text("Escolhe"),
                ),
                icon: Container(
                  margin: EdgeInsets.only(left: 90, top: 10),
                  child: Icon(
                    Icons.expand_more,
                    size: 30,
                  ),
                ),
                value: controller.selectedItemF,
                onChanged: (string) {
                  controller.selectedItemF = string;
                  controller.selectedItemFId = controller.fornecedoresId
                      .elementAt(controller.fornecedores.indexOf(string));
                },
                selectedItemBuilder: (BuildContext context) {
                  return controller.fornecedores.map<Widget>((String item) {
                    return Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(item),
                    );
                  }).toList();
                },
                items: controller.fornecedores.map((String item) {
                  return DropdownMenuItem<String>(
                    child: Text(item),
                    value: item,
                  );
                }).toList(),
              );
            }),
            Padding(padding: EdgeInsets.only(top: 25)),
            /*Container(
              margin: EdgeInsets.only(bottom: 20),
              child: inputText(
                "Quantidade",
                (c) =>
                    c == null || c.isEmpty ? "Quantidade invalido" : null,
                (c) => controller.compra.quantidade = int.parse(c),
                Icons.nfc,
                TextInputType.text,
                initialValue: controller.compra.quantidade.toString(),
              ),
            ),*/
            Text(
              "Produtos:",
              style: TextStyle(fontSize: 13),
            ),
            Observer(builder: (_) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(controller.selectedItem),
                  IconButton(icon: Icon(Icons.add), onPressed: (){})
                ],
              );
              
            }),
            Padding(padding: EdgeInsets.only(top: 15)),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: inputText("Data da Compra", (c) => null, (c) {},
                  Icons.date_range, TextInputType.text,
                  controller: textController, onTap: () async {
                var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.parse(controller.compra.data),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2050),
                    builder: (BuildContext context, Widget child) {
                      return Theme(
                        data: ThemeData.light(),
                        child: child,
                      );
                    });
                if (date != null) {
                  var day = date.day.toString();
                  var month = date.month.toString();
                  if (date.day.toString().length == 1) day = "0" + day;
                  if (date.month.toString().length == 1) month = "0" + month;
                  textController.text = "$day/$month/${date.year}";
                  controller.compra.data = "${date.year}-$month-$day";
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
       Modular.to.pop();
      if (list.elementAt(0)) {
       scalf = true;
        List<Object> list = List();
        list.insert(0, true);
        Modular.to.pushReplacementNamed("/compra/", arguments: list);
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

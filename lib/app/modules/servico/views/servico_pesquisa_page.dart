import 'dart:async';

import 'package:facturamobile/app/modules/servico/models/servicoresumo.dart';
import 'package:facturamobile/app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../servico_controller.dart';

class ServicoPesquisaPage extends StatefulWidget {
  final ModularArguments args;

  const ServicoPesquisaPage(this.args, {Key key}) : super(key: key);

  @override
  _ServicoPesquisaPageState createState() => _ServicoPesquisaPageState();
}

class _ServicoPesquisaPageState
    extends ModularState<ServicoPesquisaPage, ServicoController> {
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
    Timer(Duration(milliseconds: 350), () => mostrarScalf());
  }

  Widget mostrarScalf() {
    if (scalf) {
      Scaffold.of(contex).showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Serviço atualizado com sucesso"),
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

  Widget criarTabela(List<ServicoResumo> clist, BuildContext context) {
    return DataTable(
      columns: <DataColumn>[
        DataColumn(
            label: Text(
          'Nome',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        DataColumn(
            label: Text(
          'Tipo Serviço',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        DataColumn(
            label: Text(
          'Preço da Venda',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        DataColumn(
            label: Text(
          'Status',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        DataColumn(
            label: Text(
          'Taxa',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        DataColumn(
            label: Text(
          'Motivo Isenção',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        DataColumn(label: Text('')),
      ],
      rows: linhas(clist, context),
    );
  }

  List<DataRow> linhas(List<ServicoResumo> clist, BuildContext context) {
    List<DataRow> listaLinhas = new List();
    clist.forEach((f) {
      var dataRow = DataRow(
        cells: <DataCell>[
          DataCell(Text(
            f.nome,
            style: TextStyle(fontSize: 15),
          )),
          DataCell(Text(
            f.descTipoServico,
            style: TextStyle(fontSize: 15),
          )),
          DataCell(Text(
            f.precoVenda.toString(),
            style: TextStyle(fontSize: 15),
          )),
          DataCell(Text(
            f.status ? "Ativo" : "Desativo",
            style: TextStyle(fontSize: 15),
          )),
          DataCell(Text(
            f.descTaxa,
            style: TextStyle(fontSize: 15),
          )),
          DataCell(Text(
            f.descMotivoIsencao,
            style: TextStyle(fontSize: 15),
          )),
          DataCell(
            Container(
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: button(
                () async {
                  controller.produto = await controller.readbyId(f.id);
                  var date = controller.produto.validade != null
                      ? DateTime.parse(controller.produto.validade)
                      : null;
                  if (date != null) {
                    var day = date.day.toString();
                    var month = date.month.toString();
                    if (date.day.toString().length == 1) day = "0" + day;
                    if (date.month.toString().length == 1) month = "0" + month;
                    textController.text = "$day/$month/${date.year}";
                  } else {
                    textController.text = null;
                  }
                  controller.selectedItem =
                      controller.produto.tipoProduto.descricao;
                  controller.selectedItemId = controller.tipoProdutoId
                      .elementAt(controller.tipoProduto
                          .indexOf(controller.selectedItem));

                  controller.selectedItemT = controller.produto.taxa.descricao;
                  controller.selectedItemTId = controller.taxasId.elementAt(
                      controller.taxas.indexOf(controller.selectedItemT));

                  controller.selectedItemM =
                      controller.produto.motivoIsencao.descricao;
                  controller.selectedItemMId = controller.motivosIsencaoId
                      .elementAt(controller.motivosIsencao
                          .indexOf(controller.selectedItemM));

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
      title: Text("                       Edição Produto"),
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
                (c) => controller.produto.nome = c,
                Icons.near_me,
                TextInputType.text,
                initialValue: controller.produto.nome,
              ),
            ),
            Text(
              "Tipo Servico:",
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
                value: controller.selectedItem,
                onChanged: (string) {
                  controller.selectedItem = string;
                  controller.selectedItemId = controller.tipoProdutoId
                      .elementAt(controller.tipoProduto.indexOf(string));
                },
                selectedItemBuilder: (BuildContext context) {
                  return controller.tipoProduto.map<Widget>((String item) {
                    return Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(item),
                    );
                  }).toList();
                },
                items: controller.tipoProduto.map((String item) {
                  return DropdownMenuItem<String>(
                    child: Text(item),
                    value: item,
                  );
                }).toList(),
              );
            }),
            Padding(padding: EdgeInsets.only(top: 25)),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: inputText(
                "Preço da Venda",
                (c) =>
                    c == null || c.isEmpty ? "Preço da Venda invalido" : null,
                (c) => controller.produto.precoVenda = double.parse(c),
                Icons.nfc,
                TextInputType.text,
                initialValue: controller.produto.precoVenda.toString(),
              ),
            ),
            Text(
              "Taxa:",
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
                value: controller.selectedItemT,
                onChanged: (string) {
                  controller.selectedItemT = string;
                  controller.selectedItemTId = controller.taxasId
                      .elementAt(controller.taxas.indexOf(string));
                },
                selectedItemBuilder: (BuildContext context) {
                  return controller.taxas.map<Widget>((String item) {
                    return Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(item),
                    );
                  }).toList();
                },
                items: controller.taxas.map((String item) {
                  return DropdownMenuItem<String>(
                    child: Text(item),
                    value: item,
                  );
                }).toList(),
              );
            }),
            Padding(padding: EdgeInsets.only(top: 15)),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: inputText(
                "Descrição",
                (c) => c == null || c.isEmpty ? "Descrição invalida" : null,
                (c) => controller.produto.descricao = c,
                Icons.message,
                TextInputType.text,
                initialValue: controller.produto.descricao,
              ),
            ),
            Text(
              "Motivo Isenção:",
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
                value: controller.selectedItemM,
                onChanged: (string) {
                  controller.selectedItemM = string;
                  controller.selectedItemMId = controller.motivosIsencaoId
                      .elementAt(controller.motivosIsencao.indexOf(string));
                },
                selectedItemBuilder: (BuildContext context) {
                  return controller.motivosIsencao.map<Widget>((String item) {
                    return Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(item),
                    );
                  }).toList();
                },
                items: controller.motivosIsencao.map((String item) {
                  return DropdownMenuItem<String>(
                    child: Text(item),
                    value: item,
                  );
                }).toList(),
              );
            }),
            Padding(padding: EdgeInsets.only(top: 15)),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                onTap: () {
                  controller.produto.status =
                      controller.produto.status ? false : true;
                  Modular.to.pop();
                  formKey = null;
                  show(context);
                  formKey = GlobalKey<FormState>();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Status",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      CupertinoSwitch(
                        activeColor: controller.produto.status
                            ? Colors.greenAccent
                            : Colors.grey.withOpacity(0.6),
                        onChanged: (bool value) {
                          controller.produto.status = value;
                          Modular.to.pop();
                          formKey = GlobalKey<FormState>();
                          show(context);
                        },
                        value: controller.produto.status,
                      ),
                    ],
                  ),
                ),
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
      Modular.to.pop();
      if (list.elementAt(0)) {
        scalf = true;
        List<Object> list = List();
        list.insert(0, true);
        Modular.to.pushReplacementNamed("/servico/", arguments: list);
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

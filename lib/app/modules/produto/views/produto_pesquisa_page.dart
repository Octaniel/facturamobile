import 'dart:async';

import 'package:facturamobile/app/modules/produto/models/produtoresumo.dart';
import 'package:facturamobile/app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../produto_controller.dart';

class ProdutoPesquisaPage extends StatefulWidget {
  static const String routeName = '/produtoPesquisa';
  final ModularArguments args;
  const ProdutoPesquisaPage(this.args,{Key key}) : super(key: key);

  @override
  _ProdutoPesquisaPageState createState() => _ProdutoPesquisaPageState();
}

class _ProdutoPesquisaPageState
    extends ModularState<ProdutoPesquisaPage, ProdutoController> {
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
              Text("Produto atualizado com sucesso"),
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

  Widget criarTabela(List<ProdutoResumo> clist, BuildContext context) {
    return DataTable(
      columns: <DataColumn>[
        DataColumn(
            label: Text(
          'Nome',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        DataColumn(
            label: Text(
          'Modelo',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        DataColumn(
            label: Text(
          'Tipo Prod.',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        DataColumn(
            label: Text(
          'Preço da Ve.',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        DataColumn(
            label: Text(
          'Status',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        DataColumn(label: Text('')),
      ],
      rows: linhas(clist, context),
    );
  }

  List<DataRow> linhas(List<ProdutoResumo> clist, BuildContext context) {
    List<DataRow> listaLinhas = new List();
    clist.forEach((f) {
      var dataRow = DataRow(
        cells: <DataCell>[
          DataCell(Text(
            f.nome,
            style: TextStyle(fontSize: 15),
          )),
          DataCell(Text(
            f.modelo != null ? f.modelo : "",
            style: TextStyle(fontSize: 15),
          )),
          DataCell(Text(
            f.descricaoTipoProduto,
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
          DataCell(
            Container(
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: button(
                () async {
                  controller.produto = await controller.readbyId(f.id);
                  var date = controller.produto.validade!=null?DateTime.parse(controller.produto.validade):null;
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
                  controller.selectedItem =
                      controller.produto.tipoProduto.descricao;
                  controller.selectedItemId = controller.tipoProdutoId
                      .elementAt(controller.tipoProduto
                          .indexOf(controller.selectedItem));
                  controller.selectedItemM = controller.produto.modelo.nome;
                  controller.selectedItemMId = controller.modelosId
                      .elementAt(controller.modelos
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
            Container(
              margin: EdgeInsets.only(bottom: 25),
              child: inputText(
                "Stock",
                (c) => c == null || c.isEmpty ? "Stock invalido" : null,
                (c) => controller.produto.stock = int.parse(c),
                Icons.next_week,
                TextInputType.number,
                initialValue: controller.produto.stock.toString(),
              ),
            ),
            Text(
              "Tipo Produto:",
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
              margin: EdgeInsets.only(bottom: 20),
              child: inputText(
                "Unidade",
                (c) => c == null || c.isEmpty ? "unidade invalida" : null,
                (c) => controller.produto.unidade = c,
                Icons.merge_type,
                TextInputType.text,
                initialValue: controller.produto.unidade,
              ),
            ),
            Text(
              "Modelo:",
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
                  controller.selectedItemMId = controller.modelosId
                      .elementAt(controller.modelos.indexOf(string));
                },
                selectedItemBuilder: (BuildContext context) {
                  return controller.modelos.map<Widget>((String item) {
                    return Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(item),
                    );
                  }).toList();
                },
                items: controller.modelos.map((String item) {
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
              child: inputText("Data Validade", (c) => null, (c) {},
                  Icons.date_range, TextInputType.text,
                  controller: textController, onTap: () async {
                var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.parse(controller.produto.validade),
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
                  controller.produto.validade = "${date.year}-$month-$day";
                }
              }),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: inputText(
                "Codigo",
                (c) => c == null || c.isEmpty ? "Codigo invalida" : null,
                (c) => controller.produto.codigo = c,
                Icons.memory,
                TextInputType.text,
                initialValue: controller.produto.codigo,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: inputText(
                "Stock Minimo",
                (c) => c == null || c.isEmpty ? "Stock Minimo invalida" : null,
                (c) => controller.produto.stockMinimo = int.parse(c),
                Icons.low_priority,
                TextInputType.text,
                initialValue: controller.produto.stockMinimo.toString(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: inputText(
                "Quantidade Maxima por Venda",
                (c) => c == null || c.isEmpty
                    ? "Quantidade Maxima por Venda invalida"
                    : null,
                (c) => controller.produto.quantidadeMaximaVenda = int.parse(c),
                Icons.line_weight,
                TextInputType.text,
                initialValue:
                    controller.produto.quantidadeMaximaVenda.toString(),
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
        Modular.to.pushReplacementNamed("/produto/", arguments: list);
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

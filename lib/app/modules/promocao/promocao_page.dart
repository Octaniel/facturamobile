import 'dart:async';

import 'package:facturamobile/app/modules/promocao/models/promocao.dart';
import 'package:facturamobile/app/res/app_theme.dart';
import 'package:facturamobile/app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'promocao_controller.dart';

class PromocaoPage extends StatefulWidget {
  final ModularArguments args;
  const PromocaoPage(this.args, {Key key}) : super(key: key);

  @override
  _PromocaoPageState createState() => _PromocaoPageState();
}

class _PromocaoPageState
    extends ModularState<PromocaoPage, PromocaoController> {
  bool scalf = false;
  BuildContext contex;
  String titulo = "";
  final formKey = GlobalKey<FormState>();
  final textControllerInicio = TextEditingController();
  final textControllerFim = TextEditingController();

  @override
  void initState() {
    List<Object> list = widget.args?.data;
    if (list != null) {
      titulo = list.elementAt(1);
      scalf = list.elementAt(0);
    }
    super.initState();
    Timer(Duration(milliseconds: 300), () => mostrarScalf());
  }

  Widget mostrarScalf() {
    String text = titulo == "Novo" ? "adicionado" : "atualizado";
    if (scalf) {
      Scaffold.of(contex).showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Promocao $text com sucesso"),
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

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 0));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: FutureBuilder<bool>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            return Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  appBar(),
                  Expanded(
                    child: FutureBuilder<bool>(
                      future: getData(),
                      builder:
                          (BuildContext context, AsyncSnapshot<bool> snapshot) {
                        if (!snapshot.hasData) {
                          return const SizedBox();
                        } else {
                          return corpo();
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget appBar() {
    return SizedBox(
      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  'Promoção',
                  style: TextStyle(
                    fontSize: 22,
                    color: AppTheme.darkText,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget corpo() {
    return Center(
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
                    height: snapshot.data.length * 48 + 60.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        criarTabela(snapshot.data, context),
                      ],
                    ),
                  );
                }
              },
            ),
            Container(
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: button(
                () async {
                  titulo = "Novo";
                  controller.promocao = Promocao();
                  controller.promocao.dataInicio = DateTime.now().toString();
                  controller.promocao.dataFim = DateTime.now().toString();
                  await controller.readProduto();
                  show(context);
                },
                Icon(Icons.library_add),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget criarTabela(List<Promocao> clist, BuildContext context) {
    return DataTable(
      columns: <DataColumn>[
        DataColumn(
            label: Text(
          'Data Inicio',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        DataColumn(
            label: Text(
          'Data Fim',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        DataColumn(
            label: Text(
          'Valor',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        DataColumn(
            label: Text(
          'Produto',
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

  List<DataRow> linhas(List<Promocao> clist, BuildContext context) {
    List<DataRow> listaLinhas = new List();
    clist.forEach((f) {
      var dataInicio = formatDate(f.dataInicio, false);
      var dataFim = formatDate(f.dataFim, false);
      var dataRow = DataRow(
        cells: <DataCell>[
          DataCell(Text(
            dataInicio,
            style: TextStyle(fontSize: 15),
          )),
          DataCell(Text(
            dataFim,
            style: TextStyle(fontSize: 15),
          )),
          DataCell(Text(
            f.valor.toString(),
            style: TextStyle(fontSize: 15),
          )),
          DataCell(Text(
            f.produto.nome,
            style: TextStyle(fontSize: 15),
          )),
          DataCell(
              Text(
                f.status ? "ativo" : "desativo",
                style: TextStyle(
                    fontSize: 15, color: f.status ? Colors.blue : Colors.red),
              ), onTap: () async {
            if (f.status) {
              await controller.readProduto();
              controller.promocao = f;
              controller.promocao.status = false;
              controller.selectedItem = f.produto.nome;
              controller.selectedItemId = controller.produtosId
                  .elementAt(controller.produtos.indexOf(f.produto.nome));
              List list = await controller.update();
              if (list.elementAt(0)) {
                Modular.to.pushReplacementNamed("/promocao");
              }
            } else {
              Scaffold.of(contex).showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Não podes ativar promoção, cria outra"),
                    ],
                  ),
                  backgroundColor: Colors.red,
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
            }
          }),
          DataCell(
            Container(
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: button(
                () async {
                  await controller.readProduto();
                  textControllerInicio.text = dataInicio;
                  textControllerFim.text = dataFim;
                  controller.promocao = f;
                  controller.selectedItem = f.produto.nome;
                  controller.selectedItemId = controller.produtosId
                      .elementAt(controller.produtos.indexOf(f.produto.nome));
                  titulo = "Edição";
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

  Future<void> show(BuildContext context) async {
    showDialog(
      context: context,
      builder: (co) {
        return alert(co);
      },
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
      //title: Text("                       $titulo Fornecedor"),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text("$titulo Promoção")],
      ),
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
        height: 400,
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: ListView(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 40)),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: inputText(
                  "Data Inicio",
                  (c) => c == null || c.isEmpty ? "Data Inicio invalida" : null,
                  (c) {},
                  Icons.date_range,
                  TextInputType.text,
                  controller: textControllerInicio, onTap: () async {
                var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.parse(controller.promocao.dataInicio),
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
                  textControllerInicio.text = "$day/$month/${date.year}";
                  controller..promocao.dataInicio = "${date.year}-$month-$day";
                }
              }),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: inputText(
                  "Data Fim",
                  (c) => c == null || c.isEmpty ? "Data Fim invalida" : null,
                  (c) {},
                  Icons.date_range,
                  TextInputType.text,
                  controller: textControllerFim, onTap: () async {
                var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.parse(controller.promocao.dataFim),
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
                  textControllerFim.text = "$day/$month/${date.year}";
                  controller.promocao.dataFim = "${date.year}-$month-$day";
                }
              }),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: inputText(
                "Valor",
                (c) => c == null || c.isEmpty ? "Codigo invalida" : null,
                (c) => controller.promocao.valor = double.parse(c),
                Icons.memory,
                TextInputType.text,
                initialValue: controller.promocao.valor == null
                    ? ""
                    : controller.promocao.valor.toString(),
              ),
            ),
            Text(
              "Produto:",
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
                  controller.selectedItemId = controller.produtosId
                      .elementAt(controller.produtos.indexOf(string));
                },
                selectedItemBuilder: (BuildContext context) {
                  return controller.produtos.map<Widget>((String item) {
                    return Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(item),
                    );
                  }).toList();
                },
                items: controller.produtos.map((String item) {
                  return DropdownMenuItem<String>(
                    child: Text(item),
                    value: item,
                  );
                }).toList(),
              );
            }),
            Padding(padding: EdgeInsets.only(top: 20)),
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
      var list = titulo == "Novo"
          ? await controller.create()
          : await controller.update();
      Modular.to.pop();
      if (list.elementAt(0)) {
        scalf = true;
        List<Object> list = List();
        list.insert(0, true);
        list.insert(1, titulo);
        Modular.to.pushReplacementNamed("/promocao/", arguments: list);
      } else {
        Scaffold.of(contex).showSnackBar(
          SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text(list.elementAt(1))],
            ),
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
    if (time)
      return "$day/$month/${date.year} $hour:$minute:$second";
    else
      return "$day/$month/${date.year}";
  }
}

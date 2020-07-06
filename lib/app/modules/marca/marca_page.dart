import 'dart:async';

import 'package:facturamobile/app/res/app_theme.dart';
import 'package:facturamobile/app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'marca_controller.dart';
import 'models/marca.dart';

class MarcaPage extends StatefulWidget {
  final ModularArguments args;
  const MarcaPage(this.args, {Key key}) : super(key: key);

  @override
  _MarcaPageState createState() => _MarcaPageState();
}

class _MarcaPageState extends ModularState<MarcaPage, MarcaController> {
  bool scalf = false;
  BuildContext contex;
  String titulo = "";
  final formKey = GlobalKey<FormState>();
  final textController = TextEditingController();

  @override
  void initState() {
    List<Object> list = widget.args?.data;
    if (list != null) {
      titulo = list.elementAt(1);
      scalf = list.elementAt(0);
    }
    super.initState();
    Timer(Duration(milliseconds: 250), () => mostrarScalf());
  }

  Widget mostrarScalf() {
    String text = titulo == "Novo" ? "adicionado" : "atualizado";
    if (scalf) {
      print("js");
      Scaffold.of(contex).showSnackBar(
        SnackBar(
          content: Text(
              "                                     Marca $text com sucesso"),
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
                  'Marca',
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
                () {
                  titulo = "Novo";
                  controller.marca = Marca();
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

  Widget criarTabela(List<Marca> clist, BuildContext context) {
    return DataTable(
      columns: <DataColumn>[
        DataColumn(
            label: Text(
          'Nome',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        DataColumn(
            label: Text(
          'Data do Registro',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        DataColumn(
            label: Text(
          'Data de Atualização',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        DataColumn(label: Text('')),
      ],
      rows: linhas(clist, context),
    );
  }

  List<DataRow> linhas(List<Marca> clist, BuildContext context) {
    List<DataRow> listaLinhas = new List();
    clist.forEach((f) {
      if (!f.dataAlteracao.contains("/"))
        f.dataAlteracao = formatDate(f.dataAlteracao, true);
      if (!f.dataCriacao.contains("/"))
        f.dataCriacao = formatDate(f.dataCriacao, true);
      var dataRow = DataRow(
        cells: <DataCell>[
          DataCell(Text(
            f.nome,
            style: TextStyle(fontSize: 15),
          )),
          DataCell(Text(
            f.dataCriacao,
            style: TextStyle(fontSize: 15),
          )),
          DataCell(Text(
            f.dataAlteracao,
            style: TextStyle(fontSize: 15),
          )),
          DataCell(
            Container(
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: button(
                () {
                  controller.marca = f;
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
      title: Text("                       $titulo Marca"),
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
        height: 200,
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: ListView(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 40)),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: inputText(
                "Nome",
                (c) => c == null || c.isEmpty ? "Nome invalido" : null,
                (c) => controller.marca.nome = c,
                Icons.near_me,
                TextInputType.text,
                initialValue:
                    controller.marca.nome == null ? "" : controller.marca.nome,
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
      var list = titulo == "Novo"
          ? await controller.create()
          : await controller.update();
      Modular.to.pop();
      if (list.elementAt(0)) {
        print(scalf.toString() + "ssss");
        scalf = true;
        print(scalf.toString() + "tttt");
        List<Object> list = List();
        list.insert(0, true);
        list.insert(1, titulo);
        Modular.to.pushReplacementNamed("/marca/", arguments: list);
      } else {
        Scaffold.of(contex).showSnackBar(
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

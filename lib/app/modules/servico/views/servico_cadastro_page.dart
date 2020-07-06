import 'package:facturamobile/app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../servico_controller.dart';

class ServicoCadastroPage extends StatefulWidget {
  static const String routeName = '/servicoCadastro';

  @override
  _ServicoCadastroPageState createState() => _ServicoCadastroPageState();
}

class _ServicoCadastroPageState extends ModularState<ServicoCadastroPage, ServicoController> {
 bool mudar = false;
  final formKey = GlobalKey<FormState>();
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Card(
        elevation: 10,
        child: FutureBuilder(
            future: controller.readTipoProduto(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              } else {
                return Form(
                  key: formKey,
                  child: criarFormulario(),
                );
              }
            }),
      ),
    ));
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
                setState(() {
                  mudar = mudar ? false : true;
                });
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
                      activeColor: mudar
                          ? Colors.greenAccent
                          : Colors.grey.withOpacity(0.6),
                      onChanged: (bool value) {
                        setState(() {
                          mudar = mudar ? false : true;
                          controller.produto.status = mudar;
                        });
                      },
                      value: mudar,
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
    );
  }

  void validar() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      var list = await controller.create();
      if (list.elementAt(0)) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(
                "                                     Produto adicionado com sucesso"),
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

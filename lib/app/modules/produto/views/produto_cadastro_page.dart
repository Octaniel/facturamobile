import 'package:facturamobile/app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../produto_controller.dart';

class ProdutoCadastroPage extends StatefulWidget {
  static const String routeName = '/produtoCadastro';

  @override
  _ProdutoCadastroPageState createState() => _ProdutoCadastroPageState();
}

class _ProdutoCadastroPageState
    extends ModularState<ProdutoCadastroPage, ProdutoController> {
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
              (c) => c == null || c.isEmpty ? "Preço da Venda invalido" : null,
              (c) => controller.produto.precoVenda = double.parse(c),
              Icons.nfc,
              TextInputType.text,
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
            ),
          ),
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
                          print(mudar);
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
            margin: EdgeInsets.only(bottom: 20),
            child: inputText(
              "Unidade",
              (c) => c == null || c.isEmpty ? "unidade invalida" : null,
              (c) => controller.produto.unidade = c,
              Icons.merge_type,
              TextInputType.text,
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
            child: inputText(
                "Data Validade",
                (c) =>null,
                (c) {},
                Icons.date_range,
                TextInputType.text,
                controller: textController, onTap: () async {
              var date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
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

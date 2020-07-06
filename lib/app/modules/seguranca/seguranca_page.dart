import 'dart:async';

import 'package:facturamobile/app/res/app_theme.dart';
import 'package:facturamobile/app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'seguranca_controller.dart';

class SegurancaPage extends StatefulWidget {
  final String title;
  const SegurancaPage({Key key, this.title = "Seguranca"}) : super(key: key);

  @override
  _SegurancaPageState createState() => _SegurancaPageState();
}

class _SegurancaPageState
    extends ModularState<SegurancaPage, SegurancaController> {
  //use 'controller' variable to access controller
  final formKey = GlobalKey<FormState>();

  var linearProgress = false;

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 0));
    return true;
  }

  @override
  Widget build(BuildContext contex) {
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
                  appBar("Login"),
                  Expanded(
                    child: FutureBuilder<bool>(
                      future: getData(),
                      builder:
                          (BuildContext context, AsyncSnapshot<bool> snapshot) {
                        if (!snapshot.hasData) {
                          return const SizedBox();
                        } else {
                          return loginForm(context);
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

  Widget loginForm(BuildContext contex) {
    return Container(
      child: Card(
        elevation: 10,
        child: Form(
          key: formKey,
          child: criarFormulario(contex),
        ),
      ),
    );
  }

  Widget criarFormulario(BuildContext contex) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: 50,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: inputText(
              "Email",
              (c) => c == null || c.isEmpty
                  ? "Preenche o email"
                  : c.contains("@") ? null : "Email invalido",
              (c) => controller.setEmail(c),
              Icons.email,
              TextInputType.text,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: inputText(
              "Senha",
              (c) => c == null || c.isEmpty ? "Senha invalida" : null,
              (c) => controller.setSenha(c),
              Icons.lock,
              TextInputType.text,
              obscureText: true,
            ),
          ),
          Container(
            height: 40,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: button(
              () => validar(contex),
              Text("Logar"),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 10),
          ),
          linearProgress ? LinearProgressIndicator() : Container(),
        ],
      ),
    );
  }

  void validar(BuildContext contex) async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      setState(() {
        linearProgress = true;
      });
      if (await controller.logar())
        Modular.to.pushReplacementNamed("/home");
      else {
        Scaffold.of(contex).showSnackBar(
          SnackBar(
            content: Text(
                "                                         Email ou Senha Invalido"),
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
        setState(() {
          linearProgress = false;
        });
      }
    }
  }
}

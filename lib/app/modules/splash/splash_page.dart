import 'dart:async';

import 'package:facturamobile/app/modules/seguranca/seguranca_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'splash_controller.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  //use 'controller' variable to access controller

  var repository = SegurancaRepository();

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), (){
      verificarToken();
    });
  }

  Future verificarToken()async{
   if (!await repository.verificarERenovarToken()){
    Modular.to.pushReplacementNamed("/login");
   }else{
     Modular.to.pushReplacementNamed("/home");
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.redAccent,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50,
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.greenAccent,
                          size: 50,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10),),
                      Text(
                        "b-Fatura",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                )
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(padding: EdgeInsets.only(top: 20),),
                    Text(
                      "Loja online \n para todos",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                  ],
                ),
                ),
            ],
          )
        ],
      )
    );
  }
}

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:facturamobile/app/modules/produto/views/produto_cadastro_page.dart';
import 'package:facturamobile/app/modules/produto/views/produto_pesquisa_page.dart';
import 'package:facturamobile/app/res/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'produto_controller.dart';

class ProdutoPage extends StatefulWidget {
  final ModularArguments args;
  const ProdutoPage(this.args,{Key key}) : super(key: key);

  @override
  _ProdutoPageState createState() => _ProdutoPageState();
}

class _ProdutoPageState extends ModularState<ProdutoPage, ProdutoController> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
                          return SizedBox.expand(
                            child: PageView(
                              controller: _pageController,
                              onPageChanged: (index) {
                                setState(() => _currentIndex = index);
                              },
                              children: <Widget>[
                                ProdutoPesquisaPage(widget.args),
                                ProdutoCadastroPage(),
                              ],
                            ),
                          );
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
      bottomNavigationBar: bottomNav(),
    );
  }

  Widget bottomNav() {
    return BottomNavyBar(
      selectedIndex: _currentIndex,
      showElevation: true, // use this to remove appBar's elevation
      onItemSelected: (index) => setState(() {
        _currentIndex = index;
        _pageController.animateToPage(index,
            duration: Duration(milliseconds: 300), curve: Curves.ease);
      }),
      items: [
        BottomNavyBarItem(
          icon: Icon(Icons.list),
          title: Text('Pesquisa'),
          activeColor: Colors.red,
        ),
        BottomNavyBarItem(
            icon: Icon(Icons.add),
            title: Text('Cadastro'),
            activeColor: Colors.purpleAccent),
      ],
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
                  'Produto',
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
  }

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
    this.titulo,
  });

  String navigateScreen;
  String imagePath;
  String titulo;

  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/images/cliente.png',
      navigateScreen: "/cliente",
      titulo: 'Cliente',
    ),
    HomeList(
      imagePath: 'assets/images/compra.png',
      navigateScreen: "/compra",
      titulo: 'Compra',
    ),
    HomeList(
      imagePath: 'assets/images/empresa.png',
      navigateScreen: "/empresa",
      titulo: 'Empresa',
    ),
    HomeList(
      imagePath: 'assets/images/fatura.png',
      navigateScreen: "/cliente",
      titulo: 'Fatura',
    ),
    HomeList(
      imagePath: 'assets/images/fornecedor.png',
      navigateScreen: "/fornecedor",
      titulo: 'Fornecedor',
    ),
    HomeList(
      imagePath: 'assets/images/produto.png',
      navigateScreen: "/produto",
      titulo: 'Produto',
    ),
    HomeList(
      imagePath: 'assets/images/servico.png',
      navigateScreen: "/servico",
      titulo: 'Serviço',
    ),
    HomeList(
      imagePath: 'assets/images/venda.png',
      navigateScreen: "/venda",
      titulo: 'Venda',
    ),
  ];
}

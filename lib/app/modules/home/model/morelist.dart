

class MoreList {
  MoreList({
    this.navigateScreen,
    this.imagePath = '',
    this.titulo,
  });

  String navigateScreen;
  String imagePath;
  String titulo;

  static List<MoreList> homeList = [
    MoreList(
      imagePath: 'assets/images/cliente.png',
      navigateScreen: "/marca",
      titulo: 'Marca',
    ),
    MoreList(
      imagePath: 'assets/images/compra.png',
      navigateScreen: "/modelo",
      titulo: 'Modelo',
    ),
    MoreList(
      imagePath: 'assets/images/empresa.png',
      navigateScreen: "/promocao",
      titulo: 'Promoção',
    ),
    MoreList(
      imagePath: 'assets/images/fatura.png',
      navigateScreen: "/tipoProduto",
      titulo: 'Tipo de Produto',
    ),
   MoreList(
      imagePath: 'assets/images/produto.png',
      navigateScreen: "/tipoProduto",
      titulo: 'Tipo de Serviço',
    ),
    MoreList(
      imagePath: 'assets/images/fornecedor.png',
      navigateScreen: "/serie",
      titulo: 'Serie',
    ),
  ];
}

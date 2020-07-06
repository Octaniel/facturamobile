// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutoController on _ProdutoControllerBase, Store {
  final _$produtoAtom = Atom(name: '_ProdutoControllerBase.produto');

  @override
  Produto get produto {
    _$produtoAtom.context.enforceReadPolicy(_$produtoAtom);
    _$produtoAtom.reportObserved();
    return super.produto;
  }

  @override
  set produto(Produto value) {
    _$produtoAtom.context.conditionallyRunInAction(() {
      super.produto = value;
      _$produtoAtom.reportChanged();
    }, _$produtoAtom, name: '${_$produtoAtom.name}_set');
  }

  final _$selectedItemAtom = Atom(name: '_ProdutoControllerBase.selectedItem');

  @override
  String get selectedItem {
    _$selectedItemAtom.context.enforceReadPolicy(_$selectedItemAtom);
    _$selectedItemAtom.reportObserved();
    return super.selectedItem;
  }

  @override
  set selectedItem(String value) {
    _$selectedItemAtom.context.conditionallyRunInAction(() {
      super.selectedItem = value;
      _$selectedItemAtom.reportChanged();
    }, _$selectedItemAtom, name: '${_$selectedItemAtom.name}_set');
  }

  final _$selectedItemIdAtom =
      Atom(name: '_ProdutoControllerBase.selectedItemId');

  @override
  int get selectedItemId {
    _$selectedItemIdAtom.context.enforceReadPolicy(_$selectedItemIdAtom);
    _$selectedItemIdAtom.reportObserved();
    return super.selectedItemId;
  }

  @override
  set selectedItemId(int value) {
    _$selectedItemIdAtom.context.conditionallyRunInAction(() {
      super.selectedItemId = value;
      _$selectedItemIdAtom.reportChanged();
    }, _$selectedItemIdAtom, name: '${_$selectedItemIdAtom.name}_set');
  }

  final _$selectedItemMAtom =
      Atom(name: '_ProdutoControllerBase.selectedItemM');

  @override
  String get selectedItemM {
    _$selectedItemMAtom.context.enforceReadPolicy(_$selectedItemMAtom);
    _$selectedItemMAtom.reportObserved();
    return super.selectedItemM;
  }

  @override
  set selectedItemM(String value) {
    _$selectedItemMAtom.context.conditionallyRunInAction(() {
      super.selectedItemM = value;
      _$selectedItemMAtom.reportChanged();
    }, _$selectedItemMAtom, name: '${_$selectedItemMAtom.name}_set');
  }

  final _$selectedItemMIdAtom =
      Atom(name: '_ProdutoControllerBase.selectedItemMId');

  @override
  int get selectedItemMId {
    _$selectedItemMIdAtom.context.enforceReadPolicy(_$selectedItemMIdAtom);
    _$selectedItemMIdAtom.reportObserved();
    return super.selectedItemMId;
  }

  @override
  set selectedItemMId(int value) {
    _$selectedItemMIdAtom.context.conditionallyRunInAction(() {
      super.selectedItemMId = value;
      _$selectedItemMIdAtom.reportChanged();
    }, _$selectedItemMIdAtom, name: '${_$selectedItemMIdAtom.name}_set');
  }

  final _$valueAtom = Atom(name: '_ProdutoControllerBase.value');

  @override
  bool get value {
    _$valueAtom.context.enforceReadPolicy(_$valueAtom);
    _$valueAtom.reportObserved();
    return super.value;
  }

  @override
  set value(bool value) {
    _$valueAtom.context.conditionallyRunInAction(() {
      super.value = value;
      _$valueAtom.reportChanged();
    }, _$valueAtom, name: '${_$valueAtom.name}_set');
  }

  final _$createAsyncAction = AsyncAction('create');

  @override
  Future<List<Object>> create() {
    return _$createAsyncAction.run(() => super.create());
  }

  final _$readAsyncAction = AsyncAction('read');

  @override
  Future<List<ProdutoResumo>> read() {
    return _$readAsyncAction.run(() => super.read());
  }

  final _$readTipoProdutoAsyncAction = AsyncAction('readTipoProduto');

  @override
  Future<dynamic> readTipoProduto() {
    return _$readTipoProdutoAsyncAction.run(() => super.readTipoProduto());
  }

  final _$readModeloAsyncAction = AsyncAction('readModelo');

  @override
  Future<dynamic> readModelo() {
    return _$readModeloAsyncAction.run(() => super.readModelo());
  }

  final _$readbyIdAsyncAction = AsyncAction('readbyId');

  @override
  Future<Produto> readbyId(int idProduto) {
    return _$readbyIdAsyncAction.run(() => super.readbyId(idProduto));
  }

  final _$updateAsyncAction = AsyncAction('update');

  @override
  Future<List<Object>> update() {
    return _$updateAsyncAction.run(() => super.update());
  }

  @override
  String toString() {
    final string =
        'produto: ${produto.toString()},selectedItem: ${selectedItem.toString()},selectedItemId: ${selectedItemId.toString()},selectedItemM: ${selectedItemM.toString()},selectedItemMId: ${selectedItemMId.toString()},value: ${value.toString()}';
    return '{$string}';
  }
}

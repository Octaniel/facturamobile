// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servico_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ServicoController on _ServicoControllerBase, Store {
  final _$produtoAtom = Atom(name: '_ServicoControllerBase.produto');

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

  final _$selectedItemAtom = Atom(name: '_ServicoControllerBase.selectedItem');

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
      Atom(name: '_ServicoControllerBase.selectedItemId');

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

  final _$selectedItemTAtom =
      Atom(name: '_ServicoControllerBase.selectedItemT');

  @override
  String get selectedItemT {
    _$selectedItemTAtom.context.enforceReadPolicy(_$selectedItemTAtom);
    _$selectedItemTAtom.reportObserved();
    return super.selectedItemT;
  }

  @override
  set selectedItemT(String value) {
    _$selectedItemTAtom.context.conditionallyRunInAction(() {
      super.selectedItemT = value;
      _$selectedItemTAtom.reportChanged();
    }, _$selectedItemTAtom, name: '${_$selectedItemTAtom.name}_set');
  }

  final _$selectedItemTIdAtom =
      Atom(name: '_ServicoControllerBase.selectedItemTId');

  @override
  int get selectedItemTId {
    _$selectedItemTIdAtom.context.enforceReadPolicy(_$selectedItemTIdAtom);
    _$selectedItemTIdAtom.reportObserved();
    return super.selectedItemTId;
  }

  @override
  set selectedItemTId(int value) {
    _$selectedItemTIdAtom.context.conditionallyRunInAction(() {
      super.selectedItemTId = value;
      _$selectedItemTIdAtom.reportChanged();
    }, _$selectedItemTIdAtom, name: '${_$selectedItemTIdAtom.name}_set');
  }

  final _$selectedItemMAtom =
      Atom(name: '_ServicoControllerBase.selectedItemM');

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
      Atom(name: '_ServicoControllerBase.selectedItemMId');

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

  final _$valueAtom = Atom(name: '_ServicoControllerBase.value');

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
  Future<List<ServicoResumo>> read() {
    return _$readAsyncAction.run(() => super.read());
  }

  final _$readTipoProdutoAsyncAction = AsyncAction('readTipoProduto');

  @override
  Future<dynamic> readTipoProduto() {
    return _$readTipoProdutoAsyncAction.run(() => super.readTipoProduto());
  }

  final _$readTaxaAsyncAction = AsyncAction('readTaxa');

  @override
  Future<dynamic> readTaxa() {
    return _$readTaxaAsyncAction.run(() => super.readTaxa());
  }

  final _$readMotivoIsencaoAsyncAction = AsyncAction('readMotivoIsencao');

  @override
  Future<dynamic> readMotivoIsencao() {
    return _$readMotivoIsencaoAsyncAction.run(() => super.readMotivoIsencao());
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
        'produto: ${produto.toString()},selectedItem: ${selectedItem.toString()},selectedItemId: ${selectedItemId.toString()},selectedItemT: ${selectedItemT.toString()},selectedItemTId: ${selectedItemTId.toString()},selectedItemM: ${selectedItemM.toString()},selectedItemMId: ${selectedItemMId.toString()},value: ${value.toString()}';
    return '{$string}';
  }
}

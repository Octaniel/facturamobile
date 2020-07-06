// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compra_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CompraController on _CompraControllerBase, Store {
  final _$compraAtom = Atom(name: '_CompraControllerBase.compra');

  @override
  Compra get compra {
    _$compraAtom.context.enforceReadPolicy(_$compraAtom);
    _$compraAtom.reportObserved();
    return super.compra;
  }

  @override
  set compra(Compra value) {
    _$compraAtom.context.conditionallyRunInAction(() {
      super.compra = value;
      _$compraAtom.reportChanged();
    }, _$compraAtom, name: '${_$compraAtom.name}_set');
  }

  final _$iAtom = Atom(name: '_CompraControllerBase.i');

  @override
  int get i {
    _$iAtom.context.enforceReadPolicy(_$iAtom);
    _$iAtom.reportObserved();
    return super.i;
  }

  @override
  set i(int value) {
    _$iAtom.context.conditionallyRunInAction(() {
      super.i = value;
      _$iAtom.reportChanged();
    }, _$iAtom, name: '${_$iAtom.name}_set');
  }

  final _$selectedItemAtom = Atom(name: '_CompraControllerBase.selectedItem');

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
      Atom(name: '_CompraControllerBase.selectedItemId');

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

  final _$selectedItemFAtom = Atom(name: '_CompraControllerBase.selectedItemF');

  @override
  String get selectedItemF {
    _$selectedItemFAtom.context.enforceReadPolicy(_$selectedItemFAtom);
    _$selectedItemFAtom.reportObserved();
    return super.selectedItemF;
  }

  @override
  set selectedItemF(String value) {
    _$selectedItemFAtom.context.conditionallyRunInAction(() {
      super.selectedItemF = value;
      _$selectedItemFAtom.reportChanged();
    }, _$selectedItemFAtom, name: '${_$selectedItemFAtom.name}_set');
  }

  final _$selectedItemFIdAtom =
      Atom(name: '_CompraControllerBase.selectedItemFId');

  @override
  int get selectedItemFId {
    _$selectedItemFIdAtom.context.enforceReadPolicy(_$selectedItemFIdAtom);
    _$selectedItemFIdAtom.reportObserved();
    return super.selectedItemFId;
  }

  @override
  set selectedItemFId(int value) {
    _$selectedItemFIdAtom.context.conditionallyRunInAction(() {
      super.selectedItemFId = value;
      _$selectedItemFIdAtom.reportChanged();
    }, _$selectedItemFIdAtom, name: '${_$selectedItemFIdAtom.name}_set');
  }

  final _$valueAtom = Atom(name: '_CompraControllerBase.value');

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
  Future<List<CompraResumo>> read() {
    return _$readAsyncAction.run(() => super.read());
  }

  final _$readProdutoAsyncAction = AsyncAction('readProduto');

  @override
  Future<dynamic> readProduto() {
    return _$readProdutoAsyncAction.run(() => super.readProduto());
  }

  final _$readFornecedorAsyncAction = AsyncAction('readFornecedor');

  @override
  Future<dynamic> readFornecedor() {
    return _$readFornecedorAsyncAction.run(() => super.readFornecedor());
  }

  final _$readbyIdAsyncAction = AsyncAction('readbyId');

  @override
  Future<Compra> readbyId(int idProduto) {
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
        'compra: ${compra.toString()},i: ${i.toString()},selectedItem: ${selectedItem.toString()},selectedItemId: ${selectedItemId.toString()},selectedItemF: ${selectedItemF.toString()},selectedItemFId: ${selectedItemFId.toString()},value: ${value.toString()}';
    return '{$string}';
  }
}

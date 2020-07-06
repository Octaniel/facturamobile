// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promocao_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PromocaoController on _PromocaoControllerBase, Store {
  final _$promocaoAtom = Atom(name: '_PromocaoControllerBase.promocao');

  @override
  Promocao get promocao {
    _$promocaoAtom.context.enforceReadPolicy(_$promocaoAtom);
    _$promocaoAtom.reportObserved();
    return super.promocao;
  }

  @override
  set promocao(Promocao value) {
    _$promocaoAtom.context.conditionallyRunInAction(() {
      super.promocao = value;
      _$promocaoAtom.reportChanged();
    }, _$promocaoAtom, name: '${_$promocaoAtom.name}_set');
  }

  final _$selectedItemAtom = Atom(name: '_PromocaoControllerBase.selectedItem');

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
      Atom(name: '_PromocaoControllerBase.selectedItemId');

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

  final _$createAsyncAction = AsyncAction('create');

  @override
  Future<List<Object>> create() {
    return _$createAsyncAction.run(() => super.create());
  }

  final _$readAsyncAction = AsyncAction('read');

  @override
  Future<List<Promocao>> read() {
    return _$readAsyncAction.run(() => super.read());
  }

  final _$readProdutoAsyncAction = AsyncAction('readProduto');

  @override
  Future<dynamic> readProduto() {
    return _$readProdutoAsyncAction.run(() => super.readProduto());
  }

  final _$updateAsyncAction = AsyncAction('update');

  @override
  Future<List<Object>> update() {
    return _$updateAsyncAction.run(() => super.update());
  }

  @override
  String toString() {
    final string =
        'promocao: ${promocao.toString()},selectedItem: ${selectedItem.toString()},selectedItemId: ${selectedItemId.toString()}';
    return '{$string}';
  }
}

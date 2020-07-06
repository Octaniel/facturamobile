// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fornecedor_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FornecedorController on _FornecedorControllerBase, Store {
  final _$fornecedorAtom = Atom(name: '_FornecedorControllerBase.fornecedor');

  @override
  Fornecedor get fornecedor {
    _$fornecedorAtom.context.enforceReadPolicy(_$fornecedorAtom);
    _$fornecedorAtom.reportObserved();
    return super.fornecedor;
  }

  @override
  set fornecedor(Fornecedor value) {
    _$fornecedorAtom.context.conditionallyRunInAction(() {
      super.fornecedor = value;
      _$fornecedorAtom.reportChanged();
    }, _$fornecedorAtom, name: '${_$fornecedorAtom.name}_set');
  }

  final _$selectedItemAtom =
      Atom(name: '_FornecedorControllerBase.selectedItem');

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

  final _$valueDropAtom = Atom(name: '_FornecedorControllerBase.valueDrop');

  @override
  String get valueDrop {
    _$valueDropAtom.context.enforceReadPolicy(_$valueDropAtom);
    _$valueDropAtom.reportObserved();
    return super.valueDrop;
  }

  @override
  set valueDrop(String value) {
    _$valueDropAtom.context.conditionallyRunInAction(() {
      super.valueDrop = value;
      _$valueDropAtom.reportChanged();
    }, _$valueDropAtom, name: '${_$valueDropAtom.name}_set');
  }

  final _$createAsyncAction = AsyncAction('create');

  @override
  Future<List<Object>> create() {
    return _$createAsyncAction.run(() => super.create());
  }

  final _$readAsyncAction = AsyncAction('read');

  @override
  Future<List<Fornecedor>> read() {
    return _$readAsyncAction.run(() => super.read());
  }

  final _$updateAsyncAction = AsyncAction('update');

  @override
  Future<List<Object>> update() {
    return _$updateAsyncAction.run(() => super.update());
  }

  @override
  String toString() {
    final string =
        'fornecedor: ${fornecedor.toString()},selectedItem: ${selectedItem.toString()},valueDrop: ${valueDrop.toString()}';
    return '{$string}';
  }
}

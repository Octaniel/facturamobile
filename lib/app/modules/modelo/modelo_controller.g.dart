// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modelo_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ModeloController on _ModeloControllerBase, Store {
  final _$modeloAtom = Atom(name: '_ModeloControllerBase.modelo');

  @override
  Modelo get modelo {
    _$modeloAtom.context.enforceReadPolicy(_$modeloAtom);
    _$modeloAtom.reportObserved();
    return super.modelo;
  }

  @override
  set modelo(Modelo value) {
    _$modeloAtom.context.conditionallyRunInAction(() {
      super.modelo = value;
      _$modeloAtom.reportChanged();
    }, _$modeloAtom, name: '${_$modeloAtom.name}_set');
  }

  final _$selectedItemAtom = Atom(name: '_ModeloControllerBase.selectedItem');

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
      Atom(name: '_ModeloControllerBase.selectedItemId');

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
  Future<List<Modelo>> read() {
    return _$readAsyncAction.run(() => super.read());
  }

  final _$readMarcaAsyncAction = AsyncAction('readMarca');

  @override
  Future<dynamic> readMarca() {
    return _$readMarcaAsyncAction.run(() => super.readMarca());
  }

  final _$updateAsyncAction = AsyncAction('update');

  @override
  Future<List<Object>> update() {
    return _$updateAsyncAction.run(() => super.update());
  }

  @override
  String toString() {
    final string =
        'modelo: ${modelo.toString()},selectedItem: ${selectedItem.toString()},selectedItemId: ${selectedItemId.toString()}';
    return '{$string}';
  }
}

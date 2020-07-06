// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serie_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SerieController on _SerieControllerBase, Store {
  final _$dateAtom = Atom(name: '_SerieControllerBase.date');

  @override
  DateTime get date {
    _$dateAtom.context.enforceReadPolicy(_$dateAtom);
    _$dateAtom.reportObserved();
    return super.date;
  }

  @override
  set date(DateTime value) {
    _$dateAtom.context.conditionallyRunInAction(() {
      super.date = value;
      _$dateAtom.reportChanged();
    }, _$dateAtom, name: '${_$dateAtom.name}_set');
  }

  final _$serieAtom = Atom(name: '_SerieControllerBase.serie');

  @override
  Serie get serie {
    _$serieAtom.context.enforceReadPolicy(_$serieAtom);
    _$serieAtom.reportObserved();
    return super.serie;
  }

  @override
  set serie(Serie value) {
    _$serieAtom.context.conditionallyRunInAction(() {
      super.serie = value;
      _$serieAtom.reportChanged();
    }, _$serieAtom, name: '${_$serieAtom.name}_set');
  }

  final _$selectedItemAtom = Atom(name: '_SerieControllerBase.selectedItem');

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
      Atom(name: '_SerieControllerBase.selectedItemId');

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
  Future<List<Serie>> read() {
    return _$readAsyncAction.run(() => super.read());
  }

  final _$readTipoDocumentoAsyncAction = AsyncAction('readTipoDocumento');

  @override
  Future<dynamic> readTipoDocumento() {
    return _$readTipoDocumentoAsyncAction.run(() => super.readTipoDocumento());
  }

  final _$updateAsyncAction = AsyncAction('update');

  @override
  Future<List<Object>> update() {
    return _$updateAsyncAction.run(() => super.update());
  }

  @override
  String toString() {
    final string =
        'date: ${date.toString()},serie: ${serie.toString()},selectedItem: ${selectedItem.toString()},selectedItemId: ${selectedItemId.toString()}';
    return '{$string}';
  }
}

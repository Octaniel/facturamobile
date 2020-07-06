// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tipo_produto_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TipoProdutoController on _TipoProdutoControllerBase, Store {
  final _$tipoProdutoAtom =
      Atom(name: '_TipoProdutoControllerBase.tipoProduto');

  @override
  TipoProduto get tipoProduto {
    _$tipoProdutoAtom.context.enforceReadPolicy(_$tipoProdutoAtom);
    _$tipoProdutoAtom.reportObserved();
    return super.tipoProduto;
  }

  @override
  set tipoProduto(TipoProduto value) {
    _$tipoProdutoAtom.context.conditionallyRunInAction(() {
      super.tipoProduto = value;
      _$tipoProdutoAtom.reportChanged();
    }, _$tipoProdutoAtom, name: '${_$tipoProdutoAtom.name}_set');
  }

  final _$createAsyncAction = AsyncAction('create');

  @override
  Future<List<Object>> create(String natureza) {
    return _$createAsyncAction.run(() => super.create(natureza));
  }

  final _$readAsyncAction = AsyncAction('read');

  @override
  Future<List<TipoProduto>> read(String natureza) {
    return _$readAsyncAction.run(() => super.read(natureza));
  }

  final _$updateAsyncAction = AsyncAction('update');

  @override
  Future<List<Object>> update() {
    return _$updateAsyncAction.run(() => super.update());
  }

  @override
  String toString() {
    final string = 'tipoProduto: ${tipoProduto.toString()}';
    return '{$string}';
  }
}

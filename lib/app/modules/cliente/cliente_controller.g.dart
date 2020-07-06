// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClienteController on _ClienteControllerBase, Store {
  final _$nomeAtom = Atom(name: '_ClienteControllerBase.nome');

  @override
  String get nome {
    _$nomeAtom.context.enforceReadPolicy(_$nomeAtom);
    _$nomeAtom.reportObserved();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.context.conditionallyRunInAction(() {
      super.nome = value;
      _$nomeAtom.reportChanged();
    }, _$nomeAtom, name: '${_$nomeAtom.name}_set');
  }

  final _$nifAtom = Atom(name: '_ClienteControllerBase.nif');

  @override
  String get nif {
    _$nifAtom.context.enforceReadPolicy(_$nifAtom);
    _$nifAtom.reportObserved();
    return super.nif;
  }

  @override
  set nif(String value) {
    _$nifAtom.context.conditionallyRunInAction(() {
      super.nif = value;
      _$nifAtom.reportChanged();
    }, _$nifAtom, name: '${_$nifAtom.name}_set');
  }

  final _$idAtom = Atom(name: '_ClienteControllerBase.id');

  @override
  int get id {
    _$idAtom.context.enforceReadPolicy(_$idAtom);
    _$idAtom.reportObserved();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.context.conditionallyRunInAction(() {
      super.id = value;
      _$idAtom.reportChanged();
    }, _$idAtom, name: '${_$idAtom.name}_set');
  }

  final _$createAsyncAction = AsyncAction('create');

  @override
  Future<List<Object>> create() {
    return _$createAsyncAction.run(() => super.create());
  }

  final _$readAsyncAction = AsyncAction('read');

  @override
  Future<List<Cliente>> read() {
    return _$readAsyncAction.run(() => super.read());
  }

  final _$updateAsyncAction = AsyncAction('update');

  @override
  Future<List<Object>> update() {
    return _$updateAsyncAction.run(() => super.update());
  }

  final _$_ClienteControllerBaseActionController =
      ActionController(name: '_ClienteControllerBase');

  @override
  void setId(int id) {
    final _$actionInfo = _$_ClienteControllerBaseActionController.startAction();
    try {
      return super.setId(id);
    } finally {
      _$_ClienteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNome(String nome) {
    final _$actionInfo = _$_ClienteControllerBaseActionController.startAction();
    try {
      return super.setNome(nome);
    } finally {
      _$_ClienteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNif(String nif) {
    final _$actionInfo = _$_ClienteControllerBaseActionController.startAction();
    try {
      return super.setNif(nif);
    } finally {
      _$_ClienteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'nome: ${nome.toString()},nif: ${nif.toString()},id: ${id.toString()}';
    return '{$string}';
  }
}

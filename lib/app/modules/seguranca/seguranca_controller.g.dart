// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seguranca_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SegurancaController on _SegurancaControllerBase, Store {
  final _$emailAtom = Atom(name: '_SegurancaControllerBase.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$senhaAtom = Atom(name: '_SegurancaControllerBase.senha');

  @override
  String get senha {
    _$senhaAtom.context.enforceReadPolicy(_$senhaAtom);
    _$senhaAtom.reportObserved();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.context.conditionallyRunInAction(() {
      super.senha = value;
      _$senhaAtom.reportChanged();
    }, _$senhaAtom, name: '${_$senhaAtom.name}_set');
  }

  final _$_SegurancaControllerBaseActionController =
      ActionController(name: '_SegurancaControllerBase');

  @override
  void setEmail(String email) {
    final _$actionInfo =
        _$_SegurancaControllerBaseActionController.startAction();
    try {
      return super.setEmail(email);
    } finally {
      _$_SegurancaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String senha) {
    final _$actionInfo =
        _$_SegurancaControllerBaseActionController.startAction();
    try {
      return super.setSenha(senha);
    } finally {
      _$_SegurancaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'email: ${email.toString()},senha: ${senha.toString()}';
    return '{$string}';
  }
}

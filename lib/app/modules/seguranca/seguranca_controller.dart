import 'package:dio/dio.dart';
import 'package:facturamobile/app/modules/seguranca/seguranca_repository.dart';
import 'package:mobx/mobx.dart';

part 'seguranca_controller.g.dart';

class SegurancaController = _SegurancaControllerBase with _$SegurancaController;

abstract class _SegurancaControllerBase with Store {
 @observable
 String email = "";
 @action
 void setEmail(String email){
  this.email = email;
 }

 @observable
 String senha = "";
 @action
 void setSenha(String senha){
   this.senha=senha;
 }

 final repository = SegurancaRepository();

 _SegurancaControllerBase();


 Future<bool> logar(){
   return repository.fetchPost(senha,email);
 }
 Future<bool> logout(){
   return repository.logout();
 }

}

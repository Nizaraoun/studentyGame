import 'package:get/get.dart';

class CustomdrawerController extends GetxController {
  String? mail;
  String password = '';
  String Nom = '';
  String Prenom = '';
  String Age = '';
  String Phone = '';
  void add(String mail, String password) {
    this.mail = mail;
    this.password = password;
    update();
  }
}

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frontend/view/menu/choixmaladie.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CustomaddController extends GetxController {
  late String nom;
  late String prenom;
  late int age;
  late int phone;
  late int cin;
  late String mald = '';
  late String num = '';
  late String malad = 'لم يتم تحديد المرض بعد';
  late String nmb = '';

  void add(
    String nom,
    String prenom,
    int age,
    int cin,
    int phone,
  ) {
    this.nom = nom;
    this.prenom = prenom;
    this.age = age;
    this.phone = phone;
    this.cin = cin;
    update();
  }

  void getmaladie(String mal) {
    mald = mal;
    update();
  }

  void addUser(String name, maladie) async {
    final CollectionReference users =
        FirebaseFirestore.instance.collection(name);

    // Check if the 'users' collection exists, if not, create it
    await users.doc(maladie).set({
      'phone': phone,
      'cin': cin,
      'age': age,
      'nom': nom,
      'prenom': prenom,
    }, SetOptions(merge: true)).then((value) {
      malad = "  القسم :" + mald;
      nmb = num;
      Get.to(Maladies());
    }).catchError((error) {
      print('Error adding user: $error');
    });
  }

  void getCollectionLength(String col) async {
    // Reference to the collection
    CollectionReference collection = FirebaseFirestore.instance.collection(col);

    // Get documents from the collection
    QuerySnapshot querySnapshot = await collection.get();

    num = "المريض رقم " + (querySnapshot.size + 1).toString();

    // Print the number of documents in the collection
    print('Number of documents in the collection: ${querySnapshot.size}');
  }
}

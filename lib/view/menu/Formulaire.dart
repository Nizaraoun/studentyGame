import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/view/menu/widget/costumtextform.dart';
import 'package:get/get.dart';

import '../../controller/choixcontroller.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final TextEditingController nomController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController cinController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var mwd = MediaQuery.of(context).size.width;
    var mhd = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('  الرجاء ادخال المعلومات',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontFamily: 'Amiri',
                fontSize: mwd * 0.07,
                fontWeight: FontWeight.bold)),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/image/logo.jpg',
            height: double.infinity,
            filterQuality: FilterQuality.high,
            width: double.infinity,
            fit: BoxFit.scaleDown,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formstate,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'الرجاء ادخال الاسم';
                          }
                        },
                        controller: nomController,
                        decoration: const InputDecoration(
                          labelText: 'الاسم',
                          fillColor: Color.fromRGBO(0, 0, 0, 0.178),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        )),
                    SizedBox(height: mhd * 0.02),
                    TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'الرجاء ادخال اللقب';
                          }
                        },
                        controller: prenomController,
                        decoration: const InputDecoration(
                          hintTextDirection: TextDirection.rtl,
                          labelText: 'اللقب',
                          alignLabelWithHint: true,
                          fillColor: Color.fromRGBO(0, 0, 0, 0.178),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        )),
                    SizedBox(height: mhd * 0.02),
                    TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        maxLength: 8,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          if (value.length == 8) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        validator: (value) {
                          if (value?.length != 8) {
                            return "الرجاء ادخال رقم بطاقة التعريف";
                          }

                          return null;
                        },
                        controller: cinController,
                        decoration: const InputDecoration(
                          labelText: 'رقم بطاقة التعريف',
                          fillColor: Color.fromRGBO(0, 0, 0, 0.178),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        )),
                    SizedBox(height: mhd * 0.02),
                    TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        maxLength: 8,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          if (value.length == 8) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        validator: (value) {
                          if (value?.length != 8) {
                            return "الرجاء ادخال رقم  الهاتف";
                          }

                          return null;
                        },
                        controller: phoneController,
                        decoration: const InputDecoration(
                          labelText: 'الهاتف',
                          fillColor: Color.fromRGBO(0, 0, 0, 0.178),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        )),
                    SizedBox(height: mhd * 0.02),
                    TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        maxLength: 2,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          if (value.length == 2) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        validator: (value) {
                          if (value?.length != 2) {
                            return "الرجاء ادخال العمر";
                          }

                          return null;
                        },
                        controller: ageController,
                        decoration: const InputDecoration(
                          labelText: 'العمر',
                          fillColor: Color.fromRGBO(0, 0, 0, 0.178),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        )),

                    // Customtextform(
                    //   Controller: nomController,
                    //   label: 'الاسم',
                    // ),
                    // SizedBox(height: mhd * 0.02),
                    // Customtextform(
                    //   Controller: prenomController,
                    //   label: 'اللقب',
                    // ),
                    // SizedBox(height: mhd * 0.02),
                    // Customtextform(
                    //   Controller: ageController,
                    //   label: 'العمر',
                    // ),
                    // SizedBox(height: mhd * 0.02),
                    // Customtextform(
                    //   Controller: addressController,
                    //   label: 'العنوان',
                    // ),

                    SizedBox(height: mhd * 0.08),
                    Center(
                        child: GetBuilder<CustomaddController>(
                            init: CustomaddController(),
                            builder: (controller) {
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor:
                                      Color.fromARGB(242, 0, 255, 208),
                                  fixedSize: Size(mwd / 1.2, 50), // foreground
                                ),
                                onPressed: () {
                                  var formdata = formstate.currentState;
                                  if (formdata!.validate()) {
                                    try {
                                      controller.add(
                                          nomController.text,
                                          prenomController.text,
                                          int.parse(ageController.text),
                                          int.parse(cinController.text),
                                          int.parse(phoneController.text));
                                      controller.addUser(
                                          controller.mald, controller.num);
                                      // Access the entered values
                                    } catch (e) {
                                      print(e);
                                    }
                                  }
                                },
                                child: const Text('التسجيل',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500)),
                              );
                            }))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

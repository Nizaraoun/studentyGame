// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Function/snackError.dart';
import '../../model/commun/decoration.dart';

bool isValidEmail(String email) {
  final RegExp regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  return regExp.hasMatch(email);
}

class RestPassword extends StatefulWidget {
  const RestPassword({Key? key}) : super(key: key);

  @override
  State<RestPassword> createState() => _RestPasswordState();
}

class _RestPasswordState extends State<RestPassword> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController mail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Container(
            height: Get.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/bg_login.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 100, left: 20),
                  child: Text(
                    'استرجاع الحساب',
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w600,
                        fontSize: 30),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'البريد',
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Form(
                    key: formstate,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "البريد الالكتروني فارغ";
                        }
                      },
                      controller: mail,
                      onSaved: (value) {
                        mail.text = value!;
                      },
                      decoration: decoration_input_txt()
                          .deco(Icon(Icons.email), "أدخل البريد", 20.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Color.fromARGB(255, 252, 252, 252),
                          backgroundColor: Color.fromARGB(255, 185, 20, 20),
                          fixedSize: const Size(200, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () async {
                          var formdata = formstate.currentState;
                          if (formdata!.validate()) {
                            try {
                              await FirebaseAuth.instance
                                  .sendPasswordResetEmail(email: mail.text);

                              showSnackError(
                                "تم إرسال رسالة إلى بريدك الإلكتروني",
                                "يرجى التحقق من بريدك الإلكتروني لإعادة تعيين كلمة المرور الخاصة بك",
                              );
                            } catch (e) {
                              showSnackError(
                                "خطأ",
                                "البريد الإلكتروني غير مسجل",
                              );
                            }
                          }
                        },
                        child: const Text('إرسال',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600)))),
              ]),
        ],
      ),
    );
  }
}

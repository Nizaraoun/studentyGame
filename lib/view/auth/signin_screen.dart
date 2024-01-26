// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../../Function/data_local.dart';
import '../../Function/snackError.dart';
import '../../controller/homecontroller.dart';
import '../../model/commun/decoration.dart';
import '../../model/commun/text_style.dart';
import '../../model/usermodel.dart';
import 'register_screen.dart';

bool isValidEmail(String email) {
  final RegExp regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  return regExp.hasMatch(email);
}

// ignore: camel_case_types
class singe extends StatefulWidget {
  const singe({super.key});

  @override
  State<singe> createState() => _singeState();
}

bool x = false;
bool p = true;

// ignore: camel_case_types
class _singeState extends State<singe> {
  // ignore: unnecessary_new
  TextEditingController username = new TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController passeword = TextEditingController();
  TextEditingController phone = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    var mwd = MediaQuery.of(context).size.width;
    var mhd = MediaQuery.of(context).size.height;
    var inputDecoration = InputDecoration(
      prefixIcon: const Icon(Icons.lock),
      suffixIcon: IconButton(
        icon: Icon(
          p ? Icons.visibility : Icons.visibility_off,
          color: const Color.fromARGB(255, 251, 0, 0),
        ),
        onPressed: () {
          setState(() {
            p = !p;
          });
        },
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      hintText: 'الرجاء ادخال كلمة السر',
    );
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: mhd,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/sente.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Center(
            child: SizedBox(
          width: 350,
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 150),
                      child: textstyle().textStyle("انشاء حساب جديد",
                          Color.fromARGB(255, 0, 0, 0), 30, FontWeight.bold)),
                  Form(
                      key: formstate,
                      child: GetBuilder<homecontroller>(
                        init: homecontroller(),
                        builder: (controller) => Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: username,
                              // ignore: body_might_complete_normally_nullable
                              validator: (value) {
                                if (value!.isEmpty ||
                                    value.length < 3 ||
                                    value.length > 7) {
                                  return "الرجاء ادخال الاسم ";
                                }
                              },
                              decoration: decoration_input_txt()
                                  .deco(Icon(Icons.person), "الاسم", 20.0),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: email,
                              decoration: decoration_input_txt().deco(
                                  Icon(Icons.email), "البريد الالكتروني", 20.0),
                              validator: (value) {
                                if (value!.isEmpty || !isValidEmail(value)) {
                                  return " الرجاء ادخال البريد الالكتروني الصحيح";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: phone,
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
                                  return "الرجاء ادخال رقم الهاتف الصحيح";
                                }

                                return null;
                              },
                              decoration: decoration_input_txt()
                                  .deco(Icon(Icons.phone), "الهاتف", 20.0),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: passeword,
                              obscureText: p,
                              decoration: inputDecoration,
                              validator: (value) {
                                if (value!.isEmpty ||
                                    value.length < 6 ||
                                    !RegExp(
                                      r'\d',
                                    ).hasMatch(value) ||
                                    !RegExp(r'[A-Z]').hasMatch(value)) {
                                  return "كلمة السر ضعيفة";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      )),
                  GetBuilder<homecontroller>(
                    builder: (controller) => Container(
                      margin: const EdgeInsets.only(top: 20, right: 5, left: 5),
                      child: ElevatedButton(
                        onPressed: (() async {
                          var formdata = formstate.currentState;
                          if (formdata!.validate()) {
                            try {
                              final credential = await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                email: email.text,
                                password: passeword.text,
                              );

                              if (credential.user != null) {
                                UserProfile userProfile = UserProfile(
                                  name: username.text,
                                  email: email.text,
                                  phone: phone.text,
                                );

                                saveUserProfile(userProfile);

                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => login()),
                                );
                              }
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                // ignore: use_build_context_synchronously
                                showSnackError(
                                  "كلمة السر ضعيفة",
                                  "يجب أن تكون كلمة المرور 6 أحرف على الأقل",
                                );
                              } else if (e.code == 'email-already-in-use') {
                                // ignore: use_build_context_synchronously
                                showSnackError(
                                  "البريد الالكتروني مستخدم",
                                  "البريد الالكتروني مستخدم من قبل",
                                );
                              }
                            } catch (e) {
                              print(e);
                            }
                          }
                        }),
                        style: ElevatedButton.styleFrom(
                          foregroundColor:
                              const Color.fromARGB(255, 64, 209, 41),
                          backgroundColor:
                              const Color.fromARGB(255, 176, 47, 47),
                          fixedSize: const Size(200, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          ' تسجيل الدخول ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: mwd * 0.3,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => login());
                    },
                    child: const Text("تملك حساب ؟ سجل الان",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Color.fromARGB(255, 79, 15, 255))),
                  ),
                ],
              ),
            ],
          ),
        ))
      ],
    ));
  }
}
